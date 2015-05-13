//
//  LoginViewController.m
//  Digi_Catalogue
//
//  Created by Pradeep on 13/04/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#import "LoginViewController.h"
#import "MZLoadingCircle.h"

@interface LoginViewController (){
    MZLoadingCircle *loadingCircle;
}
@property(weak, nonatomic) IBOutlet UIImageView *scrollViewImageView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mod.png"]];
    self.navigationController.navigationBarHidden = YES;
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(animateBackgroundImages) userInfo:nil repeats:YES];
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

- (void)animateBackgroundImages {
    NSMutableArray *emmaImagesArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"mod.png"],[UIImage imageNamed:@"banner1.png"], [UIImage imageNamed:@"banner2.png"],[UIImage imageNamed:@"banner3.png"],[UIImage imageNamed:@"banner4.png"],[UIImage imageNamed:@"banner5.png"],[UIImage imageNamed:@"banner6.png"],nil];
    NSInteger randomNumber = arc4random() % 6;
    UIImage *image = (UIImage *)[emmaImagesArray objectAtIndex:randomNumber];
    [UIView animateWithDuration:1 animations:^{
        CATransition *transition = [CATransition animation];
        transition.duration = 3.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionFade;
        self.scrollViewImageView.image = image;
        [self.scrollViewImageView.layer addAnimation:transition forKey:nil];
        [self.scrollViewImageView startAnimating];
    }];
}

@end
