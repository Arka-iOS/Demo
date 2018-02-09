//
//  RCIResortBookingConfirmViewController.m
//  RCIDemo
//
//  Created by teammobility on 07/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//

#import "RCIResortBookingConfirmViewController.h"
#import "RCITransactionSummaryTableViewCell.h"
#import "RCIProtectInformationTableViewCell.h"
#import "RCIResortDetailTableViewCell.h"
#import "RCIStaticTextTableViewCell.h"
#import "RCIParagraphTableViewCell.h"
#import "RCICardInfoTableViewCell.h"
#import "RCITableSection.h"
#import "RCITableRow.h"

static NSString *resortDetailCellIdentifier = @"ResortDetailCell";
static NSString *transactionSummaryCellIdentifier = @"TransactionCell";
static NSString *cardInfoCellIdentifier = @"CardInfoCell";
static NSString *staticTextCellIdentifier = @"staticTextCell";
static NSString *paragraphCellIdentifier = @"paragraphCell";
static NSString *protectionInformationCellIdentifier = @"ProtectionInformationCell";


@interface RCIResortBookingConfirmViewController ()
@property (nonnull, strong) IBOutlet UITableView *resortBookingConfirmTableView;

@end

@implementation RCIResortBookingConfirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.resortBookingConfirmTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self registerNib];
    [self createDataSource];
}

-(void)registerNib {
    [self.resortBookingConfirmTableView registerNib:[UINib nibWithNibName:@"RCIResortDetailTableViewCell" bundle:nil] forCellReuseIdentifier:resortDetailCellIdentifier];
    [self.resortBookingConfirmTableView registerNib:[UINib nibWithNibName:@"RCITransactionSummaryTableViewCell" bundle:nil] forCellReuseIdentifier:transactionSummaryCellIdentifier];
    [self.resortBookingConfirmTableView registerNib:[UINib nibWithNibName:@"RCICardInfoTableViewCell" bundle:nil] forCellReuseIdentifier:cardInfoCellIdentifier];
    [self.resortBookingConfirmTableView registerNib:[UINib nibWithNibName:@"RCIStaticTextTableViewCell" bundle:nil] forCellReuseIdentifier:staticTextCellIdentifier];
    [self.resortBookingConfirmTableView registerNib:[UINib nibWithNibName:@"RCIParagraphTableViewCell" bundle:nil] forCellReuseIdentifier:paragraphCellIdentifier];
    [self.resortBookingConfirmTableView registerNib:[UINib nibWithNibName:@"RCIProtectInformationTableViewCell" bundle:nil] forCellReuseIdentifier:protectionInformationCellIdentifier];

}

-(void)createDataSource {
    self.datasource = [NSMutableArray array];
    
    RCITableSection *section1 = [[RCITableSection alloc]init];
    section1.sectionFooterHeight = 30.0;
    section1.rows = @[[self getResortDetailRow]];
    [self.datasource addObject:section1];
    
    RCITableSection *section2 = [[RCITableSection alloc]init];
    section2.rows = @[[self getTransactionSummaryTableRow]];
    [self.datasource addObject:section2];
    
    
    RCITableSection *section3 = [[RCITableSection alloc]init];
    section3.rows = @[[self getCardInfoTableRow]];
    [self.datasource addObject:section3];
    
    RCITableSection *section4 = [[RCITableSection alloc]init];
    section4.rows = @[[self getStaticTextTableRow]];
    [self.datasource addObject:section4];
    
    RCITableSection *section5 = [[RCITableSection alloc]init];
    section5.rows = @[[self getParagraphTableRow]];
    [self.datasource addObject:section5];
  
    RCITableSection *section6 = [[RCITableSection alloc]init];
    section6.rows = @[[self getProtectionInformationRow]];
    [self.datasource addObject:section6];
   
    [self.resortBookingConfirmTableView reloadData];
}


-(RCITableRow*)getResortDetailRow {
    RCITableRow *row = [[RCITableRow alloc]init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCIResortDetailTableViewCell *cell =  (RCIResortDetailTableViewCell*)[self.resortBookingConfirmTableView dequeueReusableCellWithIdentifier:resortDetailCellIdentifier];
        cell.staticView.hidden = YES;
        cell.imageViewBottom.priority = UILayoutPriorityDefaultLow;
        cell.staticViewBottom.priority = UILayoutPriorityDefaultLow;
        cell.imageViewBottomWithContainer.priority = UILayoutPriorityDefaultHigh;
        return cell;
    };
    return row;
}

-(RCITableRow*)getTransactionSummaryTableRow {
    RCITableRow *row = [[RCITableRow alloc]init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCITransactionSummaryTableViewCell *cell =  (RCITransactionSummaryTableViewCell*)[self.resortBookingConfirmTableView dequeueReusableCellWithIdentifier:transactionSummaryCellIdentifier];
        
        return cell;
    };
    return row;
}

-(RCITableRow*)getCardInfoTableRow {
    RCITableRow *row = [[RCITableRow alloc]init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCICardInfoTableViewCell *cell =  (RCICardInfoTableViewCell*)[self.resortBookingConfirmTableView dequeueReusableCellWithIdentifier:cardInfoCellIdentifier];
        
        return cell;
    };
    return row;
}

-(RCITableRow*)getStaticTextTableRow {
    RCITableRow *row = [[RCITableRow alloc]init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCIStaticTextTableViewCell *cell =  (RCIStaticTextTableViewCell*)[self.resortBookingConfirmTableView dequeueReusableCellWithIdentifier:staticTextCellIdentifier];
        cell.staticText.text = @"Things you need to know";
        return cell;
    };
    return row;
}

-(RCITableRow*)getParagraphTableRow {
    RCITableRow *row = [[RCITableRow alloc]init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCIParagraphTableViewCell *cell =  (RCIParagraphTableViewCell*)[self.resortBookingConfirmTableView dequeueReusableCellWithIdentifier:paragraphCellIdentifier];
        return cell;
    };
    return row;
}

-(RCITableRow*)getProtectionInformationRow {
    
    RCITableRow *row = [[RCITableRow alloc]init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCIProtectInformationTableViewCell *cell =  (RCIProtectInformationTableViewCell*)[self.resortBookingConfirmTableView dequeueReusableCellWithIdentifier:protectionInformationCellIdentifier];
        return cell;
    };
    return row;
}

@end
