//
//  RCIResortBookingPayViewControllerViewController.m
//  RCIDemo
//
//  Created by teammobility on 07/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIResortBookingPayViewController.h"
#import "RCITransactionTableViewCell.h"
#import "RCICardDetailsTableViewCell.h"
#import "RCIApplePayTableViewCell.h"
#import "RCITableSection.h"
#import "RCITableRow.h"

static NSString *transactionCellIdentifier = @"TransactionCell";
static NSString *applePayCellIdentifier = @"ApplePayCell";
static NSString *cardDetailCellIdentifier = @"CardDetailCell";


@interface RCIResortBookingPayViewController ()
@property (nonatomic, strong) IBOutlet UITableView *resortPayTableView;
@end

@implementation RCIResortBookingPayViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.resortPayTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self registerNib];
    [self createDataSource];

}


-(void)registerNib {
    [self.resortPayTableView registerNib:[UINib nibWithNibName:@"RCITransactionTableViewCell" bundle:nil] forCellReuseIdentifier:transactionCellIdentifier];
    [self.resortPayTableView registerNib:[UINib nibWithNibName:@"RCIApplePayTableViewCell" bundle:nil] forCellReuseIdentifier:applePayCellIdentifier];
    [self.resortPayTableView registerNib:[UINib nibWithNibName:@"RCICardDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:cardDetailCellIdentifier];
}

-(void)createDataSource {
    self.datasource = [NSMutableArray array];
    
    RCITableSection *section1 = [[RCITableSection alloc]init];
    section1.rows = @[[self getTransactionRow]];
    [self.datasource addObject:section1];
    
    RCITableSection *section2 = [[RCITableSection alloc]init];
    section2.rows = @[[self getApplePayRow]];
    [self.datasource addObject:section2];
    
    RCITableSection *section3 = [[RCITableSection alloc]init];
    section3.rows = @[[self getCardDetailRow]];
    [self.datasource addObject:section3];
    [self.resortPayTableView reloadData];
    
}


-(RCITableRow*)getTransactionRow {
    RCITableRow *row = [[RCITableRow alloc]init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCITransactionTableViewCell *cell =  (RCITransactionTableViewCell*)[self.resortPayTableView dequeueReusableCellWithIdentifier:transactionCellIdentifier];
        cell.totalPrice.text = @"69.66";
        return cell;
    };
    return row;
}

-(RCITableRow*)getApplePayRow {
    RCITableRow *row = [[RCITableRow alloc]init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCIApplePayTableViewCell *cell =  (RCIApplePayTableViewCell*)[self.resortPayTableView dequeueReusableCellWithIdentifier:applePayCellIdentifier];
        return cell;
    };
    return row;
}

-(RCITableRow*)getCardDetailRow {
    RCITableRow *row = [[RCITableRow alloc]init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCICardDetailsTableViewCell *cell =  (RCICardDetailsTableViewCell*)[self.resortPayTableView dequeueReusableCellWithIdentifier:cardDetailCellIdentifier];
        return cell;
    };
    return row;
}

@end
