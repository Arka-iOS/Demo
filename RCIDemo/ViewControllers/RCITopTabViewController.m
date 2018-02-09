//
//  RCITopTabViewController.m
//  RCIDemo
//
//  Created by teammobility on 12/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCITopTabViewController.h"
#import "RCITopTabBarView.h"
#import "RCITopTabBarItem.h"
#import "RCITopTabrViewControllerDelegate.h"
#import "UIView+FrameHelper.h"


@interface RCITopTabViewController ()<RCITopTabBarViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) RCITopTabBarView *tabContainerView;
@property (nonatomic, strong) NSMutableDictionary *metrics;
@property (nonatomic, copy) NSMutableDictionary *titles;
@property (nonatomic, weak) id <RCITopTabrViewControllerDelegate> delegate;
@property (nonatomic, assign) BOOL isViewTransitionAnimationCompleted;
@property (nonatomic) BOOL isFirstLoad;
@end

@implementation RCITopTabViewController

#pragma mark Public Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    self.isFirstLoad = YES;
    self.isViewTransitionAnimationCompleted = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupView];
    [self setupConstraints];
    [self reloadTabItems];
    [self setupGesture];
}

- (void)onStatusBarFrameChanged {
    if (self.tabContainerView) {
        [self.tabContainerView onOrientationChange];
    }
}

- (void)loadControllerAtIndex:(NSUInteger)newSelectedIndex {
    NSInteger previousIndex = self.selectedIndex;
    
    if (self.isFirstLoad) {
        previousIndex = NSNotFound;
        self.isFirstLoad = NO;
    }
    
    if (!self.isViewTransitionAnimationCompleted) {
        return;
    }
    
    if (newSelectedIndex == previousIndex) {
        return;
    }
    
    UIViewController *toViewController = newSelectedIndex < [self.viewControllers count] ? (self.viewControllers)[newSelectedIndex] : nil;
    
    if (!toViewController) {
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:atIndex:)]) {
        if (![self.delegate tabBarController:self shouldSelectViewController:toViewController atIndex:newSelectedIndex]) return;
    }
    
    self.selectedIndex = newSelectedIndex;
    
    if (previousIndex == NSNotFound) {
        [self displayContentController:self.viewControllers[newSelectedIndex]];
    } else {
        [self transitionFromController:self.viewControllers[previousIndex] toController:self.viewControllers[newSelectedIndex]];
    }
    
    self.tabContainerView.selectedIndex = newSelectedIndex;
    
    if ([self.delegate respondsToSelector:@selector(tabBarController:didSelectViewController:atIndex:)]) {
        [self.delegate tabBarController:self didSelectViewController:toViewController atIndex:newSelectedIndex];
    }
}

- (void)setTitle:(NSString *)title atIndex:(NSInteger)index {
    [self.titles setObject:title forKey:[NSString stringWithFormat:@"%@", @(index)]];
    [self.tabContainerView setTitle:title atIndex:index];
}

#pragma mark Private Methods
- (void)setupView {
    self.tabContainerView = ({
        RCITopTabBarView *topView = [[RCITopTabBarView alloc] initWithNumberOfSegments:[self.viewControllers count]];
        topView.translatesAutoresizingMaskIntoConstraints = NO;
        topView.delegate = self;
        topView;
    });
    
    [self.view addSubview:_tabContainerView];
}

- (NSMutableDictionary *)metrics {
    if (!_metrics) {
        _metrics = [[NSMutableDictionary alloc]init];
        [_metrics setObject:@([self tabBarHeight]) forKey:@"tabBarHeight"];
    }
    
    return _metrics;
}

- (void)setupConstraints {
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tabBar]|" options:0 metrics:nil views:@{ @"tabBar": self.tabContainerView }]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tabBar(tabBarHeight)]" options:0 metrics:self.metrics views:@{ @"tabBar": self.tabContainerView }]];
}

- (NSMutableDictionary *)titles {
    if (!_titles) {
        _titles = [NSMutableDictionary dictionary];
    }
    
    return _titles;
}

- (void)reloadTabItems {
    for (NSString *index in [self.titles allKeys]) {
        [self.tabContainerView setTitle:[self.titles valueForKey:index] atIndex:[index integerValue]];
    }
    
    [self loadControllerAtIndex:self.selectedIndex];
}

- (void)setupGesture {
    UISwipeGestureRecognizer *rightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedRight:)];
    
    rightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    rightRecognizer.numberOfTouchesRequired = 1;
    rightRecognizer.delegate = self;
    [self.view addGestureRecognizer:rightRecognizer];
    
    UISwipeGestureRecognizer *leftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedLeft:)];
    leftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    leftRecognizer.numberOfTouchesRequired = 1;
    leftRecognizer.delegate = self;
    [self.view addGestureRecognizer:leftRecognizer];
}

- (void)swipedRight:(UISwipeGestureRecognizer *)sender {
    if (self.selectedIndex > 0) {
        [self loadControllerAtIndex:self.selectedIndex - 1];
    }
}

- (void)swipedLeft:(UISwipeGestureRecognizer *)sender {
    if (self.selectedIndex < [self.viewControllers count] - 1) {
        [self loadControllerAtIndex:self.selectedIndex + 1];
    }
}

- (void)tabMenuTappedAtIndex:(NSInteger)index {
    NSInteger previousIndex = self.selectedIndex;
    
    if (previousIndex != index) {
        [self loadControllerAtIndex:index];
    }
}

- (void)deselectTabIndex:(NSInteger)index {
    if (index < [self.viewControllers count]) {
        [self hideContentController:self.viewControllers[index]];
    }
}

- (void)displayContentController:(UIViewController *)content {
    [self addChildViewController:content];
    content.view.frame = [self frameForContentController];
    [self.view addSubview:content.view];
    [content didMoveToParentViewController:self];
}

- (void)transitionFromController:(UIViewController *)fromController toController:(UIViewController *)toController {
    self.isViewTransitionAnimationCompleted = NO;
    
    [fromController willMoveToParentViewController:nil];
    toController.view.frame = [self frameForContentController];
    
    NSInteger fromIndex = [self.viewControllers indexOfObject:fromController];
    NSInteger toIndex = [self.viewControllers indexOfObject:toController];
    
    if (fromIndex < toIndex) {
        [toController.view setX:toController.view.width];
    } else {
        [toController.view setX:-toController.view.width];
    }
    
    [self addChildViewController:toController];
    
    [self transitionFromViewController:fromController
                      toViewController:toController
                              duration:0.3
                               options:UIViewAnimationOptionTransitionNone
                            animations:^{
                                [toController.view
                                 setX:0];
                                
                                if (fromIndex < toIndex) {
                                    [fromController.view
                                     setX:-toController.view.width];
                                } else {
                                    [fromController.view
                                     setX:toController.view.width];
                                }
                            }
                            completion:^(BOOL finished) {
                                [fromController removeFromParentViewController];
                                [toController didMoveToParentViewController:self];
                                self.isViewTransitionAnimationCompleted = YES;
                            }];
}


- (void)hideContentController:(UIViewController *)content {
    [content willMoveToParentViewController:nil];
    [content.view removeFromSuperview];
    [content removeFromParentViewController];
}

- (CGRect)frameForContentController {
    CGRect rect = self.view.frame;
    CGFloat tabBarHeight = [self tabBarHeight];
    
    rect.origin.y = tabBarHeight;
    rect.size.height -= tabBarHeight;
    return rect;
}

- (CGFloat)tabBarHeight {
    return 44.0f;
}

- (void)switchTab:(NSUInteger)index {
    [self loadControllerAtIndex:index];
}


@end
