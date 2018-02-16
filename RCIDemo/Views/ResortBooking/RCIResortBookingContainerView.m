//
//  ResortBookingContainerView.m
//  RCIDemo
//
//  Created by teammobility on 06/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIResortBookingContainerView.h"
#import "RCIResortBookingSegmentView.h"
#import "RCIResortBookingFooterView.h"

@interface RCIResortBookingContainerView ()


@end

@implementation RCIResortBookingContainerView

-(instancetype)initWithNumberOfSegments:(NSInteger)segment {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _segmentView = [[RCIResortBookingSegmentView alloc] initWithNumberOfSegments:segment];
        _segmentView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_segmentView];
        _footerView = [[RCIResortBookingFooterView alloc] init];
        _footerView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_footerView];
        [self activateConstarints];
    }
    
    return self;
}

-(void)activateConstarints {
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[segmentView]|" options:0 metrics:nil views:@{@"segmentView":self.segmentView}]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[segmentView(64)]" options:0 metrics:nil views:@{@"segmentView":self.segmentView}]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[footerView]|" options:0 metrics:nil views:@{@"footerView":self.footerView}]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[footerView(55)]|" options:0 metrics:nil views:@{@"footerView":self.footerView}]];

}



@end
