//
//  BrinDemoSettingsViewController.h
//  BrintDemo
//
//  Created by Pradeep on 24/05/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface SettingViewController : UIViewController
@property (weak, nonatomic) IBOutlet iCarousel *iCarouselView;
@property (weak, nonatomic) IBOutlet UILabel *itemLable;
@property (weak, nonatomic) IBOutlet UIView *calculatorView;
@property (weak, nonatomic) IBOutlet UILabel *gold18k;
@property (weak, nonatomic) IBOutlet UILabel *gold22k;
@property (weak, nonatomic) IBOutlet UILabel *gold24k;
@property (weak, nonatomic) IBOutlet UILabel *silverPerGram;
@property (weak, nonatomic) IBOutlet UILabel *offersPrice;
@property (weak, nonatomic) IBOutlet UIView *enlargedImageBgView;
@property (weak, nonatomic) IBOutlet UIImageView *enlargedImageView;
- (IBAction)closeButtonClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *calciView;
@property (weak, nonatomic) IBOutlet UILabel *calciDescriptionLable;
@property (weak, nonatomic) IBOutlet UITextField *calciValueField;
- (IBAction)calciSubmitButtonClicked:(id)sender;
- (IBAction)resetButtonClicked:(id)sender;
- (IBAction)yesButtonClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *yesBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIButton *resetBtn;
- (IBAction)logOutButtonClicked:(id)sender;

@end
