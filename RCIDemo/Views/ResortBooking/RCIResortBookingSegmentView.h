//
//  RCIResortBookingSegmentView.h
//  RCIDemo
//
//  Created by teammobility on 06/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCIResortBookingSegmentView : UIView
@property (nonatomic, assign) NSInteger selectedIndex;
- (instancetype)initWithNumberOfSegments:(NSInteger)totalSegments;
- (void)setTitle:(NSString *)title atIndex:(NSInteger)index;

@end
