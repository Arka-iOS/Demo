//
//  RCIResortBookingSegmentItem.h
//  RCIDemo
//
//  Created by teammobility on 06/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCIResortBookingSegmentItem : UIView
@property (nonatomic, assign) BOOL isVisited;

- (void)setTitle:(NSString *)title selectedImage:(NSString*)selectedImage deselectedImage:(NSString*)deselectedImage;
- (void)selectItem;
- (void)deselectItem;
- (void)hideSeparator;
@end
