//
//  RCIResortBookingContainerViewController.m
//  RCIDemo
//
//  Created by teammobility on 06/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIResortBookingContainerViewController.h"
#import "RCIResortBookingContainerView.h"
#import "RCIResortBookingSegmentView.h"
#import "RCIResortBookingVerifyViewController.h"
#import "RCIResortBookingAddViewController.h"
#import "RCIResortBookingFooterDelegate.h"
#import "RCIResortBookingFooterView.h"
#import "RCIPaymentStatusViewController.h"

#define kFooterViewHeight 55
#define ktopMargin 90

@interface RCIResortBookingContainerViewController () <RCIResortBookingFooterDelegate>

@property (nonatomic, strong) RCIResortBookingContainerView *mainView;
@property (nonatomic, strong) RCIResortBookingVerifyViewController *resortBookingVerifyViewController;
@property (nonatomic, strong) RCIResortBookingAddViewController *resortBookingAddViewController;
@property (nonatomic, copy) NSArray *viewControllers;
@property (nonatomic) BOOL isFirstLoad;


@end

@implementation RCIResortBookingContainerViewController

-(instancetype)initWithViewControllers:(NSArray *)viewcontrollers {
    self = [super init];
    if (self) {
        _viewControllers = viewcontrollers;
    }
    return self;
}

-(void)loadView {
    self.mainView = [[RCIResortBookingContainerView alloc] initWithNumberOfSegments:4];
    self.view = self.mainView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"RCI POINTS® EXCHANGE";
    UIBarButtonItem *cross = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"cross"] style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem = cross;
    [self.mainView.segmentView setTitle:@"Verify" atIndex:0];
    [self.mainView.segmentView setTitle:@"Add" atIndex:1];
    [self.mainView.segmentView setTitle:@"Pay" atIndex:2];
    [self.mainView.segmentView setTitle:@"Confirm" atIndex:3];
    self.mainView.segmentView.selectedIndex = 0;
    self.mainView.footerView.delegate = self;
    self.isFirstLoad = YES;

}

- (void) displayContentController: (UIViewController*) content {
    [self addChildViewController:content];
    content.view.frame = [self frameForContentController];
    [self.view addSubview:content.view];
    [content didMoveToParentViewController:self];
}

- (CGRect)frameForContentController {
    CGRect rect = self.view.frame;
    CGFloat tabBarHeight = ktopMargin;
    
    rect.origin.y = tabBarHeight;
    rect.size.height -= tabBarHeight + kFooterViewHeight;
    return rect;
}

- (void) hideContentController: (UIViewController*) content {
    [content willMoveToParentViewController:nil];
    [content.view removeFromSuperview];
    [content removeFromParentViewController];
}

-(void)loadControllerAtIndex:(NSInteger)newSelectedIndex {
    NSInteger previousIndex = self.selectedIndex;
    
    if (self.isFirstLoad) {
        previousIndex = NSNotFound;
        self.isFirstLoad = NO;
    }
    
    if (newSelectedIndex == previousIndex) {
        return;
    }

    UIViewController *toViewController = newSelectedIndex < [self.viewControllers count] ? (self.viewControllers)[newSelectedIndex] : nil;
    UIViewController *fromViewController = previousIndex < [self.viewControllers count] ? (self.viewControllers)[previousIndex] : nil;

    if (!toViewController) {
        return;
    }
    self.selectedIndex = newSelectedIndex;
    [self displayContentController:toViewController];
    [self hideContentController:fromViewController];
    self.mainView.segmentView.selectedIndex = newSelectedIndex;
}

-(void)goToNextSegment:(RCIResortBookingFooterView*)footer {
    if (self.selectedIndex == 3) {
        [self confirmPayment];
        return;
    }
    NSInteger newIndex = self.selectedIndex + 1;
    [self loadControllerAtIndex:newIndex];
    BOOL enablePrevious = newIndex > 0;
    
    enablePrevious ? [footer enablePrevious] : [footer disablePrevious];
    newIndex == 3 ? [footer changeContinueToConfirm]: [footer changeConfirmToContinue];
}

-(void)goToPreviousSegment:(RCIResortBookingFooterView*)footer {
    if (self.selectedIndex == 0) return;
    NSInteger newIndex = self.selectedIndex - 1;
    [self loadControllerAtIndex:newIndex];
    BOOL enablePrevious = newIndex > 0;
    enablePrevious ? [footer enablePrevious] : [footer disablePrevious];
    newIndex == 3 ? [footer changeContinueToConfirm]: [footer changeConfirmToContinue];
}

-(void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)confirmPayment {
    RCIPaymentStatusViewController *status = [[RCIPaymentStatusViewController alloc] initWithNibName:@"RCIPaymentStatusViewController" bundle:nil];
    [self.navigationController pushViewController:status animated:YES];
}
@end
