//
//  RCIPaymentStatusViewController.m
//  RCIDemo
//
//  Created by teammobility on 19/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIPaymentStatusViewController.h"
#import <CoreGraphics/CoreGraphics.h>

@interface RCIPaymentStatusViewController ()
@property (nonatomic, weak) IBOutlet UIButton *okButton;
@property (nonatomic, weak) IBOutlet UIButton *viewVacationButton;

@end

@implementation RCIPaymentStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewVacationButton.layer.borderColor = [UIColor colorWithRed:238/255.f green:238/255.f blue:238/255.f alpha:1.0].CGColor;
    self.viewVacationButton.layer.borderWidth = 1.0f;
    [self.viewVacationButton.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.viewVacationButton.layer setShadowOpacity:0.2];
    [self.viewVacationButton.layer setShadowRadius:2.0];
    [self.viewVacationButton.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
}

-(IBAction)okTapped:(id)sender {
    UITabBarController *controller = (UITabBarController*) [self presentingViewController];
    [self dismissViewControllerAnimated:NO completion:nil];
    UINavigationController *navController = [controller.viewControllers objectAtIndex:2];
    [navController popToRootViewControllerAnimated:NO];
}

-(IBAction)viewVacationTapped:(id)sender {
    UITabBarController *controller = (UITabBarController*) [self presentingViewController];
    [controller setSelectedIndex:3];
    [self okTapped:nil];

    
}

@end
