//
//  RCISimilarHotelTableViewCell.m
//  RCIDemo
//
//  Created by teammobility on 19/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCISimilarHotelTableViewCell.h"
#import "RCIResortDetails.h"

@interface RCISimilarHotelTableViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *resortImage;
@property (nonatomic, weak) IBOutlet UILabel *resortAddress;
@property (nonatomic, weak) IBOutlet UILabel *resortName;
@property (nonatomic, weak) IBOutlet UILabel *availableUnit;
@property (nonatomic, weak) IBOutlet UILabel *similarResortLabel;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *topSpaceWithSimilarResortLabel;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *topAlignWithSimilarResortLabel;

@end


@implementation RCISimilarHotelTableViewCell

-(void)setResortDetails:(RCIResortDetails *)resortDetails {
    _resortDetails = resortDetails;
    [self setCellAttributes];
}

-(void)setCellAttributes {
    self.resortName.text = self.resortDetails.resortName;
    self.resortAddress.text = self.resortDetails.resortAddress;
    self.resortImage.image = [UIImage imageNamed:self.resortDetails.imageName];
    self.availableUnit.text = [NSString stringWithFormat:@"Available Unit: %@",self.resortDetails.avaialableUnit];
}

-(void)activateTopSpaceFromSimilarResortLabel {
    self.topSpaceWithSimilarResortLabel.priority = UILayoutPriorityDefaultHigh;
    self.topAlignWithSimilarResortLabel.priority = UILayoutPriorityDefaultLow;
    self.similarResortLabel.hidden = NO;
}

-(void)activateTopAlignWithSimilarResortLabel {
    self.topSpaceWithSimilarResortLabel.priority = UILayoutPriorityDefaultLow;
    self.topAlignWithSimilarResortLabel.priority = UILayoutPriorityDefaultHigh;
    self.similarResortLabel.hidden = YES;
}

@end
