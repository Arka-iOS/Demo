//
//  RCITopTabViewController.h
//  RCIDemo
//
//  Created by teammobility on 12/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCITopTabViewController : UIViewController
@property (nonatomic, copy) NSArray *viewControllers;
@property (nonatomic, assign) NSInteger selectedIndex;

- (void)setTitle:(NSString *)title atIndex:(NSInteger)index;
- (void)loadControllerAtIndex:(NSUInteger)newSelectedIndex;
- (void)switchTab:(NSUInteger)index;
@end
