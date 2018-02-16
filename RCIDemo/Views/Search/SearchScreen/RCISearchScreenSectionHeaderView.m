//
//  RCISearchScreenSectionHeaderView.m
//  RCIDemo
//
//  Created by teammobility on 14/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCISearchScreenSectionHeaderView.h"
@interface RCISearchScreenSectionHeaderView ()
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation RCISearchScreenSectionHeaderView

-(instancetype)initWithTitle:(NSString*)title {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _title = title;
        [self setupUI];
    }
    return self;
}

-(void)setupUI {
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.titleLabel.text = self.title;
    [self addSubview:self.titleLabel];
    
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-16-[titleLabel]" options:0 metrics:nil views:@{@"titleLabel":self.titleLabel}]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[titleLabel]-|" options:0 metrics:nil views:@{@"titleLabel":self.titleLabel}]];

}

@end
