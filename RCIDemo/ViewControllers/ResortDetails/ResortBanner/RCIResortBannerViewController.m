//
//  RCIResortBannerViewController.m
//  RCIDemo
//
//  Created by teammobility on 12/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIResortBannerViewController.h"

@interface RCIResortBannerViewController ()
@property (nonatomic, strong) UIImageView *background;

@end

@implementation RCIResortBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self activateConstraints];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTranslucent:YES];

}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setTranslucent:NO];

}

-(void)setupView {
    self.view.backgroundColor = [UIColor orangeColor];
    self.background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"banner"]];
    self.background.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.background];
}

-(void)activateConstraints {
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[background]|" options:0 metrics:nil views:@{@"background":self.background}]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[background]|" options:0 metrics:nil views:@{@"background":self.background}]];
}
@end
