//
//  RCIResortBookingVerifyViewController.m
//  RCIDemo
//
//  Created by teammobility on 06/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIResortBookingVerifyViewController.h"
#import "RCITransactionSummaryTableViewCell.h"
#import "RCIResortDetailTableViewCell.h"
#import "RCIStaticTextTableViewCell.h"
#import "RCICheckInTableViewCell.h"
#import "RCITableSection.h"
#import "RCITableRow.h"

static NSString *resortDetailCellIdentifier = @"ResortDetailCell";
static NSString *checkInCellIdentifier = @"CheckInCell";
static NSString *transactionSummaryCellIdentifier = @"TransactionCell";
static NSString *staticTextCellIdentifier = @"staticTextCell";



@interface RCIResortBookingVerifyViewController ()<RCICheckInTableViewCellDelegate>
@property (nonnull, strong) IBOutlet UITableView *resortBookingVerifyTableView;

@end

@implementation RCIResortBookingVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.resortBookingVerifyTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self registerNib];
    [self createDataSource];

}

-(void)registerNib {
    [self.resortBookingVerifyTableView registerNib:[UINib nibWithNibName:@"RCIResortDetailTableViewCell" bundle:nil] forCellReuseIdentifier:resortDetailCellIdentifier];
    [self.resortBookingVerifyTableView registerNib:[UINib nibWithNibName:@"RCICheckInTableViewCell" bundle:nil] forCellReuseIdentifier:checkInCellIdentifier];
    [self.resortBookingVerifyTableView registerNib:[UINib nibWithNibName:@"RCITransactionSummaryTableViewCell" bundle:nil] forCellReuseIdentifier:transactionSummaryCellIdentifier];
    [self.resortBookingVerifyTableView registerNib:[UINib nibWithNibName:@"RCIStaticTextTableViewCell" bundle:nil] forCellReuseIdentifier:staticTextCellIdentifier];
}

-(void)createDataSource {
    self.datasource = [NSMutableArray array];
    
    RCITableSection *section1 = [[RCITableSection alloc]init];
    section1.rows = @[[self getResortDetailRow]];
    [self.datasource addObject:section1];
    
    RCITableSection *section2 = [[RCITableSection alloc]init];
    section2.sectionHeaderHeight = 20.0;
    section2.rows = @[[self getChheckInTableRow]];
    [self.datasource addObject:section2];
    
    RCITableSection *section3 = [[RCITableSection alloc]init];
    section3.rows = @[[self getTransactionSummaryTableRow]];
    [self.datasource addObject:section3];
    
    RCITableSection *section4 = [[RCITableSection alloc]init];
    section4.sectionFooterHeight = 8.0;
    section4.rows = @[[self getStaticTextTableRow]];
    [self.datasource addObject:section4];
    [self.resortBookingVerifyTableView reloadData];
    
}

-(RCITableRow*)getResortDetailRow {
    RCITableRow *row = [[RCITableRow alloc]init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCIResortDetailTableViewCell *cell =  (RCIResortDetailTableViewCell*)[self.resortBookingVerifyTableView dequeueReusableCellWithIdentifier:resortDetailCellIdentifier];
        return cell;
    };
    return row;
}

-(RCITableRow*)getChheckInTableRow {
    RCITableRow *row = [[RCITableRow alloc]init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCICheckInTableViewCell *cell =  (RCICheckInTableViewCell*)[self.resortBookingVerifyTableView dequeueReusableCellWithIdentifier:checkInCellIdentifier];
        cell.delegate = self;
        return cell;
    };
    return row;
}

-(RCITableRow*)getTransactionSummaryTableRow {
    RCITableRow *row = [[RCITableRow alloc]init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCITransactionSummaryTableViewCell *cell =  (RCITransactionSummaryTableViewCell*)[self.resortBookingVerifyTableView dequeueReusableCellWithIdentifier:transactionSummaryCellIdentifier];
        return cell;
    };
    return row;
}

-(RCITableRow*)getStaticTextTableRow {
    RCITableRow *row = [[RCITableRow alloc]init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCIStaticTextTableViewCell *cell =  (RCIStaticTextTableViewCell*)[self.resortBookingVerifyTableView dequeueReusableCellWithIdentifier:staticTextCellIdentifier];
        return cell;
    };
    return row;
}

-(void)radioTapped {
    [self.resortBookingVerifyTableView reloadData];

}

@end
