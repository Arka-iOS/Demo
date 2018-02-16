//
//  RCICheckAvailabilityViewController.m
//  RCIDemo
//
//  Created by teammobility on 02/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCICheckAvailabilityViewController.h"
#import "RCIResortBookingTableViewCell.h"
#import "RCICheckAvailabilityFooterView.h"
#import "UIView+FrameHelper.h"
#import "RCITableSection.h"
#import "RCITableRow.h"
#import "RCIResortBookingContainerViewController.h"
#import "RCIResortBookingAddViewController.h"
#import "RCIResortBookingVerifyViewController.h"
#import "RCIResortBookingPayViewController.h"
#import "RCIResortBookingConfirmViewController.h"

static NSString *checkAvailabilityIdentifier = @"CheckAvailability";

@interface RCICheckAvailabilityViewController ()<RCIResortBookingTableViewCellDelegate>
@property (nonatomic, strong) IBOutlet UITableView *checkAvailabilityTableView;
@property (nonatomic, strong) NSMutableArray *datasource;

@end

@implementation RCICheckAvailabilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

-(void)setupUI {
    self.title = @"CHECK AVAILABILITY";
    self.navigationController.navigationBar.topItem.title = @"";
    self.checkAvailabilityTableView.rowHeight = UITableViewAutomaticDimension;
    self.checkAvailabilityTableView.estimatedRowHeight = 44.0;
    self.checkAvailabilityTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.checkAvailabilityTableView registerNib:[UINib nibWithNibName:@"RCIResortBookingTableViewCell" bundle:nil] forCellReuseIdentifier:checkAvailabilityIdentifier];
    RCICheckAvailabilityFooterView *footer = (RCICheckAvailabilityFooterView*)[RCICheckAvailabilityFooterView viewFromNib];
    self.checkAvailabilityTableView.tableFooterView = footer;
}

-(NSMutableArray*)datasource {
    if (!_datasource) {
        _datasource = [NSMutableArray array];
        
        RCITableSection *section1 = [[RCITableSection alloc]init];
        section1.rows = @[[self getcheckAvailabilityRow]];
        [_datasource addObject:section1];

        RCITableSection *section2 = [[RCITableSection alloc]init];
        section2.rows = @[[self getcheckAvailabilityRow]];
        [_datasource addObject:section2];

        RCITableSection *section3 = [[RCITableSection alloc]init];
        section3.rows = @[[self getcheckAvailabilityRow]];
        [_datasource addObject:section3];

    }
    return _datasource;
}

-(RCITableRow*)getcheckAvailabilityRow {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCIResortBookingTableViewCell *cell =  (RCIResortBookingTableViewCell*)[self.checkAvailabilityTableView dequeueReusableCellWithIdentifier:checkAvailabilityIdentifier];
        cell.delegate = self;
        return cell;
    };
    return row;;
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

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] initWithFrame:CGRectZero];
    
    
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] initWithFrame:CGRectZero];
}

- (CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section {
    return section == self.datasource.count - 1 ? 4.0 : 2.0;
}

- (CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 2.0;
}

-(void)confirmButtonTapped {
    RCIResortBookingAddViewController *add = [[RCIResortBookingAddViewController alloc] init];
    RCIResortBookingPayViewController *pay = [[RCIResortBookingPayViewController alloc] init];
    RCIResortBookingVerifyViewController *verify = [[RCIResortBookingVerifyViewController alloc] init];
    RCIResortBookingConfirmViewController *confirm = [[RCIResortBookingConfirmViewController alloc] init];
    RCIResortBookingContainerViewController *obj = [[RCIResortBookingContainerViewController alloc] initWithViewControllers:@[verify,add,pay,confirm]];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:obj];
    [self presentViewController:navController animated:YES completion:^{
      [obj loadControllerAtIndex:0];
    }];
}
@end
