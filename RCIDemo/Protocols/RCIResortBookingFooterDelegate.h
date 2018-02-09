//
//  RCIResortBookingTableFooterDelegate.h
//  RCIDemo
//
//  Created by teammobility on 07/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RCIResortBookingFooterView;
@protocol RCIResortBookingFooterDelegate <NSObject>

-(void)goToNextSegment:(RCIResortBookingFooterView*_Nonnull)footer;
-(void)goToPreviousSegment:(RCIResortBookingFooterView*_Nonnull)footer;
@end
