//
//  RCIResortDetailContainerViewController.m
//  RCIDemo
//
//  Created by teammobility on 12/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIResortDetailContainerViewController.h"
#import "RCIResortDetailViewController.h"
#import "RCIResortBannerViewController.h"
static const NSInteger bannerViewHeight= 200;
static const NSInteger navigationBarHeighht= 64;

@interface RCIResortDetailContainerViewController ()
@property (nonatomic, strong) RCIResortDetailViewController *resortDeatilViewController;
@property (nonatomic, strong) RCIResortBannerViewController *resortBannerViewController;


@end

@implementation RCIResortDetailContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"DETAILS";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.topItem.title = @"";
    [self addChildViewControllers];
}


-(RCIResortBannerViewController*)resortBannerViewController {
    if (!_resortBannerViewController){
        _resortBannerViewController = [[RCIResortBannerViewController alloc] init];
    }
    return _resortBannerViewController;
}

-(RCIResortDetailViewController*)resortDeatilViewController {
    if (!_resortDeatilViewController){
        _resortDeatilViewController = [[RCIResortDetailViewController alloc] init];
    }
    return _resortDeatilViewController;
}

-(void)addChildViewControllers {
    [self addChildViewController:self.resortBannerViewController];
    [self.resortBannerViewController.view setFrame:CGRectMake(0.0f, navigationBarHeighht, self.view.frame.size.width, bannerViewHeight)];
    [self.view addSubview:self.resortBannerViewController.view];
    [self.resortBannerViewController didMoveToParentViewController:self];
    
    [self addChildViewController:self.resortDeatilViewController];
    [self.resortDeatilViewController.view setFrame:CGRectMake(0.0f,(bannerViewHeight + navigationBarHeighht), self.view.frame.size.width, self.view.frame.size.height-bannerViewHeight - navigationBarHeighht)];
    [self.view addSubview:self.resortDeatilViewController.view];
    [self.resortDeatilViewController didMoveToParentViewController:self];
}

@end
