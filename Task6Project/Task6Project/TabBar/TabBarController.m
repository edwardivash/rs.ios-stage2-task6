//
//  TabBarController.m
//  Task6Project
//
//  Created by Эдуард on 6/22/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import "TabBarController.h"
#import "TabBarViewController1.h"
#import "CollectionViewController.h"
#import "TabBarViewController3.h"
#import "UIColor+ColorFromHex.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self custmoizeTabs];
}

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO];
      self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"0xF9CC78"];
      self.navigationController.navigationBar.translucent = NO;

}


-(void)custmoizeTabs {
    
    TabBarViewController1 *firstTab = [[TabBarViewController1 alloc]init];
    UITabBarItem *firstItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"info_unselected"] selectedImage:[UIImage imageNamed:@"info_selected"]];
    firstTab.tabBarItem = firstItem;
    [self.navigationController pushViewController:firstTab animated:NO];
    
    CollectionViewController *secondTab = [[CollectionViewController alloc]init];
    UITabBarItem *secondItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"gallery_unselected"] selectedImage:[UIImage imageNamed:@"gallery_unselected"]];
    secondTab.tabBarItem = secondItem;
    [self.navigationController pushViewController:secondTab animated:NO];
    
    TabBarViewController3 *thirdTab = [[TabBarViewController3 alloc]init];
    UITabBarItem *thirdItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"home_unselected"] selectedImage:[UIImage imageNamed:@"home_selected"]];
    thirdTab.tabBarItem = thirdItem;
    [self.navigationController pushViewController:thirdTab animated:NO];
    
    self.viewControllers = @[firstTab,secondTab,thirdTab];
    [[UITabBar appearance] setTintColor:[UIColor colorWithHexString:@"0x101010"]];
}



@end
