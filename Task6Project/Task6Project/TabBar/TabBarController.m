//
//  TabBarController.m
//  Task6Project
//
//  Created by Эдуард on 6/22/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import "TabBarController.h"
#import "TabBarViewController1.h"
#import "TabBarViewController2.h"
#import "TabBarViewController3.h"
#import "UIColor+ColorFromHex.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self custmoizeTabs];
}

-(void)custmoizeTabs {
    
    TabBarViewController1 *firstTab = [[TabBarViewController1 alloc]init];
    UIImage *selectedImage1 = [UIImage imageNamed:@"info_selected"];
    UITabBarItem *firstItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"info_unselected"] selectedImage:selectedImage1];
    firstTab.tabBarItem = firstItem;
    [self.navigationController pushViewController:firstTab animated:NO];
    
    TabBarViewController2 *secondTab = [[TabBarViewController2 alloc]init];
    UIImage *selectedImage2 = [UIImage imageNamed:@"gallery_selected"];
    UITabBarItem *secondItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"gallery_unselected"] selectedImage:selectedImage2];
    secondTab.tabBarItem = secondItem;
    [self.navigationController pushViewController:secondTab animated:NO];
    
    TabBarViewController3 *thirdTab = [[TabBarViewController3 alloc]init];
    UIImage *selectedImage3 = [UIImage imageNamed:@"home_selected"];
    UITabBarItem *thirdItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"home_unselected"] selectedImage:selectedImage3];
    thirdTab.tabBarItem = thirdItem;
    [self.navigationController pushViewController:thirdTab animated:NO];
    
    self.viewControllers = @[firstTab,secondTab,thirdTab];
    [[UITabBar appearance] setTintColor:[UIColor colorWithHexString:@"0x101010"]];

}



@end
