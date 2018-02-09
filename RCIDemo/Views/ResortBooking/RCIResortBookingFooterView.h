//
//  ResortBookingTableFooterView.h
//  RCIDemo
//
//  Created by teammobility on 07/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCIResortBookingFooterDelegate.h"

@interface RCIResortBookingFooterView : UIView
@property (nonatomic, strong) UIButton *continueButton;
@property (nonatomic, strong) UIButton *previousButton;
@property (nonatomic,weak) id <RCIResortBookingFooterDelegate> delegate;
-(void)disablePrevious;
-(void)enablePrevious;
-(void)changeContinueToConfirm;
-(void)changeConfirmToContinue;
@end
