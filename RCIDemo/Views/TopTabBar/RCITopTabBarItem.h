//
//  RCITopTabBarItem.h
//  RCIDemo
//
//  Created by teammobility on 12/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCITopTabBarItem : UIView
- (void)setTitle:(NSString *)title;
- (void)selectItem;
- (void)deselectItem;
- (NSString *)title;
@end
