//
//  RCISearchScreenViewController.h
//  RCIDemo
//
//  Created by teammobility on 14/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCISearchScreenViewController : UIViewController
@property (nonatomic, copy) void (^searchResult)(NSString *result);

@end
