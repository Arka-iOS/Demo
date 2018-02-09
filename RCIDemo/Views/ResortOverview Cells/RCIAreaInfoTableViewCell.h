//
//  RCIAreaInfoTableViewCell.h
//  RCIDemo
//
//  Created by teammobility on 19/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCIExpandTableViewDelegate.h"

@interface RCIAreaInfoTableViewCell : UITableViewCell
@property (nonatomic, weak) id <RCIExpandTableViewDelegate> delegate;

@end
