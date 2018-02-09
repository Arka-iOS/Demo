//
//  RCIAboutThisResortTableViewCell.m
//  RCIDemo
//
//  Created by teammobility on 19/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIAboutThisResortTableViewCell.h"

@interface RCIAboutThisResortTableViewCell()
@property (nonatomic, assign) BOOL isExpanded;
@property (nonatomic, assign) IBOutlet NSLayoutConstraint* textHeight;
@property (nonatomic, weak) IBOutlet UITextView *aboutThisResort;

@end

@implementation RCIAboutThisResortTableViewCell

-(IBAction)arrowTapped:(UIButton*)sender {
    self.isExpanded = !self.isExpanded;
    CGFloat fixedWidth = self.aboutThisResort.frame.size.width;
    CGSize newSize = [self.aboutThisResort sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = self.aboutThisResort.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    self.textHeight.constant = self.isExpanded ? newFrame.size.height: 85
    ;
    if([self.delegate respondsToSelector:@selector(expandTableViewForCell:)]){
        [self.delegate expandTableViewForCell:self];
    }
}
@end
