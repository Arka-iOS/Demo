//
//  RCISearchResultsTableViewCell.h
//  RCIDemo
//
//  Created by teammobility on 05/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RCIResortDetails;
@class RCISearchResultsTableViewCell;

@protocol RCISearchResultsTableViewCellDelegate <NSObject>
-(void)resortFavouriteIsTappedForCell:(RCISearchResultsTableViewCell*)cell;
@end

@interface RCISearchResultsTableViewCell : UITableViewCell
@property (nonatomic, strong) RCIResortDetails *resortDetails;
@property (nonatomic, weak) id <RCISearchResultsTableViewCellDelegate> delegate;

@end
