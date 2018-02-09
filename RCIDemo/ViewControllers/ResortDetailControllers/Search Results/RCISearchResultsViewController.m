//
//  RCISearchResultsViewController.m
//  RCIDemo
//
//  Created by teammobility on 05/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCISearchResultsViewController.h"
#import "RCISearchResultsTableViewCell.h"
#import "UIView+FrameHelper.h"
#import "RCIResortDetails.h"
#import "RCITableSection.h"
#import "RCITableRow.h"

static NSString *searchResultsIdentifier = @"SearchResultsCell";

@interface RCISearchResultsViewController ()<RCISearchResultsTableViewCellDelegate>
@property (nonatomic, strong) IBOutlet UITableView *searchResultsTableView;
@property (nonatomic, strong) NSMutableArray *datasource;

@end

@implementation RCISearchResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

-(void)setupUI {
    [self.searchResultsTableView registerNib:[UINib nibWithNibName:@"RCISearchResultsTableViewCell" bundle:nil] forCellReuseIdentifier:searchResultsIdentifier];

}

-(NSMutableArray*)datasource {
    if (!_datasource) {
        _datasource = [NSMutableArray array];
        
        RCITableSection *section1 = [[RCITableSection alloc]init];
        section1.rows = @[[self getSearchResultsRow1],[self getSearchResultsRow2],[self getSearchResultsRow3],[self getSearchResultsRow4]];
        [_datasource addObject:section1];
    }
    return _datasource;
}

-(RCITableRow*)getSearchResultsRow1 {
    RCIResortDetails *resortDetails = [[RCIResortDetails alloc] init];
    resortDetails.imageName = @"image1";
    resortDetails.resortName = @"Barefoot'n in the keys at USA";
    resortDetails.resortAddress = @"Kissimmee, FL 34746, USA";
    resortDetails.isFavourite = YES;
    resortDetails.avaialableUnit = @"3";
    
    RCITableRow *row = [[RCITableRow alloc] init];
    
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCISearchResultsTableViewCell *cell =  (RCISearchResultsTableViewCell*)[self.searchResultsTableView dequeueReusableCellWithIdentifier:searchResultsIdentifier];
        cell.delegate = self;
        cell.resortDetails = resortDetails;
        return cell;
    };
    return row;
}
-(RCITableRow*)getSearchResultsRow2 {
    RCIResortDetails *resortDetails = [[RCIResortDetails alloc] init];
    resortDetails.imageName = @"image2";
    resortDetails.resortName = @"Bryan's Spanish Cover #1 at USA";
    resortDetails.resortAddress = @"Orlando FL 32821, USA";
    resortDetails.isFavourite = NO;
    resortDetails.avaialableUnit = @"1";
    
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCISearchResultsTableViewCell *cell =  (RCISearchResultsTableViewCell*)[self.searchResultsTableView dequeueReusableCellWithIdentifier:searchResultsIdentifier];
        cell.delegate = self;
        cell.resortDetails = resortDetails;
        return cell;
    };
    return row;
}

-(RCITableRow*)getSearchResultsRow3 {
    RCIResortDetails *resortDetails = [[RCIResortDetails alloc] init];
    resortDetails.imageName = @"image3";
    resortDetails.resortName = @"Barefoot'n in the keys at USA";
    resortDetails.resortAddress = @"Kissimmee, FL 34746, USA";
    resortDetails.isFavourite = YES;
    resortDetails.avaialableUnit = @"2";
    
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCISearchResultsTableViewCell *cell =  (RCISearchResultsTableViewCell*)[self.searchResultsTableView dequeueReusableCellWithIdentifier:searchResultsIdentifier];
        cell.delegate = self;
        cell.resortDetails = resortDetails;
        return cell;
    };
    return row;
}

-(RCITableRow*)getSearchResultsRow4 {
    RCIResortDetails *resortDetails = [[RCIResortDetails alloc] init];
    resortDetails.imageName = @"image1";
    resortDetails.resortName = @"Bryan's Spanish Cover #1 at USA";
    resortDetails.resortAddress = @"Orlando FL 32821, USA";
    resortDetails.isFavourite = NO;
    resortDetails.avaialableUnit = @"3";
    
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCISearchResultsTableViewCell *cell =  (RCISearchResultsTableViewCell*)[self.searchResultsTableView dequeueReusableCellWithIdentifier:searchResultsIdentifier];
        cell.delegate = self;
        cell.resortDetails = resortDetails;
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(void)resortFavouriteIsTappedForCell:(RCISearchResultsTableViewCell *)cell {
    NSIndexPath *indexPath = [self.searchResultsTableView indexPathForCell:cell];
    RCIResortDetails *resortDetail = cell.resortDetails;
    resortDetail.isFavourite = !resortDetail.isFavourite;
    if (indexPath) {
        [self.searchResultsTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
}

@end
