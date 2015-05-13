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
#import "FeedBackViewController.h"
#import "DataManager.h"

static NSString *const kMainStoryBoard = @"Main";
static NSString *const kSplitViewStoryBoard = @"SplitViewStoryBoard";

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
  [super viewDidLoad];
  NSMutableArray *tabbarItems = [NSMutableArray array];

    HomeViewController *homeVC = (HomeViewController *)[[UIStoryboard storyboardWithName:kMainStoryBoard bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([HomeViewController class])];
    homeVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:1];

    SplitViewController *goldVC = (SplitViewController *)[[UIStoryboard storyboardWithName:kSplitViewStoryBoard bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([SplitViewController class])];
    goldVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:2];

    SplitViewController *silverVC = (SplitViewController *)[[UIStoryboard storyboardWithName:kSplitViewStoryBoard bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([SplitViewController class])];
    silverVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:3];

    SplitViewController *diamondVC = (SplitViewController *)[[UIStoryboard storyboardWithName:kSplitViewStoryBoard bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([SplitViewController class])];
    diamondVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:4];

    SplitViewController *platinumVC = (SplitViewController *)[[UIStoryboard storyboardWithName:kSplitViewStoryBoard bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([SplitViewController class])];
    platinumVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:5];

    SettingViewController *settingVC = (SettingViewController *)[[UIStoryboard storyboardWithName:kMainStoryBoard bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([SettingViewController class])];
    settingVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:6];

    FeedBackViewController *feedbackVC = (FeedBackViewController *)[[UIStoryboard storyboardWithName:kMainStoryBoard bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([FeedBackViewController class])];
    feedbackVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:7];
    
  [tabbarItems addObject:homeVC];
  [tabbarItems addObject:goldVC];
  [tabbarItems addObject:silverVC];
  [tabbarItems addObject:diamondVC];
  [tabbarItems addObject:platinumVC];
  [tabbarItems addObject:settingVC];
  [tabbarItems addObject:feedbackVC];

  [self setViewControllers:tabbarItems animated:YES];
  // Do any additional setup after loading the view.
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    switch (item.tag) {
        case 1:
            [[DataManager sharedInstance] setHomeViewType:HomeViewTab];
            break;
        case 2:
            [[DataManager sharedInstance] setHomeViewType:GoldViewTab];
            break;
        case 3:
            [[DataManager sharedInstance] setHomeViewType:SilverViewTab];
            break;
        case 4:
            [[DataManager sharedInstance] setHomeViewType:DiamondViewTab];
            break;
        case 5:
            [[DataManager sharedInstance] setHomeViewType:PlatinumViewTab];
            break;
        case 6:
            [[DataManager sharedInstance] setHomeViewType:SettingsViewTab];
            break;
        case 7:
            [[DataManager sharedInstance] setHomeViewType:FeedbackViewTab];
            break;
        default:
            break;
    }
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
