//
//  ResortBookingContainerView.h
//  RCIDemo
//
//  Created by teammobility on 06/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>


@class RCIResortBookingSegmentView;
@class RCIResortBookingFooterView;
@interface RCIResortBookingContainerView : UIView

@property (nonnull, strong) RCIResortBookingSegmentView *segmentView;
@property (nonnull, strong) RCIResortBookingFooterView *footerView;
-(nonnull instancetype)initWithNumberOfSegments:(NSInteger)segment;

@end
