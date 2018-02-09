//
//  RCIAreaInfoTableViewCell.m
//  RCIDemo
//
//  Created by teammobility on 19/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIAreaInfoTableViewCell.h"

@interface RCIAreaInfoTableViewCell()
@property (nonatomic, assign) BOOL isExpanded;
@property (nonatomic, assign) IBOutlet NSLayoutConstraint* textHeight;
@property (nonatomic, weak) IBOutlet UITextView *destinationHighlights;

@end

@implementation RCIAreaInfoTableViewCell

-(IBAction)arrowTapped:(UIButton*)sender {
    self.isExpanded = !self.isExpanded;
    CGFloat fixedWidth = self.destinationHighlights.frame.size.width;
    CGSize newSize = [self.destinationHighlights sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = self.destinationHighlights.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    self.textHeight.constant = self.isExpanded ? newFrame.size.height: 90;
    ;
    if([self.delegate respondsToSelector:@selector(expandTableViewForCell:)]){
        [self.delegate expandTableViewForCell:self];
    }
}
@end
