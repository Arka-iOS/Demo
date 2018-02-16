//
//  RCISearchResultTableViewCell.h
//  RCIDemo
//
//  Created by teammobility on 14/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCISearchResultTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIImageView *smallThumbNail;
@property (nonatomic, weak) IBOutlet UILabel *mainTextLabel;
@property (nonatomic, weak) IBOutlet UILabel *secondaryTextLabel;

@end
