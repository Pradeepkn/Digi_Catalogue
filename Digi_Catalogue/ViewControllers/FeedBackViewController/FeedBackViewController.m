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
@property (weak, nonatomic) IBOutlet UIImageView *selectedFeedBackImage;
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

- (IBAction)feedBackRatingButtonClicked:(UIButton *)sender {
    [self.selectedFeedBackImage setImage:sender.imageView.image];
    switch (sender.tag) {
        case 1:
            ;
            break;
        case 2:
            ;
            break;
        case 3:
            ;
            break;
        case 4:
            ;
            break;
        case 5:
            ;
            break;
            
        default:
            break;
    }
}

- (IBAction)sendFeedBackButtonClicked:(id)sender {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Thank you!!" message:@"Thanks for your feedback. We will try to improve the quality of service" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
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
