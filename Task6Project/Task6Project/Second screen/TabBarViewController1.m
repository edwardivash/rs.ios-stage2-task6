//
//  TabBarViewController1.m
//  Task6Project
//
//  Created by Эдуард on 6/21/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import "TabBarViewController1.h"
#import "TableViewCell.h"
#import "TableViewData.h"

@interface TabBarViewController1 ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray <TableViewData*> *dataSource;
@end

@implementation TabBarViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customTableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

-(void)customTableView {
    self.tableView = [[UITableView alloc]init];
    [self.tableView registerClass:TableViewCell.class forCellReuseIdentifier:@"CellId"];
    [self.view addSubview:self.tableView];
}

// DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    return cell;
}

// Delegate

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}


@end
