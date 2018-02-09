//
//  RCIResortBookingAddViewController.m
//  RCIDemo
//
//  Created by teammobility on 06/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIAddProtectionPointTableViewCell.h"
#import "RCIProtectInformationTableViewCell.h"
#import "RCIResortBookingAddViewController.h"
#import "RCITransactionTableViewCell.h"
#import "RCIDontRiskTableViewCell.h"
#import "RCITableSection.h"
#import "RCITableRow.h"

static NSString *transactionCellIdentifier = @"TransactionCell";
static NSString *dontRiskCellIdentifier = @"DontRiskCell";
static NSString *addProtectionCellIdentifier = @"AddProtectionCell";
static NSString *protectionInformationCellIdentifier = @"ProtectionInformationCell";


@interface RCIResortBookingAddViewController ()
@property (nonatomic, strong) IBOutlet UITableView *resortAddTableView;
@end

@implementation RCIResortBookingAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.resortAddTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self registerNib];
    [self createDataSource];
}

-(void)registerNib {
    [self.resortAddTableView registerNib:[UINib nibWithNibName:@"RCITransactionTableViewCell" bundle:nil] forCellReuseIdentifier:transactionCellIdentifier];
    [self.resortAddTableView registerNib:[UINib nibWithNibName:@"RCIDontRiskTableViewCell" bundle:nil] forCellReuseIdentifier:dontRiskCellIdentifier];
    [self.resortAddTableView registerNib:[UINib nibWithNibName:@"RCIAddProtectionPointTableViewCell" bundle:nil] forCellReuseIdentifier:addProtectionCellIdentifier];
    [self.resortAddTableView registerNib:[UINib nibWithNibName:@"RCIProtectInformationTableViewCell" bundle:nil] forCellReuseIdentifier:protectionInformationCellIdentifier];
}

-(void)createDataSource {
    self.datasource = [NSMutableArray array];
    
    RCITableSection *section1 = [[RCITableSection alloc]init];
    section1.rows = @[[self getTransactionRow]];
    [self.datasource addObject:section1];
    
    RCITableSection *section2 = [[RCITableSection alloc]init];
    section2.rows = @[[self getDontRiskRow]];
    [self.datasource addObject:section2];
    
    RCITableSection *section3 = [[RCITableSection alloc]init];
    section3.rows = @[[self getAddProtectionPointsRow]];
    [self.datasource addObject:section3];
    
    RCITableSection *section4 = [[RCITableSection alloc]init];
    section4.rows = @[[self getProtectionInformationRow]];
    [self.datasource addObject:section4];
    [self.resortAddTableView reloadData];
}

-(RCITableRow*)getTransactionRow {
    RCITableRow *row = [[RCITableRow alloc]init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCITransactionTableViewCell *cell =  (RCITransactionTableViewCell*)[self.resortAddTableView dequeueReusableCellWithIdentifier:transactionCellIdentifier];
        return cell;
    };
    return row;
}

-(RCITableRow*)getDontRiskRow {
   
    RCITableRow *row = [[RCITableRow alloc]init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCIDontRiskTableViewCell *cell =  (RCIDontRiskTableViewCell*)[self.resortAddTableView dequeueReusableCellWithIdentifier:dontRiskCellIdentifier];
        return cell;
    };
    return row;
}

-(RCITableRow*)getAddProtectionPointsRow {
    
    RCITableRow *row = [[RCITableRow alloc]init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCIAddProtectionPointTableViewCell *cell =  (RCIAddProtectionPointTableViewCell*)[self.resortAddTableView dequeueReusableCellWithIdentifier:addProtectionCellIdentifier];
        return cell;
    };
    return row;
}

-(RCITableRow*)getProtectionInformationRow {
    
    RCITableRow *row = [[RCITableRow alloc]init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCIProtectInformationTableViewCell *cell =  (RCIProtectInformationTableViewCell*)[self.resortAddTableView dequeueReusableCellWithIdentifier:protectionInformationCellIdentifier];
        return cell;
    };
    return row;
}

@end
