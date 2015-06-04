//
//  ProductDetailViewController.m
//  Digi_Catalogue
//
//  Created by Pradeep on 6/2/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "DataManager.h"

@interface ProductDetailViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *productScrollView;
@property (weak, nonatomic) IBOutlet UIView *productDetailContainerView;
@property (weak, nonatomic) IBOutlet UILabel *productDetailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [DataManager applyShadowEffectForView:self.productDetailContainerView];
    self.productDetailContainerView.hidden = YES;
    [DataManager applyShadowEffectForView:self.productImageView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (IBAction)discloseProductDetailsButtonClicked:(id)sender {
    self.productDetailContainerView.hidden = NO;
}

- (IBAction)hideProductDetailContainerView:(id)sender {
    self.productDetailContainerView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
