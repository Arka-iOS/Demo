//
//  RCIResortBookingTableViewCell.h
//  RCIDemo
//
//  Created by teammobility on 02/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RCIResortBookingTableViewCellDelegate <NSObject>
-(void)confirmButtonTapped;
@end
@interface RCIResortBookingTableViewCell : UITableViewCell
@property (nonatomic, weak) id <RCIResortBookingTableViewCellDelegate> delegate;
@end
