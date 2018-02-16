//
//  RCIResortDetailViewController.m
//  RCIDemo
//
//  Created by teammobility on 12/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIResortDetailViewController.h"
#import "RCIResortOverviewViewController.h"
#import "RCIResortRatingAndReviewViewController.h"
#import "RCIResortFlightOptionViewController.h"

@interface RCIResortDetailViewController ()

@end



@implementation RCIResortDetailViewController
- (instancetype)init {
    self = [super init];
    if (self){
        [self configureControllers];
    }
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadControllerAtIndex:0];

}

-(void)configureControllers {
    RCIResortOverviewViewController *overView = [[RCIResortOverviewViewController alloc] init];
    RCIResortRatingAndReviewViewController *ratingAndReview = [[RCIResortRatingAndReviewViewController alloc] init];
    RCIResortFlightOptionViewController *flightOption = [[RCIResortFlightOptionViewController alloc] init];
    self.viewControllers = @[overView, ratingAndReview, flightOption];
    [self setTitle:@"Overview" atIndex:0];
    [self setTitle:@"Ratings & Reviews" atIndex:1];
    [self setTitle:@"Flight options" atIndex:2];

    

}

@end
