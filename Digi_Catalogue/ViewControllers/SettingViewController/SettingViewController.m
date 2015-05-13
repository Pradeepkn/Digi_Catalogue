//
//  BrinDemoSettingsViewController.m
//  BrintDemo
//
//  Created by Pradeep on 24/05/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "SettingViewController.h"
#include "FXImageView.h"
#import "BDUtility.h"
#import "Constant.h"

@interface SettingViewController ()

@property (strong, nonatomic) NSMutableArray *arrayOfImages;
@property (strong, nonatomic) NSMutableArray *arrayOfImagesNames;

@end

@implementation SettingViewController
@synthesize arrayOfImages;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg2.png"]];
    self.iCarouselView.type = iCarouselTypeCoverFlow;
    [[BDUtility sharedInstance] addShadowToView:self.calculatorView];
    self.calculatorView.backgroundColor = WHITE_HALF_TRANSPARENT;
    
    [[BDUtility sharedInstance] addShadowToView:self.enlargedImageBgView];

    [[BDUtility sharedInstance] addShadowToView:self.enlargedImageBgView];
    [[BDUtility sharedInstance] addShadowToView:self.calciView];
    self.enlargedImageBgView.backgroundColor = WHITE_LIGHT;

    self.enlargedImageBgView.layer.cornerRadius = 20.0f;
    self.enlargedImageView.layer.cornerRadius = 20.0f;
    self.calciView.layer.cornerRadius = 20.0f;
    self.enlargedImageBgView.hidden = YES;
    
    self.calciDescriptionLable.text = [NSString stringWithFormat:@"Hi there!\n Do you want to know about total price of what you are looking for?\n Fallow me."];
    [self.calciDescriptionLable sizeToFit];
}


- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    self.arrayOfImages = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"banner1.png"],[UIImage imageNamed:@"banner2.png"],[UIImage imageNamed:@"banner3.png"],[UIImage imageNamed:@"banner4.png"],[UIImage imageNamed:@"banner5.png"],[UIImage imageNamed:@"banner6.png"], nil];
    self.arrayOfImagesNames = [[NSMutableArray alloc] initWithObjects:@"banner 1",@"banner 2",@"banner 3",@"banner 4",@"banner 5",@"banner 6", nil];

    return [self.arrayOfImages count];
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"Index == %li",(long)index);
    self.enlargedImageView.image = [self.arrayOfImages objectAtIndex:index];
    [UIView animateWithDuration:1.0f delay:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.enlargedImageBgView.hidden = NO;
        self.calciView.hidden = YES;
        self.calculatorView.hidden = YES;
        self.enlargedImageBgView.alpha = 1.0f;
        self.calciView.alpha = 0.0f;
        self.calculatorView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        ;
    }];
}

- (void)carouselDidEndDecelerating:(iCarousel *)carousel{
    NSLog(@"carousel currentItemAt Index = %li",(long)carousel.currentItemIndex);
    self.itemLable.text  = [NSString stringWithFormat:@"%@",[self.arrayOfImagesNames objectAtIndex:(long)carousel.currentItemIndex]];
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel{
    NSLog(@"carousel currentItemAt Index = %li",(long)carousel.currentItemIndex);
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    //create new view if no view is available for recycling
    if (view == nil)
    {
        FXImageView *imageView = [[FXImageView alloc] initWithFrame:CGRectMake(self.iCarouselView.frame.origin.x, self.view.frame.size.height/2, self.view.frame.size.width*1.5, self.view.frame.size.height/2.5)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.asynchronous = YES;
        imageView.reflectionScale = 0.5f;
        imageView.reflectionAlpha = 0.25f;
        imageView.reflectionGap = 10.0f;
        imageView.shadowOffset = CGSizeMake(0.0f, 2.0f);
        imageView.shadowBlur = 5.0f;
        imageView.cornerRadius = 5.0f;
        view = imageView;
    }
    
    //show placeholder
    ((FXImageView *)view).processedImage = [UIImage imageNamed:@"placeholder.png"];
    
    //set image
    ((FXImageView *)view).image = arrayOfImages[index];
    self.itemLable.text  = [NSString stringWithFormat:@"%@",[self.arrayOfImagesNames objectAtIndex:0]];

    return view;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)closeButtonClicked:(id)sender {
    [UIView animateWithDuration:1.0f delay:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.enlargedImageBgView.hidden = YES;
        self.calciView.hidden = NO;
        self.calculatorView.hidden = NO;
        self.enlargedImageBgView.alpha = 0.0f;
        self.calciView.alpha = 1.0f;
        self.calculatorView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        ;
    }];
}
- (IBAction)calciSubmitButtonClicked:(id)sender {
}

- (IBAction)resetButtonClicked:(id)sender {
    self.yesBtn.hidden = NO;
    self.resetBtn.hidden = YES;
    self.nextBtn.hidden = YES;
    self.calciValueField.hidden = YES;
}

- (IBAction)yesButtonClicked:(id)sender {
    self.yesBtn.hidden = YES;
    self.nextBtn.hidden = NO;
    self.resetBtn.hidden = NO;
    self.calciValueField.hidden = NO;
}

- (void)keyboardWasShown:(NSNotification *)notification
{
    // Works in both portrait and landscape mode
    CGRect kbRect = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    kbRect = [self.view convertRect:kbRect toView:nil];
    
    CGSize kbSize = kbRect.size;
    
    CGRect calciRect = self.calculatorView.frame;
    calciRect.origin.y -= kbSize.height - 55;
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.calculatorView.frame = calciRect;
    } completion:^(BOOL finished) {
        ;
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    // Works in both portrait and landscape mode
    CGRect kbRect = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    kbRect = [self.view convertRect:kbRect toView:nil];
    
    CGSize kbSize = kbRect.size;
    
    CGRect calciRect = self.calculatorView.frame;
    calciRect.origin.y += kbSize.height - 55;
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.calculatorView.frame = calciRect;
    } completion:^(BOOL finished) {
        ;
    }];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (IBAction)logOutButtonClicked:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
