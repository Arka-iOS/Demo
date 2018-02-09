//
//  RCIAddProtectionPointTableViewCell.m
//  RCIDemo
//
//  Created by teammobility on 08/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIAddProtectionPointTableViewCell.h"
@interface RCIAddProtectionPointTableViewCell()
@property (nonatomic, weak) IBOutlet UIButton *checkbox;
@end


@implementation RCIAddProtectionPointTableViewCell

-(void)awakeFromNib {
    [super awakeFromNib];
    self.checkbox.selected = YES;
}

-(IBAction)checkboxTapped:(UIButton*)sender {
    sender.selected = !sender.selected;
}

@end
