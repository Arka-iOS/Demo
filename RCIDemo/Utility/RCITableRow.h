//
//  RCITableRow.h
//  RCIDemo
//
//  Created by teammobility on 30/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RCITableRow : NSObject
@property (nonatomic, copy, nullable) UITableViewCell * _Nonnull (^ loadCell)(NSIndexPath *_Nonnull);
@end
