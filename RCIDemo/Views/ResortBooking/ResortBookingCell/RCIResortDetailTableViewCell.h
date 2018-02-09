//
//  RCIResortDetailTableViewCell.h
//  RCIDemo
//
//  Created by teammobility on 07/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCIResortDetailTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *imageViewBottom;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *imageViewBottomWithContainer;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *staticViewBottom;

@property (nonatomic, weak) IBOutlet UIView *staticView;

@end
