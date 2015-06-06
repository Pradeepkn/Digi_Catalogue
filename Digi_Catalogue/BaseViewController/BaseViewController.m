//
//  BaseViewController.m
//  Digi_Catalogue
//
//  Created by Pradeep on 13/04/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#import "BaseViewController.h"
#import "MZLoadingCircle.h"

@interface BaseViewController (){
    MZLoadingCircle *loadingCircle;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)setStackIconClosed:(BOOL)closed
{
    UIImageView *icon = [[self.view subviews] objectAtIndex:0];
    float angle = closed ? 0 : (M_PI * (135) / 180.0);
    [UIView animateWithDuration:0.3 animations:^{
        [icon.layer setAffineTransform:CGAffineTransformRotate(CGAffineTransformIdentity, angle)];
    }];
}

- (void)showLoadingMode {
    if (!loadingCircle) {
        loadingCircle = [[MZLoadingCircle alloc] initWithNibName:nil bundle:nil];
        loadingCircle.view.backgroundColor = [UIColor clearColor];
        
        //Colors for layers
        loadingCircle.colorCustomLayer = [UIColor colorWithRed:0 green:0.4 blue:0 alpha:1];
        loadingCircle.colorCustomLayer2 = [UIColor colorWithRed:0 green:0.4 blue:0 alpha:0.65];
        loadingCircle.colorCustomLayer3 = [UIColor colorWithRed:0 green:0.4 blue:0 alpha:0.4];
        
        int size = 100;
        
        CGRect frame = loadingCircle.view.frame;
        frame.size.width = size;
        frame.size.height = size;
        frame.origin.x = self.view.frame.size.width / 2 - frame.size.width / 2;
        frame.origin.y = self.view.frame.size.height / 2 - frame.size.height / 2;
        loadingCircle.view.frame = frame;
        loadingCircle.view.layer.zPosition = MAXFLOAT;
        [self.view addSubview:loadingCircle.view];
    }
}

- (void)hideLoadingMode {
    if (loadingCircle) {
        [loadingCircle.view removeFromSuperview];
        loadingCircle = nil;
    }
}

- (void)showLoading {
    if (!loadingCircle) {
        [self showLoadingMode];
    } else {
        [self hideLoadingMode];
    }
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
