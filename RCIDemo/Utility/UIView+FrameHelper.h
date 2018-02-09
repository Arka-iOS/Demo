//
//  UIView+FrameHelper.h
//  RCIDemo
//
//  Created by teammobility on 17/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameHelper)
- (CGFloat)width;
- (id)setX:(CGFloat)x;
+ (UIView *)viewFromNib;
-(void)getRightSideRoundedButton;

@end
