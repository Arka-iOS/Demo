//
//  ResortBookingTableFooterView.m
//  RCIDemo
//
//  Created by teammobility on 07/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIResortBookingFooterView.h"

@implementation RCIResortBookingFooterView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
        [self activateConstraints];
    }
    return self;
    
}

-(void)setupView {
    _previousButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    [_previousButton setTitle:@"PREVIOUS" forState:UIControlStateNormal];
    [_previousButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    _previousButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_previousButton setBackgroundColor:[UIColor whiteColor]];
    [_previousButton setTitleColor:[UIColor colorWithRed:58/255.0 green:158/255.0 blue:209/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self addSubview:_previousButton];
    [_previousButton addTarget:self action:@selector(previous:) forControlEvents:UIControlEventTouchUpInside];
    [self disablePrevious];
    
    _continueButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    [_continueButton setTitle:@"CONTINUE" forState:UIControlStateNormal];
    [_continueButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [_continueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _continueButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_continueButton setBackgroundColor:[UIColor colorWithRed:58/255.0 green:158/255.0 blue:209/255.0 alpha:1.0]];
    [self addSubview:_continueButton];
    [_continueButton addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)activateConstraints {
    NSDictionary *views = @{@"previousButton":self.previousButton, @"continueButton":self.continueButton};
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[previousButton][continueButton(==previousButton)]|" options:0 metrics:nil views:views]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[previousButton]|" options:0 metrics:nil views:views]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[continueButton]|" options:0 metrics:nil views:views]];
}

-(void)next:(UIButton*)sender {
    if ([self.delegate respondsToSelector:@selector(goToNextSegment:)]) {
        [self.delegate goToNextSegment:self];
    }
}

-(void)previous:(UIButton*)sender {
    if ([self.delegate respondsToSelector:@selector(goToPreviousSegment:)]) {
        [self.delegate goToPreviousSegment:self];
    }
}

-(void)disablePrevious {
    [self.previousButton setEnabled:NO];
    self.previousButton.alpha =  0.5;
}

-(void)changeContinueToConfirm {
    [self.continueButton setTitle:@"CONFIRM" forState:UIControlStateNormal];
}

-(void)changeConfirmToContinue {
    [self.continueButton setTitle:@"CONTINUE" forState:UIControlStateNormal];

}

-(void)enablePrevious {
    [self.previousButton setEnabled:YES];
    self.previousButton.alpha =  1.0;
}
@end
