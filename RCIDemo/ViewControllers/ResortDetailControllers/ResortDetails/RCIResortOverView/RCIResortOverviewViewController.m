//
//  RCIResortOverviewViewController.m
//  RCIDemo
//
//  Created by teammobility on 12/01/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//
#import "RCICheckAvailabilityViewController.h"
#import "RCIResortOverviewViewController.h"
#import "RCIAboutThisResortTableViewCell.h"
#import "RCIResortAmenitiesTableViewCell.h"
#import "RCISimilarHotelTableViewCell.h"
#import "RCIRoomDetailsTableViewCell.h"
#import "RCIResortOverViewFooterView.h"
#import "ResortAddressTableViewCell.h"
#import "RCIPointValueTableViewCell.h"
#import "RCIAreaInfoTableViewCell.h"
#import "UIView+FrameHelper.h"
#import "RCIResortDetails.h"
#import "RCITableSection.h"
#import "RCITableRow.h"
#import "RCISearchResultsViewController.h"
#import "RCIResortBookingContainerViewController.h"
#import "RCIResortBookingAddViewController.h"
#import "RCIResortBookingVerifyViewController.h"
#import "RCIResortBookingPayViewController.h"
#import "RCIResortBookingConfirmViewController.h"

static NSString *locationCellIdentifier = @"ResortLocationCell";
static NSString *pointsCellIdentifier = @"PointsCell";
static NSString *similarHotelsCellIdentifier = @"SimilarHotelsCell";
static NSString *aboutThisResortCellIdentifier = @"AboutThisResortCell";
static NSString *resortAminitiesCellIdentifier = @"ResortAminitiesCell";
static NSString *roomDetailsCellIdentifier = @"RoomDetailsCell";
static NSString *areaInfoCellIdentifier = @"AreaInfoCell";

@interface RCIResortOverviewViewController ()< UITableViewDelegate, UITableViewDataSource,RCIExpandTableViewDelegate, CheckAvailabilityDelegate>

@property (nonatomic, strong) UITableView *resortOverViewTableView;
@property (nonatomic, strong) NSMutableDictionary *views;
@property (nonatomic, strong) NSMutableArray *datasource;

@end

@implementation RCIResortOverviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self activateConstraints];
}


-(void)setupView {
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.resortOverViewTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.resortOverViewTableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.resortOverViewTableView.delegate = self;
    self.resortOverViewTableView.dataSource = self;
    self.resortOverViewTableView.rowHeight = UITableViewAutomaticDimension;
    self.resortOverViewTableView.estimatedRowHeight = 44.0;
    self.resortOverViewTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.resortOverViewTableView];
    [self registerNibs];
    RCIResortOverViewFooterView *footer = (RCIResortOverViewFooterView*)[RCIResortOverViewFooterView viewFromNib];
    footer.delegate = self;
    self.resortOverViewTableView.tableFooterView = footer;

}

-(void)registerNibs {
    [self.resortOverViewTableView registerNib:[UINib nibWithNibName:@"ResortAddressTableViewCell" bundle:nil] forCellReuseIdentifier:locationCellIdentifier];
    [self.resortOverViewTableView registerNib:[UINib nibWithNibName:@"RCIPointValueTableViewCell" bundle:nil] forCellReuseIdentifier:pointsCellIdentifier];
    [self.resortOverViewTableView registerNib:[UINib nibWithNibName:@"RCISimilarHotelTableViewCell" bundle:nil] forCellReuseIdentifier:similarHotelsCellIdentifier];
    [self.resortOverViewTableView registerNib:[UINib nibWithNibName:@"RCIAboutThisResortTableViewCell" bundle:nil] forCellReuseIdentifier:aboutThisResortCellIdentifier];
    [self.resortOverViewTableView registerNib:[UINib nibWithNibName:@"RCIResortAmenitiesTableViewCell" bundle:nil] forCellReuseIdentifier:resortAminitiesCellIdentifier];
    [self.resortOverViewTableView registerNib:[UINib nibWithNibName:@"RCIRoomDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:roomDetailsCellIdentifier];
    [self.resortOverViewTableView registerNib:[UINib nibWithNibName:@"RCIAreaInfoTableViewCell" bundle:nil] forCellReuseIdentifier:areaInfoCellIdentifier];

}

-(void)activateConstraints {
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[resortOverViewTableView]|" options:0 metrics:nil views:self.views]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[resortOverViewTableView]|" options:0 metrics:nil views:self.views]];
}

-(NSMutableDictionary*)views {
    if (!_views){
        _views = [NSMutableDictionary dictionaryWithDictionary:@{@"resortOverViewTableView": self.resortOverViewTableView}];
    }
    return _views;
}

-(NSMutableArray*)datasource {
    if (!_datasource) {
        _datasource = [NSMutableArray array];
        
        RCITableSection *section1 = [[RCITableSection alloc]init];
        section1.rows = @[[self getResortAddressRow]];
        [_datasource addObject:section1];
        
        RCITableSection *section2 = [[RCITableSection alloc]init];
        section2.rows = @[[self getPointValueRow]];
        [_datasource addObject:section2];
        
        RCITableSection *section3 = [[RCITableSection alloc]init];
        section3.rows = @[[self getAboutThisResortRow], [self getResortAminitiesRow], [self getRoomDetailsRow], [self getAreaInfoRow]];
        [_datasource addObject:section3];
        
        RCITableSection *section4 = [[RCITableSection alloc]init];
        section4.sectionFooterHeight = 4.0;
        section4.rows = @[[self getSimilarHotelRow1],[self getSimilarHotelRow2]];
        [_datasource addObject:section4];
    }
    return _datasource;
}


