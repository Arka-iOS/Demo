//
//  RCIResortOverViewFooterView.h
//  RCIDemo
//
//  Created by teammobility on 01/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CheckAvailabilityDelegate <NSObject>
-(void)checkAvailability;
@end


@interface RCIResortOverViewFooterView : UIView
@property (nonatomic, weak) id <CheckAvailabilityDelegate> delegate;
@end
