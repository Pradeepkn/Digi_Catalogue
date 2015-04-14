//
//  TabBarController.m
//  Digi_Catalogue
//
//  Created by Pradeep on 14/04/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#import "TabBarController.h"
#import "HomeViewController.h"
#import "SplitViewController.h"
#import "SettingViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
  [super viewDidLoad];
  NSMutableArray *tabbarItems = [NSMutableArray array];

  HomeViewController *homeVC = (HomeViewController *)[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([HomeViewController class])];

  SplitViewController *splitVC1 = (SplitViewController *)[[UIStoryboard storyboardWithName:@"SplitViewStoryBoard" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([SplitViewController class])];
  splitVC1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:1];

  SplitViewController *splitVC2 = (SplitViewController *)[[UIStoryboard storyboardWithName:@"SplitViewStoryBoard" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([SplitViewController class])];
  splitVC2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:2];

  SplitViewController *splitVC3 = (SplitViewController *)[[UIStoryboard storyboardWithName:@"SplitViewStoryBoard" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([SplitViewController class])];
  NSLog(@"%@", splitVC3.viewControllers);

  splitVC3.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:3];

  SplitViewController *splitVC4 = (SplitViewController *)[[UIStoryboard storyboardWithName:@"SplitViewStoryBoard" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([SplitViewController class])];
  splitVC4.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:4];

  SettingViewController *settingVC = (SettingViewController *)[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([SettingViewController class])];

  [tabbarItems addObject:homeVC];
  [tabbarItems addObject:splitVC1];
  [tabbarItems addObject:splitVC2];
  [tabbarItems addObject:splitVC3];
  [tabbarItems addObject:splitVC4];
  [tabbarItems addObject:settingVC];

  [self setViewControllers:tabbarItems animated:YES];
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
