//
//  RCISearchViewController.m
//  RCIDemo
//
//  Created by teammobility on 13/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCISearchViewController.h"
#import "RCISearchParameterTableViewCell.h"
#import "RCISearchParameterHeader.h"
#import "RCISearchScreenViewController.h"
#import "RCISearchResultsViewController.h"
#import "RCITableSection.h"
#import "RCITableRow.h"

@interface RCISearchViewController () <UITextFieldDelegate>
@property (nonatomic, weak) IBOutlet UITableView *searchParameterTableView;
@property (nonatomic, weak) IBOutlet UITextField *seacrhBoxTextField;
@property (nonatomic, strong) NSMutableArray *searchParameters;
@property (nonatomic, strong) NSMutableArray *datasource;

@end

static NSString *searchParameterIdentifier = @"SearchParameterCell";

@implementation RCISearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

-(void)setupView {
    self.navigationController.navigationBar.topItem.title = @"Search";
    NSArray* nibViews = [[NSBundle mainBundle] loadNibNamed:@"RCISearchParameterHeader"
                                                      owner:self
                                                    options:nil];
    
    RCISearchParameterHeader* header = (RCISearchParameterHeader*)[nibViews objectAtIndex:0];
    self.searchParameterTableView.tableHeaderView = header;
    [self.searchParameterTableView registerNib:[UINib nibWithNibName:@"RCISearchParameterTableViewCell" bundle:nil] forCellReuseIdentifier:searchParameterIdentifier];

}

-(NSMutableArray*)searchParameters {
    if (!_searchParameters){
        _searchParameters = [NSMutableArray arrayWithObjects:@"Home Reservation",@"Points Exhange Search",@"Extra Vacation Search™",@"Last Call Search™",@"Saved Searches",@"Offers", nil];
    }
    return _searchParameters;
}

-(NSMutableArray*)datasource {
    if (!_datasource) {
        _datasource = [NSMutableArray array];

        RCITableSection *section1 = [[RCITableSection alloc]init];
        NSMutableArray *rows = [NSMutableArray array];
        for (NSString *parameter in self.searchParameters) {
            [rows addObject:[self getSearchParameterTableRowForTitle:parameter]];
        }
        section1.rows = rows;
        [_datasource addObject:section1];
    }
    return _datasource;
}

-(RCITableRow*)getSearchParameterTableRowForTitle:(NSString*)title {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCISearchParameterTableViewCell *cell =  (RCISearchParameterTableViewCell*)[self.searchParameterTableView dequeueReusableCellWithIdentifier:searchParameterIdentifier];
        cell.searchParameterLabel.text = title;
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
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return  cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self presentSearchResultsScreen];
    return NO;
}

-(IBAction)searchIconTapped:(id)sender {
    [self presentSearchResultsScreen];

}

-(void)presentSearchResultsScreen {
    RCISearchScreenViewController *searchScrren = [[RCISearchScreenViewController alloc] initWithNibName:@"RCISearchScreenViewController" bundle:nil];
    searchScrren.searchResult = ^(NSString *result ) {
        self.seacrhBoxTextField.text = result;
    };
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:searchScrren];
    [self presentViewController:navController animated:YES completion:nil];
    
}

-(IBAction)searchForVacation:(id)sender {
    RCISearchResultsViewController *vc = [[RCISearchResultsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
