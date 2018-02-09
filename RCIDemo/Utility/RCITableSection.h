//
//  RCITableSection.h
//  RCIDemo
//
//  Created by teammobility on 30/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RCITableSection : NSObject
@property (nonatomic, strong) NSArray *rows;
@property (nonatomic, assign) CGFloat sectionHeaderHeight;;
@property (nonatomic, assign) CGFloat sectionFooterHeight;;

@end
