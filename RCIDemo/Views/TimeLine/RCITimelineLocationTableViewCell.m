//
//  RCITimelineLocationTableViewCell.m
//  RCIDemo
//
//  Created by teammobility on 16/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCITimelineLocationTableViewCell.h"
#import <CoreGraphics/CoreGraphics.h>

@interface RCITimelineLocationTableViewCell ()
@property (nonatomic, weak) IBOutlet UIView *roundView;
@end
@implementation RCITimelineLocationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.roundView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.roundView.layer setShadowOpacity:0.5];
    [self.roundView.layer setShadowRadius:3.0];
    [self.roundView.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
