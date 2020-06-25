//
//  TabBarViewController1.m
//  Task6Project
//
//  Created by Эдуард on 6/21/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import "TabBarViewController1.h"
#import "TableViewData.h"
#import "TabBarTableViewCell.h"
#import "UIColor+ColorFromHex.h"
#import "InfoViewController.h"

@interface TabBarViewController1 () {
    
    NSArray *leftArray;
    NSArray *rightArray;
    NSArray *imgArray;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *imgNames;
@property (nonatomic, strong) NSMutableArray <TableViewData*> *dataSource;

@end

@implementation TabBarViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customTableView];
    [self customCell];
}

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.title = @"Info";
}

-(void)customTableView {
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
    ]];
}

-(void)customCell{
    leftArray = [[NSArray alloc]initWithObjects:@"01:23",@"4032x3024",@"",@"720x480", nil];
    
    rightArray = [[NSArray alloc]initWithObjects:@"audio",@"image",@"other",@"video", nil];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return leftArray.count;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 70;
}

- (TabBarTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView registerNib:[UINib nibWithNibName:@"TabBarTableViewCell" bundle:nil] forCellReuseIdentifier:@"celll"];
    TabBarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celll" forIndexPath:indexPath];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"TabBarTableViewCell" bundle:nil] forCellReuseIdentifier:@"celll"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"celll"];
    }
    cell.subtitle.text = [leftArray objectAtIndex:indexPath.row];
    cell.title.text = [rightArray objectAtIndex:indexPath.row];
    [cell.smallImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.pdf", cell.title.text]]];
    [cell.bigImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Image0%@",imgArray[indexPath.row]]]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    InfoViewController *infoVC = [[InfoViewController alloc]initWithNibName:@"InfoViewController" bundle:nil];
    [self.navigationController pushViewController:infoVC animated:YES];

}

@end
