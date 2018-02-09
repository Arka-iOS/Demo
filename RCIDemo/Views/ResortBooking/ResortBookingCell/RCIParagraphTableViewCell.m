//
//  RCIParagraphTableViewCell.m
//  RCIDemo
//
//  Created by teammobility on 09/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIParagraphTableViewCell.h"
@interface RCIParagraphTableViewCell()
@property (nonatomic, weak) IBOutlet UIButton *checkbox;
@end

@implementation RCIParagraphTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.checkbox.selected = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)checkboxTapped:(UIButton*)sender {
    sender.selected = !sender.selected;
}

@end
