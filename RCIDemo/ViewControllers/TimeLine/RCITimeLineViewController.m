//
//  RCITimeLineViewController.m
//  RCIDemo
//
//  Created by teammobility on 15/02/18.
//  Copyright © 2018 Rci Cts. All rights reserved.
//


#import "RCITimeLineViewController.h"
#import "RCITimeLineTipsTableViewCell.h"
#import "RCITimeLineStaticTableViewCell.h"
#import "RCITimelineLocationTableViewCell.h"
#import "RCITimeLineTravelDateTableViewCell.h"
#import "RCITimelLineThingsToDoTableViewCell.h"
#import "RCITableSection.h"
#import "RCITableRow.h"

static NSString *locationIdentifier = @"TimelineLocationCell";
static NSString *travelDateIdentifier = @"TimelineTravelCell";
static NSString *staticCellIdentifier = @"TimelineStaticCell";
static NSString *tipsCellIdentifier = @"TimelineTipsCell";
static NSString *thingsToDoIdentifier = @"TimeLineThingsToDoCell";


@interface RCITimeLineViewController ()
@property (nonatomic, weak) IBOutlet UITableView *timelineTableView;
@property (nonatomic, strong) NSMutableArray *datasource;

@end

@implementation RCITimeLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

-(void)setupView {
    self.timelineTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.timelineTableView registerNib:[UINib nibWithNibName:@"RCITimelineLocationTableViewCell" bundle:nil] forCellReuseIdentifier:locationIdentifier];
    [self.timelineTableView registerNib:[UINib nibWithNibName:@"RCITimeLineTravelDateTableViewCell" bundle:nil] forCellReuseIdentifier:travelDateIdentifier];
    [self.timelineTableView registerNib:[UINib nibWithNibName:@"RCITimeLineStaticTableViewCell" bundle:nil] forCellReuseIdentifier:staticCellIdentifier];
    [self.timelineTableView registerNib:[UINib nibWithNibName:@"RCITimeLineTipsTableViewCell" bundle:nil] forCellReuseIdentifier:tipsCellIdentifier];
    [self.timelineTableView registerNib:[UINib nibWithNibName:@"RCITimeLineTipsTableViewCell" bundle:nil] forCellReuseIdentifier:tipsCellIdentifier];
    [self.timelineTableView registerNib:[UINib nibWithNibName:@"RCITimelLineThingsToDoTableViewCell" bundle:nil] forCellReuseIdentifier:thingsToDoIdentifier];

    
}

-(NSMutableArray*)datasource {
    if (!_datasource) {
        _datasource = [NSMutableArray array];
        RCITableSection *section1 = [[RCITableSection alloc]init];
        section1.sectionHeaderHeight = 5.0f;
        section1.sectionFooterHeight = 1.0f;
        section1.rows = @[[self getLocationTableRow]];
        [_datasource addObject:section1];
        
        RCITableSection *section2 = [[RCITableSection alloc]init];
        section2.sectionHeaderHeight = 1.0f;
        section2.sectionFooterHeight = 1.0f;
        section2.rows = @[[self getTravelDateTableRow]];
        [_datasource addObject:section2];
        
        RCITableSection *section3 = [[RCITableSection alloc]init];
        section3.sectionHeaderHeight = 1.0f;
        section3.sectionFooterHeight = 1.0f;
        section3.rows = @[[self getTravelOptionTableRow]];
        [_datasource addObject:section3];
        
        RCITableSection *section4 = [[RCITableSection alloc]init];
        section4.sectionHeaderHeight = 1.0f;
        section4.sectionFooterHeight = 1.0f;
        section4.rows = @[[self getTBookingForGuestTableRow]];
        [_datasource addObject:section4];
        
        RCITableSection *section5 = [[RCITableSection alloc]init];
        section5.sectionHeaderHeight = 1.0f;
        section5.sectionFooterHeight = 1.0f;
        section5.rows = @[[self getTipsForYourTableRow]];
        [_datasource addObject:section5];
        
        RCITableSection *section6 = [[RCITableSection alloc]init];
        section6.sectionHeaderHeight = 1.0f;
        section6.sectionFooterHeight = 1.0f;
        section6.rows = @[[self getThingsToDoTableRow]];
        [_datasource addObject:section6];
    }
    return _datasource;
}

-(RCITableRow*)getLocationTableRow {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCITimelineLocationTableViewCell *cell =  (RCITimelineLocationTableViewCell*)[self.timelineTableView dequeueReusableCellWithIdentifier:locationIdentifier];
        return cell;
    };
    return row;
}

-(RCITableRow*)getTravelDateTableRow {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCITimeLineTravelDateTableViewCell *cell =  (RCITimeLineTravelDateTableViewCell*)[self.timelineTableView dequeueReusableCellWithIdentifier:travelDateIdentifier];
        return cell;
    };
    return row;
}

-(RCITableRow*)getTravelOptionTableRow {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCITimeLineStaticTableViewCell *cell =  (RCITimeLineStaticTableViewCell*)[self.timelineTableView dequeueReusableCellWithIdentifier:staticCellIdentifier];
        cell.headerText.text = @"Travel Options";
        cell.paragraphText.text = @"You can also book your travel arrangement through our travel partners";
        cell.logo.image = [UIImage imageNamed:@"travel"];
        return cell;
    };
    return row;
}

-(RCITableRow*)getTBookingForGuestTableRow {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCITimeLineStaticTableViewCell *cell =  (RCITimeLineStaticTableViewCell*)[self.timelineTableView dequeueReusableCellWithIdentifier:staticCellIdentifier];
        cell.headerText.text = @"Booking for a Guest";
        cell.paragraphText.text = @"A guest certificate is required if this reservation is made for a friend or family member";
        cell.logo.image = [UIImage imageNamed:@"guest"];
        return cell;
        return cell;
    };
    return row;
}

-(RCITableRow*)getTipsForYourTableRow {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCITimeLineTipsTableViewCell *cell =  (RCITimeLineTipsTableViewCell*)[self.timelineTableView dequeueReusableCellWithIdentifier:tipsCellIdentifier];
        return cell;
    };
    return row;
}

-(RCITableRow*)getThingsToDoTableRow {
    RCITableRow *row = [[RCITableRow alloc] init];
    row.loadCell = ^UITableViewCell * (NSIndexPath *indexPath) {
        RCITimelLineThingsToDoTableViewCell *cell =  (RCITimelLineThingsToDoTableViewCell*)[self.timelineTableView dequeueReusableCellWithIdentifier:thingsToDoIdentifier];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RCITableSection *section = [self.datasource objectAtIndex:indexPath.section];
    RCITableRow *row = [section.rows objectAtIndex:indexPath.row];
    row.didSelectRow(indexPath);
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
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

@end