-(RCITableRow*)getResortAddressRow {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        ResortAddressTableViewCell *cell =  (ResortAddressTableViewCell*)[self.resortOverViewTableView dequeueReusableCellWithIdentifier:locationCellIdentifier];
        return cell;
    };
    return row;
}

-(RCITableRow*)getPointValueRow {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCIPointValueTableViewCell *cell =  (RCIPointValueTableViewCell*)[self.resortOverViewTableView dequeueReusableCellWithIdentifier:pointsCellIdentifier];
        return cell;
    };
    return row;
}

-(RCITableRow*)getAboutThisResortRow {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCIAboutThisResortTableViewCell *cell =  (RCIAboutThisResortTableViewCell*)[self.resortOverViewTableView dequeueReusableCellWithIdentifier:aboutThisResortCellIdentifier];
        cell.delegate = self;
        return cell;
    };
    return row;
}

-(RCITableRow*)getSimilarHotelRow1 {
    RCIResortDetails *resortDetails = [[RCIResortDetails alloc] init];
    resortDetails.imageName = @"image1";
    resortDetails.resortName = @"Barefoot'n in the keys at USA";
    resortDetails.resortAddress = @"Kissimmee, FL 34746, USA";
    resortDetails.isFavourite = YES;
    resortDetails.avaialableUnit = @"3";
    
    RCITableRow *row = [[RCITableRow alloc] init];
    
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCISimilarHotelTableViewCell *cell =  (RCISimilarHotelTableViewCell*)[self.resortOverViewTableView dequeueReusableCellWithIdentifier:similarHotelsCellIdentifier];
        cell.resortDetails = resortDetails;
        [cell activateTopSpaceFromSimilarResortLabel];
        return cell;
    };
    return row;
}
-(RCITableRow*)getSimilarHotelRow2 {
    RCIResortDetails *resortDetails = [[RCIResortDetails alloc] init];
    resortDetails.imageName = @"image2";
    resortDetails.resortName = @"Bryan's Spanish Cover #1 at USA";
    resortDetails.resortAddress = @"Orlando FL 32821, USA";
    resortDetails.isFavourite = NO;
    resortDetails.avaialableUnit = @"1";
    
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCISimilarHotelTableViewCell *cell =  (RCISimilarHotelTableViewCell*)[self.resortOverViewTableView dequeueReusableCellWithIdentifier:similarHotelsCellIdentifier];
        cell.resortDetails = resortDetails;
        [cell activateTopAlignWithSimilarResortLabel];
        return cell;
    };
    return row;
}

-(RCITableRow*)getResortAminitiesRow {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCIResortAmenitiesTableViewCell *cell =  (RCIResortAmenitiesTableViewCell*)[self.resortOverViewTableView dequeueReusableCellWithIdentifier:resortAminitiesCellIdentifier];
        return cell;
    };
    return row;
}

-(RCITableRow*)getRoomDetailsRow {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCIRoomDetailsTableViewCell *cell =  (RCIRoomDetailsTableViewCell*)[self.resortOverViewTableView dequeueReusableCellWithIdentifier:roomDetailsCellIdentifier];
        return cell;
    };
    return row;
}

-(RCITableRow*)getAreaInfoRow {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCIAreaInfoTableViewCell *cell =  (RCIAreaInfoTableViewCell*)[self.resortOverViewTableView dequeueReusableCellWithIdentifier:areaInfoCellIdentifier];
        cell.delegate = self;
        return cell;
    };
    return row;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datasource.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    RCITableSection *tableSection = [self.datasource objectAtIndex:section];
    return tableSection.rows.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RCITableSection *section = [self.datasource objectAtIndex:indexPath.section];
    RCITableRow *row = [section.rows objectAtIndex:indexPath.row];
    UITableViewCell *cell = row.loadCell(indexPath);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return  cell;

}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] initWithFrame:CGRectZero];
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] initWithFrame:CGRectZero];

}

- (CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section {
    RCITableSection *tableSection = [self.datasource objectAtIndex:section];
    return tableSection.sectionHeaderHeight;;
}

- (CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section {
    RCITableSection *tableSection = [self.datasource objectAtIndex:section];
    return tableSection.sectionFooterHeight;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

#pragma mark RCIExpandTableViewDelegate

-(void)expandTableViewForCell:(UITableViewCell *)cell {
    [UIView setAnimationsEnabled:NO];
    [self.resortOverViewTableView beginUpdates];
    NSIndexPath *indexPath = [self.resortOverViewTableView indexPathForCell:cell];
    if (indexPath) {
        [self.resortOverViewTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
    [self.resortOverViewTableView endUpdates];
    [UIView setAnimationsEnabled:YES];

}
#pragma mark CheckAvailabilityDelegate
-(void)checkAvailability {

    //RCISearchResultsViewController *obj = [[RCISearchResultsViewController alloc] init];
    //RCICheckAvailabilityViewController *obj = [[RCICheckAvailabilityViewController alloc]init];
    
    RCIResortBookingAddViewController *add = [[RCIResortBookingAddViewController alloc] init];
    RCIResortBookingPayViewController *pay = [[RCIResortBookingPayViewController alloc] init];
    RCIResortBookingVerifyViewController *verify = [[RCIResortBookingVerifyViewController alloc] init];
    RCIResortBookingConfirmViewController *confirm = [[RCIResortBookingConfirmViewController alloc] init];
    
    RCIResortBookingContainerViewController *obj = [[RCIResortBookingContainerViewController alloc] initWithViewControllers:@[verify,add,pay,confirm]];
    [self presentViewController:obj animated:YES completion:^{
        [obj loadControllerAtIndex:0];

    }];
    
}

@end
