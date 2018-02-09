//
//  RCICheckInTableViewCell.h
//  RCIDemo
//
//  Created by teammobility on 07/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RCICheckInTableViewCellDelegate <NSObject>
-(void)radioTapped;
@end
@interface RCICheckInTableViewCell : UITableViewCell
@property (nonatomic, weak) id <RCICheckInTableViewCellDelegate> delegate;
@end
