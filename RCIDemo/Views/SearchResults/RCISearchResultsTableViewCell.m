//
//  RCISearchResultsTableViewCell.m
//  RCIDemo
//
//  Created by teammobility on 05/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCISearchResultsTableViewCell.h"
#import "RCIResortDetails.h"

@interface RCISearchResultsTableViewCell ()
@property (nonatomic, weak) IBOutlet UIImageView *resortImage;
@property (nonatomic, weak) IBOutlet UILabel *resortAddress;
@property (nonatomic, weak) IBOutlet UILabel *resortName;
@property (nonatomic, weak) IBOutlet UILabel *availableUnit;
@property (nonatomic, weak) IBOutlet UIButton *resortIsFavourite;

@end

@implementation RCISearchResultsTableViewCell

-(void)awakeFromNib {
    [super awakeFromNib];
    [self.resortIsFavourite setImage:[UIImage imageNamed:@"fevourite"] forState:UIControlStateNormal];
    [self.resortIsFavourite setImage:[UIImage imageNamed:@"fevourite_selected"] forState:UIControlStateSelected];
}

-(void)setResortDetails:(RCIResortDetails *)resortDetails {
    _resortDetails = resortDetails;
    [self setCellAttributes];
}

-(void)setCellAttributes {
    self.resortName.text = self.resortDetails.resortName;
    self.resortAddress.text = self.resortDetails.resortAddress;
    self.resortImage.image = [UIImage imageNamed:self.resortDetails.imageName];
    self.availableUnit.text = [NSString stringWithFormat:@"Available Unit: %@",self.resortDetails.avaialableUnit];
    self.resortIsFavourite.selected = self.resortDetails.isFavourite;
}

-(IBAction)isResortFavouriteTapped:(UIButton*)sender {
    if ([self.delegate respondsToSelector:@selector(resortFavouriteIsTappedForCell:)]){
        [self.delegate resortFavouriteIsTappedForCell:self];
    }
}

@end
