//
//  RCIResortOverViewFooterView.m
//  RCIDemo
//
//  Created by teammobility on 01/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIResortOverViewFooterView.h"

@implementation RCIResortOverViewFooterView

-(IBAction)checkAvailability:(id)sender {
    if ([self.delegate respondsToSelector:@selector(checkAvailability)]) {
        [self.delegate checkAvailability];
    }
}

@end
