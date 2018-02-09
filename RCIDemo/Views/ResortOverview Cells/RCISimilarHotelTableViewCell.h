//
//  RCISimilarHotelTableViewCell.h
//  RCIDemo
//
//  Created by teammobility on 19/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RCIResortDetails;

@interface RCISimilarHotelTableViewCell : UITableViewCell
@property (nonatomic, strong) RCIResortDetails *resortDetails;

-(void)activateTopSpaceFromSimilarResortLabel;
-(void)activateTopAlignWithSimilarResortLabel;
@end
