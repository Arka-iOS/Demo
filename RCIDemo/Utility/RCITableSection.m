//
//  RCITableSection.m
//  RCIDemo
//
//  Created by teammobility on 30/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCITableSection.h"

@implementation RCITableSection

-(CGFloat)sectionFooterHeight {
    if (!_sectionFooterHeight){
        _sectionFooterHeight = 4.0;
    }
    return _sectionFooterHeight;
}

-(CGFloat)sectionHeaderHeight {
    if (!_sectionHeaderHeight){
        _sectionHeaderHeight = 4.0;
    }
    return _sectionHeaderHeight;
}
@end
