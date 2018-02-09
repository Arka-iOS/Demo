//
//  RCIResortDetails.h
//  RCIDemo
//
//  Created by teammobility on 05/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCIResortDetails : NSObject
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *resortName;
@property (nonatomic, strong) NSString *resortAddress;
@property (nonatomic, strong) NSString *avaialableUnit;
@property (nonatomic, assign) BOOL isFavourite;
@end
