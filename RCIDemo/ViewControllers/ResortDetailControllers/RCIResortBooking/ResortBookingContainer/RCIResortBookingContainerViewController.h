//
//  RCIResortBookingContainerViewController.h
//  RCIDemo
//
//  Created by teammobility on 06/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCIResortBookingContainerViewController : UIViewController
@property (nonatomic, assign) NSInteger selectedIndex;

-(instancetype)initWithViewControllers:(NSArray*)viewcontrollers;
-(void)loadControllerAtIndex:(NSInteger)index;

@end
