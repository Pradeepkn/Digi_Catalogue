//
//  FeedBackViewController.m
//  Digi_Catalogue
//
//  Created by Pradeep on 11/05/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()

@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
@end

@implementation FeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logoutButtonAction:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
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