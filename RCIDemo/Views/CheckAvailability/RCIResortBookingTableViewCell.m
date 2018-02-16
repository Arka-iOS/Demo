//
//  RCIResortBookingTableViewCell.m
//  RCIDemo
//
//  Created by teammobility on 02/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIResortBookingTableViewCell.h"

@implementation RCIResortBookingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)cconfirmTapped:(id)sender {
    if([self.delegate respondsToSelector:@selector(confirmButtonTapped)]){
        [self.delegate confirmButtonTapped];
    }
}

@end
