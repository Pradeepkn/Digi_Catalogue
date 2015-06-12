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

//model
#import "YALTabBarItem.h"

//controller
#import "YALFoldingTabBarController.h"

//helpers
#import "YALAnimatingTabBarConstants.h"

static NSString *const kMainStoryBoard = @"Main";
static NSString *const kSplitViewStoryBoard = @"SplitViewStoryBoard";

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
  [super viewDidLoad];
  NSMutableArray *tabbarItems = [NSMutableArray array];

    HomeViewController *homeVC = (HomeViewController *)[[UIStoryboard storyboardWithName:kMainStoryBoard bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([HomeViewController class])];
    homeVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"HOME" image:[UIImage imageNamed:@"new_chat_icon"] tag:1];

    SplitViewController *goldVC = (SplitViewController *)[[UIStoryboard storyboardWithName:kSplitViewStoryBoard bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([SplitViewController class])];
    goldVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"GOLD" image:[UIImage imageNamed:@"new_chat_icon"] tag:2];

    SplitViewController *silverVC = (SplitViewController *)[[UIStoryboard storyboardWithName:kSplitViewStoryBoard bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([SplitViewController class])];
    silverVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"SILVER" image:[UIImage imageNamed:@"new_chat_icon"] tag:3];

    SplitViewController *diamondVC = (SplitViewController *)[[UIStoryboard storyboardWithName:kSplitViewStoryBoard bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([SplitViewController class])];
    diamondVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"DIAMOND" image:[UIImage imageNamed:@"new_chat_icon"] tag:4];

    SplitViewController *platinumVC = (SplitViewController *)[[UIStoryboard storyboardWithName:kSplitViewStoryBoard bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([SplitViewController class])];
    platinumVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"PLATINUM" image:[UIImage imageNamed:@"new_chat_icon"] tag:5];

    SettingViewController *settingVC = (SettingViewController *)[[UIStoryboard storyboardWithName:kMainStoryBoard bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([SettingViewController class])];
    settingVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"SETTINGS" image:[UIImage imageNamed:@"settings_icon"] tag:6];

    FeedBackViewController *feedbackVC = (FeedBackViewController *)[[UIStoryboard storyboardWithName:kMainStoryBoard bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:NSStringFromClass([FeedBackViewController class])];
    feedbackVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"FEEDBACK" image:[UIImage imageNamed:@"new_chat_icon"] tag:7];
    
  [tabbarItems addObject:homeVC];
  [tabbarItems addObject:goldVC];
  [tabbarItems addObject:silverVC];
  [tabbarItems addObject:diamondVC];
  [tabbarItems addObject:platinumVC];
  [tabbarItems addObject:settingVC];
  [tabbarItems addObject:feedbackVC];

  [self setViewControllers:tabbarItems animated:YES];
//    [self setupYALTabBarController];

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

- (void)setupYALTabBarController {
    
    //prepare leftBarItems
    YALTabBarItem *item1 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"nearby_icon"]
                                                      leftItemImage:nil
                                                     rightItemImage:nil];
    
    
    YALTabBarItem *item2 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"profile_icon"]
                                                      leftItemImage:[UIImage imageNamed:@"edit_icon"]
                                                     rightItemImage:nil];
    
//    self.leftBarItems = @[item1, item2];
    
    //prepare rightBarItems
    YALTabBarItem *item3 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"chats_icon"]
                                                      leftItemImage:[UIImage imageNamed:@"search_icon"]
                                                     rightItemImage:[UIImage imageNamed:@"new_chat_icon"]];
    
    
    YALTabBarItem *item4 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"settings_icon"]
                                                      leftItemImage:nil
                                                     rightItemImage:nil];
    
    YALTabBarItem *item5 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"settings_icon"]
                                                      leftItemImage:nil
                                                     rightItemImage:nil];
    
//    self.rightBarItems = @[item3, item4, item5];
//    
//    self.centerButtonImage = [UIImage imageNamed:@"plus_icon"];
//    
//    self.selectedIndex = 2;
//    self.delegate = self;
//    //customize tabBarView
//    self.tabBarView.extraTabBarItemHeight = YALExtraTabBarItemsDefaultHeight;
//    self.tabBarView.offsetForExtraTabBarItems = YALForExtraTabBarItemsDefaultOffset;
//    self.tabBarView.backgroundColor = [UIColor colorWithRed:94.0/255.0 green:91.0/255.0 blue:149.0/255.0 alpha:1];
//    self.tabBarView.tabBarColor = [UIColor colorWithRed:72.0/255.0 green:211.0/255.0 blue:178.0/255.0 alpha:1];
//    self.tabBarViewHeight = YALTabBarViewDefaultHeight;
//    self.tabBarView.tabBarViewEdgeInsets = YALTabBarViewHDefaultEdgeInsets;
//    self.tabBarView.tabBarItemsEdgeInsets = YALTabBarViewItemsDefaultEdgeInsets;
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
