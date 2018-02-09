//
//  RCITopTabBarView.m
//  RCIDemo
//
//  Created by teammobility on 12/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCITopTabBarView.h"
#import "RCITopTabBarItem.h"

static const NSInteger TagOffset = 500;

@interface RCITopTabBarView ()
@property (nonatomic, strong) NSMutableDictionary *metricsDictionary;
@property (nonatomic, strong) NSMutableDictionary *viewsDictionary;
@property (nonatomic, assign) NSInteger totalSegments;
@property (strong, nonatomic) NSArray *horizontalConstraints;
@end

@implementation RCITopTabBarView

#pragma mark Public Methods
- (instancetype)initWithNumberOfSegments:(NSInteger)totalSegments {
    self = [super initWithFrame:CGRectZero];
    
    if (self) {
        _selectedIndex = NSNotFound;
        _totalSegments = totalSegments;
        [self setupView];
    }
    
    return self;
}

- (RCITopTabBarItem *)tabItemAtIndex:(NSInteger)index {
    return (RCITopTabBarItem *)[self viewWithTag:TagOffset + index];
}

- (void)setTitle:(NSString *)title atIndex:(NSInteger)index {
    RCITopTabBarItem *tabItem = (RCITopTabBarItem *)[self viewWithTag:TagOffset + index];
    
    if (tabItem) {
        [tabItem setTitle:title];
    }
}

- (void)onOrientationChange {
    if (self.metricsDictionary) {
        [self.metricsDictionary setObject:@([[UIScreen mainScreen] bounds].size.width / self.totalSegments) forKey:@"segmentWidth"];
    }
    
    if (self.viewsDictionary) {
        [self setupHorizontalConstraints];
        [self setNeedsDisplay];
        [self setNeedsLayout];
    }
}

#pragma mark Private Methods
- (void)configureConstraintMetrics {
    self.metricsDictionary = [NSMutableDictionary dictionary];
    self.viewsDictionary = [NSMutableDictionary dictionary];
    [self.metricsDictionary setObject:@([[UIScreen mainScreen] bounds].size.width / self.totalSegments) forKey:@"segmentWidth"];
    [self.metricsDictionary setObject:@(44) forKey:@"segmentHeight"];
}

- (void)setupView {
    [self configureConstraintMetrics];
    
    NSInteger index = 0;
    
    while (index < self.totalSegments) {
        RCITopTabBarItem *tabItem = [RCITopTabBarItem new];
        tabItem.translatesAutoresizingMaskIntoConstraints = NO;
        tabItem.tag = TagOffset + index;
        [tabItem deselectItem];
        tabItem.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabPressed:)];
        [tabItem addGestureRecognizer:tap];
        [self addSubview:tabItem];
        [self.viewsDictionary setObject:tabItem forKey:[self getTabItemNameForIndex:index]];
        index++;
    }
    [self setupVerticalConstraints];
    [self setupHorizontalConstraints];
}

- (void)setupVerticalConstraints {
    for (int i = 0; i < self.totalSegments; i++) {
        NSString *tabItemName = [self getTabItemNameForIndex:i];
        [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|[%@(segmentHeight)]", tabItemName] options:0 metrics:self.metricsDictionary views:self.viewsDictionary]];
    }
}

- (void)setupHorizontalConstraints {
    [NSLayoutConstraint deactivateConstraints:self.horizontalConstraints];
    NSMutableString *horizontalConstraintString = [NSMutableString stringWithString:@"H:|"];
    
    for (int i = 0; i < self.totalSegments; i++) {
        NSString *tabItemName = [self getTabItemNameForIndex:i];
        [horizontalConstraintString appendString:[NSString stringWithFormat:@"[%@(segmentWidth)]", tabItemName]];
    }
    
    self.horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:horizontalConstraintString options:0 metrics:self.metricsDictionary views:self.viewsDictionary];
    [NSLayoutConstraint activateConstraints:self.horizontalConstraints];
}

- (void)tabPressed:(UITapGestureRecognizer *)recogniser {
    if ([self.delegate respondsToSelector:@selector(tabMenuTappedAtIndex:)]) {
        NSInteger index = recogniser.view.tag - TagOffset;
        [self.delegate tabMenuTappedAtIndex:index];
    }
}

- (void)setSelectedIndex:(NSInteger)index {
    NSInteger previousIndex = self.selectedIndex;
    if (previousIndex != index) {
        [self deselectTabIndex:previousIndex];
        _selectedIndex = index;
        [self selectTabAtIndex:index];
    }
}

- (void)selectTabAtIndex:(NSInteger)index {
    RCITopTabBarItem *tabItem = (RCITopTabBarItem *)[self viewWithTag:TagOffset + index];
    if (tabItem) {
        [tabItem selectItem];
    }
}

- (void)deselectTabIndex:(NSInteger)index {
    RCITopTabBarItem *tabItem = (RCITopTabBarItem *)[self viewWithTag:TagOffset + index];
    if (tabItem) {
        [tabItem deselectItem];
    }
}

- (NSString *)getTabItemNameForIndex:(NSInteger)tabItemIndex {
    NSString *tabItemName = [NSString stringWithFormat:@"tabItem%@", @(tabItemIndex)];
    
    return tabItemName;
}

@end
