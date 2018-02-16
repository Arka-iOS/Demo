//
//  RCIResortBookingSegmentItem.m
//  RCIDemo
//
//  Created by teammobility on 06/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIResortBookingSegmentItem.h"
@interface RCIResortBookingSegmentItem ()
@property (nonatomic, strong) UIImageView *separator;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *segmentNoImageView;
@property (nonatomic, strong) NSString *selectedImage;
@property (nonatomic, strong) NSString *deSelectedImage;
@property (nonatomic, strong) NSString *visitedImage;
@property (nonatomic, strong) NSMutableDictionary *views;

@end

@implementation RCIResortBookingSegmentItem

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createTabItem];
    }
    return self;
}

- (void)createTabItem {
    _titleLabel = ({
        UILabel *titleLabel = [UILabel new];
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [titleLabel setFont:[UIFont systemFontOfSize:12]];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [titleLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:titleLabel];
        [self.views setObject:titleLabel forKey:@"titleLabel"];
        titleLabel;
    });
    
    _separator  = ({
        UIImageView *separator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"steps_separetor"]];
        separator.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:separator];
        [self.views setObject:separator forKey:@"separator"];
         separator;
    });
    
    _segmentNoImageView  = ({
        UIImageView *segmentNoImageView = [[UIImageView alloc] init];
        segmentNoImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:segmentNoImageView];
        [self.views setObject:segmentNoImageView forKey:@"segmentNoImageView"];
        segmentNoImageView;
    });
    
    [self ativateConstraints];
}

- (NSMutableDictionary*)views {
    if (!_views){
        _views = [NSMutableDictionary dictionary];
    }
    return _views;
}

- (void)ativateConstraints {
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-2-[titleLabel]-2-|" options:0 metrics:nil views:self.views]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-25-[titleLabel]-5-[segmentNoImageView(36)]" options:0 metrics:nil views:self.views]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[separator(07)]|" options:0 metrics:nil views:self.views]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[separator(49)]" options:0 metrics:nil views:self.views]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[segmentNoImageView(36)]" options:0 metrics:nil views:self.views]];

    [NSLayoutConstraint activateConstraints:@[[NSLayoutConstraint constraintWithItem:self.segmentNoImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]]];

}

- (void)setTitle:(NSString *)title selectedImage:(NSString*)selectedImage deselectedImage:(NSString*)deselectedImage {
    self.titleLabel.text = title;
    self.selectedImage = selectedImage;
    self.deSelectedImage = deselectedImage;
}

- (void)selectItem {
    self.segmentNoImageView.image = [UIImage imageNamed:self.selectedImage];
}

- (void)deselectItem {
    self.segmentNoImageView.image = [UIImage imageNamed:self.deSelectedImage];
}

- (void)setIsVisited:(BOOL)isVisited {
    _isVisited = isVisited;
    if (isVisited) {
        self.segmentNoImageView.image = [UIImage imageNamed:@"steps_done"];
    }
}

- (void)hideSeparator {
    self.separator.hidden = YES;
}


@end
