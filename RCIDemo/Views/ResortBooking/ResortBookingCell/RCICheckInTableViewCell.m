//
//  RCICheckInTableViewCell.m
//  RCIDemo
//
//  Created by teammobility on 07/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCICheckInTableViewCell.h"

@interface RCICheckInTableViewCell ()
@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *radioButtons;
@end

@implementation RCICheckInTableViewCell

-(void)awakeFromNib {
    [super awakeFromNib];
    UIButton *radio = self.radioButtons[0];
    radio.selected = YES;
}

-(IBAction)radioTapped:(UIButton*)sender {
    for (UIButton *radio in self.radioButtons) {
        radio.selected = NO;
    }
    sender.selected = YES;
    if ([self.delegate respondsToSelector:@selector(radioTapped)]) {
        [self.delegate radioTapped];
    }
}

@end
