//
//  RCITopTabBarView.h
//  RCIDemo
//
//  Created by teammobility on 12/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RCITopTabBarItem;

@protocol RCITopTabBarViewDelegate <NSObject>
- (void)tabMenuTappedAtIndex:(NSInteger)index;
@end

@interface RCITopTabBarView : UIView
@property (nonatomic, weak) id <RCITopTabBarViewDelegate> delegate;
@property (nonatomic, assign) NSInteger selectedIndex;

- (instancetype)initWithNumberOfSegments:(NSInteger)totalSegments;
- (void)setTitle:(NSString *)title atIndex:(NSInteger)index;
- (void)onOrientationChange;
@end
