//
//  RCIResortBookingSegmentView.m
//  RCIDemo
//
//  Created by teammobility on 06/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIResortBookingSegmentItem.h"
#import "RCIResortBookingSegmentView.h"

static const NSInteger TagOffset = 600;

@interface RCIResortBookingSegmentView ()
@property (nonatomic, strong) NSMutableDictionary *metricsDictionary;
@property (nonatomic, strong) NSMutableDictionary *viewsDictionary;
@property (nonatomic, assign) NSInteger totalSegments;
@property (nonatomic, strong) NSArray *horizontalConstraints;
@property (nonatomic, strong) UIImageView *background;
@property (nonatomic, strong) NSMutableArray *visitedItems;
@end


@implementation RCIResortBookingSegmentView

- (instancetype)initWithNumberOfSegments:(NSInteger)totalSegments {
    self = [super initWithFrame:CGRectZero];
    
    if (self) {
        _selectedIndex = NSNotFound;
        _totalSegments = totalSegments;
        _visitedItems = [NSMutableArray array];
        [self setupView];
    }
    
    return self;
}

- (RCIResortBookingSegmentItem *)tabItemAtIndex:(NSInteger)index {
    return (RCIResortBookingSegmentItem *)[self viewWithTag:TagOffset + index];
}

- (void)setTitle:(NSString *)title atIndex:(NSInteger)index {
    RCIResortBookingSegmentItem *segmentItem = (RCIResortBookingSegmentItem *)[self viewWithTag:TagOffset + index];
    if (segmentItem) {
        [segmentItem setTitle:title selectedImage:[NSString stringWithFormat:@"%ld_selected",index+1] deselectedImage:[NSString stringWithFormat:@"%ld_disable",index+1]];
        BOOL isLastItem = index == self.totalSegments-1;
        if (isLastItem){
            [segmentItem hideSeparator];
        }
        [segmentItem deselectItem];
    }
}


#pragma mark Private Methods
- (void)configureConstraintMetrics {
    self.metricsDictionary = [NSMutableDictionary dictionary];
    self.viewsDictionary = [NSMutableDictionary dictionary];
    [self.metricsDictionary setObject:@([[UIScreen mainScreen] bounds].size.width / self.totalSegments) forKey:@"segmentWidth"];
    [self.metricsDictionary setObject:@(49) forKey:@"segmentHeight"];
}

- (void)setupView {
    [self configureConstraintMetrics];

    self.background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"top_bg"]];
    self.background.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.background];
    [self.viewsDictionary setObject:self.background forKey:@"background"];

    
    NSInteger index = 0;
    
    while (index < self.totalSegments) {
        RCIResortBookingSegmentItem *segmentItem = [RCIResortBookingSegmentItem new];
        segmentItem.translatesAutoresizingMaskIntoConstraints = NO;
        segmentItem.tag = TagOffset + index;
        [segmentItem deselectItem];
        [self addSubview:segmentItem];
        [self.viewsDictionary setObject:segmentItem forKey:[self getTabItemNameForIndex:index]];
        index++;
    }
    [self setupVerticalConstraints];
    [self setupHorizontalConstraints];
}

- (void)setupVerticalConstraints {
    for (int i = 0; i < self.totalSegments; i++) {
        NSString *segmentItemName = [self getTabItemNameForIndex:i];
        [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|[%@(segmentHeight)]", segmentItemName] options:0 metrics:self.metricsDictionary views:self.viewsDictionary]];
    }
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[background]|" options:0 metrics:nil views:self.viewsDictionary]];
    
}

- (void)setupHorizontalConstraints {
    [NSLayoutConstraint deactivateConstraints:self.horizontalConstraints];
    NSMutableString *horizontalConstraintString = [NSMutableString stringWithString:@"H:|"];
    
    for (int i = 0; i < self.totalSegments; i++) {
        NSString *segmentItemName = [self getTabItemNameForIndex:i];
        [horizontalConstraintString appendString:[NSString stringWithFormat:@"[%@(segmentWidth)]", segmentItemName]];
    }
    
    self.horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:horizontalConstraintString options:0 metrics:self.metricsDictionary views:self.viewsDictionary];
    [NSLayoutConstraint activateConstraints:self.horizontalConstraints];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[background]|" options:0 metrics:nil views:self.viewsDictionary]];
    
}


- (void)setSelectedIndex:(NSInteger)index {
    NSInteger previousIndex = self.selectedIndex;
    RCIResortBookingSegmentItem *previousSegmentItem = (RCIResortBookingSegmentItem *)[self viewWithTag:TagOffset + previousIndex];
    RCIResortBookingSegmentItem *currentSegmentItem = (RCIResortBookingSegmentItem *)[self viewWithTag:TagOffset + index];

    if (previousSegmentItem && ![self.visitedItems containsObject:previousSegmentItem]){
        [self.visitedItems addObject:previousSegmentItem];
    }
    if (currentSegmentItem && [self.visitedItems containsObject:currentSegmentItem]){
        [self.visitedItems removeObject:currentSegmentItem];
    }
    _selectedIndex = index;
    
    [self setVisitedTabs];
    [self selectTabAtIndex:index];
}

-(void)setVisitedTabs {
    for (RCIResortBookingSegmentItem *segmentItem in self.visitedItems) {
        segmentItem.isVisited = YES;
    }
}
- (void)selectTabAtIndex:(NSInteger)index {
    RCIResortBookingSegmentItem *segmentItem = (RCIResortBookingSegmentItem *)[self viewWithTag:TagOffset + index];
    if (segmentItem) {
        [segmentItem selectItem];
    }
}

- (void)deselectTabIndex:(NSInteger)index {
    RCIResortBookingSegmentItem *segmentItem = (RCIResortBookingSegmentItem *)[self viewWithTag:TagOffset + index];
    if (segmentItem) {
        [segmentItem deselectItem];
    }
}

- (NSString *)getTabItemNameForIndex:(NSInteger)tabItemIndex {
    NSString *segmentItemName = [NSString stringWithFormat:@"tabItem%@", @(tabItemIndex)];
    return segmentItemName;
}


@end
