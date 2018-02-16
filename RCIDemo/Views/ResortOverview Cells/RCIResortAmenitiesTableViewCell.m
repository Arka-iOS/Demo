//
//  RCIResortAmenitiesTableViewCell.m
//  RCIDemo
//
//  Created by teammobility on 29/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIResortAmenitiesTableViewCell.h"
#import <CoreGraphics/CoreGraphics.h>

@interface RCIResortAmenitiesTableViewCell()
@property (nonatomic, weak) IBOutlet UIView *borderView;
@end

@implementation RCIResortAmenitiesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.borderView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.borderView.layer.borderWidth = 0.5f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
