//
//  UIView+FrameHelper.m
//  RCIDemo
//
//  Created by teammobility on 17/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "UIView+FrameHelper.h"

@implementation UIView (FrameHelper)
- (CGFloat)width
{
    return self.frame.size.width;
}

- (id)setX:(CGFloat)x
{
    [self setX:x andY:self.frame.origin.y];
    return self;
}
- (id)setX:(CGFloat)x andY:(CGFloat)y
{
    CGRect f = self.frame;
    self.frame = CGRectMake(x, y,
                            f.size.width, f.size.height);
    return self;
}

+ (UIView *)viewFromNib
{
    Class class = [self class];
    NSString *nibName = NSStringFromClass(class);
    NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    UIView *view = [nibViews objectAtIndex:0];
    return view;
}

-(void)getRightSideRoundedButton {
    
}

@end
