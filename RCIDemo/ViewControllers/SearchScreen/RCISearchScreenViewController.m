//
//  RCISearchScreenViewController.m
//  RCIDemo
//
//  Created by teammobility on 14/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCISearchScreenViewController.h"
#import "RCISearchResultTableViewCell.h"
#import "RCISearchScreenSectionHeaderView.h"
#import "RCITableSection.h"
#import "RCITableRow.h"
#import "RCIRegion.h"

static NSString *searchResultIdentifier = @"SearchResultCell";

@interface RCISearchScreenViewController () <UITextFieldDelegate>
@property (nonatomic, weak) IBOutlet UITableView *searchResultsTableView;
@property (nonatomic, weak) IBOutlet UITextField *searchTextField;
@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) NSArray *recentSearches;
@property (nonatomic, strong) NSArray *regions;
@property (nonatomic, strong) NSArray *resorts;
@property (nonatomic, strong) NSString *searchText;

@end

@implementation RCISearchScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

-(void)setupUI {
    UIBarButtonItem *cross = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"cross"] style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem = cross;
   
    [self.searchResultsTableView registerNib:[UINib nibWithNibName:@"RCISearchResultTableViewCell" bundle:nil] forCellReuseIdentifier:searchResultIdentifier];
}

-(void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSArray*)recentSearches {
    if (!_recentSearches) {
        _recentSearches = @[@"Bimoral Resort #RF92"];
    }
    return _recentSearches;
}

-(NSArray*)regions {
    if (!_regions) {
        RCIRegion *region1 = [[RCIRegion alloc] init];
        region1.region = @"Inland";
        region1.numbers = @"11";
        
        RCIRegion *region2 = [[RCIRegion alloc] init];
        region2.region = @"Northern Gulf Coast";
        region2.numbers = @"4";
        
        RCIRegion *region3 = [[RCIRegion alloc] init];
        region3.region = @"Orlando Area";
        region3.numbers = @"78";
        _regions = @[region1, region2, region3];
    }
    return _regions;
}

-(NSArray*)resorts {
    if (!_resorts) {
        _resorts = @[@"Florida Bay Club#5130", @"Florida Vacation Villas#0776", @"Florida Vacationn Villas Club#6740"];
    }
    return _resorts;
}

-(NSMutableArray*)datasource {
    if (!_datasource) {
        _datasource = [NSMutableArray array];
        
        RCITableSection *section1 = [[RCITableSection alloc]init];
        section1.sectionTitle = @"Recent Searches";
        section1.sectionHeaderHeight = 30.0;
        section1.sectionFooterHeight = 1.0f;
        NSMutableArray *recentSearches = [NSMutableArray array];
        for (NSString *result in self.recentSearches) {
            [recentSearches addObject:[self getRecentSearchesRowWithText:result]];
        }
        section1.rows = recentSearches;
        [_datasource addObject:section1];
        
        RCITableSection *section2 = [[RCITableSection alloc]init];
        section2.sectionTitle = @"Regions";
        section2.sectionHeaderHeight = 30.0;
        section2.sectionFooterHeight = 1.0f;

        NSMutableArray *regions = [NSMutableArray array];
        for (RCIRegion *region in self.regions) {
            [regions addObject:[self getRegionsRowWithRegion:region.region andNumber:region.numbers]];
        }
        section2.rows = regions;
        [_datasource addObject:section2];
        
        RCITableSection *section3 = [[RCITableSection alloc]init];
        section3.sectionTitle = @"Resorts";
        section3.sectionHeaderHeight = 30.0;
        section3.sectionFooterHeight = 1.0f;

        NSMutableArray *resorts = [NSMutableArray array];
        for (NSString *resort in self.resorts) {
            [resorts addObject:[self getReResortRowWithText:resort]];
        }
        section3.rows = resorts;
        [_datasource addObject:section3];
    }
    return _datasource;
}

-(RCITableRow*)getRecentSearchesRowWithText:(NSString*)text {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCISearchResultTableViewCell *cell =  (RCISearchResultTableViewCell*)[self.searchResultsTableView dequeueReusableCellWithIdentifier:searchResultIdentifier];
        cell.smallThumbNail.image = [UIImage imageNamed:@"resorts_icon"];
        cell.mainTextLabel.text = text;
        cell.secondaryTextLabel.hidden = YES;
        return cell;
    };
    
    row.didSelectRow = ^(NSIndexPath *indexPath) {
        self.searchResult(self.recentSearches[indexPath.row]);
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    return row;
}

-(RCITableRow*)getRegionsRowWithRegion:(NSString*)region andNumber:(NSString*)number {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCISearchResultTableViewCell *cell =  (RCISearchResultTableViewCell*)[self.searchResultsTableView dequeueReusableCellWithIdentifier:searchResultIdentifier];
        cell.smallThumbNail.image = [UIImage imageNamed:@"place"];
        cell.mainTextLabel.text = [NSString stringWithFormat:@"%@ - %@",self.searchText, region];
        cell.secondaryTextLabel.text = [NSString stringWithFormat:@"%@ Resorts",number];
        return cell;
    };
    
    row.didSelectRow = ^(NSIndexPath *indexPath) {
        RCIRegion *region = self.regions[indexPath.row];
        self.searchResult(region.region);
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    return row;
}

-(RCITableRow*)getReResortRowWithText:(NSString*)text {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCISearchResultTableViewCell *cell =  (RCISearchResultTableViewCell*)[self.searchResultsTableView dequeueReusableCellWithIdentifier:searchResultIdentifier];
        cell.smallThumbNail.image = [UIImage imageNamed:@"resorts_icon"];
        cell.mainTextLabel.text = text;
        cell.secondaryTextLabel.hidden = YES;
        return cell;
    };
    row.didSelectRow = ^(NSIndexPath *indexPath) {
        self.searchResult(self.resorts[indexPath.row]);
        [self dismissViewControllerAnimated:YES completion:nil];
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



-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    RCITableSection *tableSection = [self.datasource objectAtIndex:section];

    RCISearchScreenSectionHeaderView *header = [[RCISearchScreenSectionHeaderView alloc] initWithTitle:tableSection.sectionTitle];
    return header;

}

- (CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section {
    RCITableSection *tableSection = [self.datasource objectAtIndex:section];
    return tableSection.sectionHeaderHeight;;
}

- (CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section {
    RCITableSection *tableSection = [self.datasource objectAtIndex:section];
    return tableSection.sectionFooterHeight;

}

-(IBAction)searchIconTapped:(id)sender {
    [self.searchTextField becomeFirstResponder];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *currentText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.searchText = currentText;
    self.searchResultsTableView.hidden = !currentText.length;
    [self.searchResultsTableView reloadData];
    return YES;
}

@end
