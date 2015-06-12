//
//  ProductDetailViewController.m
//  Digi_Catalogue
//
//  Created by Pradeep on 6/2/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "UIImage+ProportionalFill.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "DataManager.h"
#import "Items.h"

@interface ProductDetailViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *productScrollView;
@property (weak, nonatomic) IBOutlet UIView *productDetailContainerView;
@property (weak, nonatomic) IBOutlet UILabel *productDetailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UIButton *detailButton;

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
//    Items *item = (Items *)[self.itemsArray objectAtIndex:self.selectedIndex];
//
//    [self.productImageView sd_setImageWithURL:[NSURL URLWithString:item.uri] placeholderImage:[UIImage imageNamed:@"Placeholder.png"]];
    CGFloat x_OffSet = self.productImageView.frame.origin.x;
    for (int index = 0; index < self.itemsArray.count; index++) {
        CGRect frame = self.productImageView.frame;
        frame.origin.x = x_OffSet + (index * self.productScrollView.frame.size.width);
        frame.size.width = self.productScrollView.frame.size.width - (x_OffSet*2);

        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        Items *item = (Items *)[self.itemsArray objectAtIndex:index];
        [imageView sd_setImageWithURL:[NSURL URLWithString:item.uri] placeholderImage:[UIImage imageNamed:@"Placeholder.png"]];
        [self.productScrollView addSubview:imageView];
        [self.productScrollView setContentSize:CGSizeMake(index*self.productScrollView.frame.size.width + self.productScrollView.frame.size.width, self.productScrollView.frame.size.height)];
    }
    [self.productScrollView setContentOffset:CGPointMake(self.selectedIndex, 1)];
    self.productImageView.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (IBAction)discloseProductDetailsButtonClicked:(UIButton *)sender {
    float angle = /* DISABLES CODE */ (NO) ? 0 : (M_PI * (90) / 180.0);
    [UIView animateWithDuration:0.3 animations:^{
        [sender.imageView.layer setAffineTransform:CGAffineTransformRotate(CGAffineTransformIdentity, angle)];
    }];
    self.productDetailContainerView.hidden = NO;
}

- (IBAction)hideProductDetailContainerView:(id)sender {
    self.productDetailContainerView.hidden = YES;
    float angle = /* DISABLES CODE */ (NO) ? 0 : (M_PI * (-90) / 180.0);
    [UIView animateWithDuration:0.3 animations:^{
        [self.detailButton.layer setAffineTransform:CGAffineTransformRotate(CGAffineTransformIdentity, angle)];
    }];
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
