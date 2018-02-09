//
//  RCITopTabrViewControllerDelegate.h
//  RCIDemo
//
//  Created by teammobility on 12/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#ifndef RCITopTabrViewControllerDelegate_h
#define RCITopTabrViewControllerDelegate_h
@class RCITopTabViewController;
@protocol RCITopTabrViewControllerDelegate <NSObject>
@optional
- (BOOL)tabBarController:(RCITopTabViewController *)tabBarController shouldSelectViewController:(UIViewController *)viewController atIndex:(NSInteger)index;
- (void)tabBarController:(RCITopTabViewController *)tabBarController didSelectViewController:(UIViewController *)viewController atIndex:(NSInteger)index;
@end

#endif /* RCITopTabrViewControllerDelegate_h */
