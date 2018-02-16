//
//  RCISearchResultsViewController.m
//  RCIDemo
//
//  Created by teammobility on 05/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCISearchResultsViewController.h"
#import "RCISearchResultsTableViewCell.h"
#import "RCIResortDetailContainerViewController.h"
#import "UIView+FrameHelper.h"
#import "RCIResortDetails.h"
#import "RCITableSection.h"
#import "RCITableRow.h"

static NSString *searchResultsIdentifier = @"SearchResultsCell";

@interface RCISearchResultsViewController ()<RCISearchResultsTableViewCellDelegate>
@property (nonatomic, strong) IBOutlet UITableView *searchResultsTableView;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) NSMutableArray *resortDetails;

@end

@implementation RCISearchResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

-(void)setupUI {
    self.title = @"USA";
    self.navigationController.navigationBar.topItem.title = @"";
    [self.searchResultsTableView registerNib:[UINib nibWithNibName:@"RCISearchResultsTableViewCell" bundle:nil] forCellReuseIdentifier:searchResultsIdentifier];

}

-(NSMutableArray*)resortDetails {
    if (!_resortDetails) {
        _resortDetails = [NSMutableArray array];
        
        RCIResortDetails *resortDetails1 = [[RCIResortDetails alloc] init];
        resortDetails1.imageName = @"image1";
        resortDetails1.resortName = @"Barefoot'n in the keys at USA";
        resortDetails1.resortAddress = @"Kissimmee, FL 34746, USA";
        resortDetails1.isFavourite = YES;
        resortDetails1.avaialableUnit = @"3";
        [_resortDetails addObject:resortDetails1];
        
        RCIResortDetails *resortDetails2 = [[RCIResortDetails alloc] init];
        resortDetails2.imageName = @"image2";
        resortDetails2.resortName = @"Bryan's Spanish Cover #1 at USA";
        resortDetails2.resortAddress = @"Orlando FL 32821, USA";
        resortDetails2.isFavourite = NO;
        resortDetails2.avaialableUnit = @"1";
        [_resortDetails addObject:resortDetails2];

        RCIResortDetails *resortDetails3 = [[RCIResortDetails alloc] init];
        resortDetails3.imageName = @"image3";
        resortDetails3.resortName = @"Barefoot'n in the keys at USA";
        resortDetails3.resortAddress = @"Kissimmee, FL 34746, USA";
        resortDetails3.isFavourite = YES;
        resortDetails3.avaialableUnit = @"2";
        [_resortDetails addObject:resortDetails3];
        
        RCIResortDetails *resortDetails4 = [[RCIResortDetails alloc] init];
        resortDetails4.imageName = @"image1";
        resortDetails4.resortName = @"Bryan's Spanish Cover #1 at USA";
        resortDetails4.resortAddress = @"Orlando FL 32821, USA";
        resortDetails4.isFavourite = NO;
        resortDetails4.avaialableUnit = @"3";
        [_resortDetails addObject:resortDetails4];
    }
    return _resortDetails;
}

-(NSMutableArray*)datasource {
    if (!_datasource) {
        _datasource = [NSMutableArray array];
        
        RCITableSection *section1 = [[RCITableSection alloc]init];
        NSMutableArray*resortDetail = [NSMutableArray array];
        for (RCIResortDetails *resortDetails in self.resortDetails) {
            [resortDetail addObject:[self getSearchResultsRowWithResortDetails:resortDetails]];
        }
        section1.rows = resortDetail;
        [_datasource addObject:section1];
    }
    return _datasource;
}

-(RCITableRow*)getSearchResultsRowWithResortDetails:(RCIResortDetails*)resortDetail {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCISearchResultsTableViewCell *cell =  (RCISearchResultsTableViewCell*)[self.searchResultsTableView dequeueReusableCellWithIdentifier:searchResultsIdentifier];
        cell.delegate = self;
        cell.resortDetails = resortDetail;
        return cell;
    };
    
    row.didSelectRow = ^(NSIndexPath *indexPath) {
        RCIResortDetailContainerViewController *container = [[RCIResortDetailContainerViewController alloc] init];
        [self.navigationController pushViewController:container animated:YES];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RCITableSection *section = [self.datasource objectAtIndex:indexPath.section];
    RCITableRow *row = [section.rows objectAtIndex:indexPath.row];
    row.didSelectRow(indexPath);
    
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
