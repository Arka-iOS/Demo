//
//  RCITopTabBarItem.m
//  RCIDemo
//
//  Created by teammobility on 12/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCITopTabBarItem.h"

@interface RCITopTabBarItem ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *bottomView;
@end

@implementation RCITopTabBarItem

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createTabItem];
    }
    return self;
}

- (void)createTabItem {
    _titleLabel = ({
        UILabel *titleLabel = [UILabel new];
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [titleLabel setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:titleLabel];
        titleLabel;
    });
    
    _bottomView = ({
        UIView *bottomView = [UIView new];
        bottomView.translatesAutoresizingMaskIntoConstraints = NO;
        bottomView.backgroundColor = [UIColor colorWithRed:89/255.f green:206/255.f blue:219/255.f alpha:1.0];
        [_titleLabel addSubview:bottomView];
        bottomView;
    });
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[titleLabel]|" options:0 metrics:nil views:@{ @"titleLabel": self.titleLabel }]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[titleLabel]|" options:0 metrics:nil views:@{ @"titleLabel": self.titleLabel }]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[bottomView]-|" options:0 metrics:nil views:@{ @"bottomView": self.bottomView }]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bottomView(2)]|" options:0 metrics:nil views:@{ @"bottomView": self.bottomView }]];
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

- (void)selectItem {
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.backgroundColor = [UIColor whiteColor];
    self.bottomView.hidden = NO;
}

- (void)deselectItem {
    self.titleLabel.textColor = [UIColor darkGrayColor];
    self.titleLabel.backgroundColor = [UIColor whiteColor];
    self.bottomView.hidden = YES;
}

- (NSString *)title {
    return self.titleLabel.text;
}

@end
