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

//****** Sign Up View ******//
@property (weak, nonatomic) IBOutlet UIView *signUpContainerView;
@property (weak, nonatomic) IBOutlet UITextField *signUpNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *SignUpMobileTextField;
@property (weak, nonatomic) IBOutlet UITextField *signUpEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *signUpPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *signUpConfirmTextField;
//****** Forgot password API ******//
@property (weak, nonatomic) IBOutlet UIView *forgotPasswordContainerView;
@property (weak, nonatomic) IBOutlet UIView *forGotPasswordMainContainerView;
@property (weak, nonatomic) IBOutlet UITextField *forgotPasswordEmailTextField;

//****** Sign In View ******//
@property (weak, nonatomic) IBOutlet UIView *signInContainerView;
@property (weak, nonatomic) IBOutlet UITextField *signInUserNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *signInPasswordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mod.png"]];
    self.navigationController.navigationBarHidden = YES;
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(animateBackgroundImages) userInfo:nil repeats:YES];
    [self setUpViewElements];
}

- (void)setUpViewElements {
    self.signInContainerView.layer.shadowOffset = CGSizeMake(5, 5);
    self.signInContainerView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.signInContainerView.layer.masksToBounds = NO;
    self.signInContainerView.layer.shadowOpacity = 0.80f;
    self.signInContainerView.layer.shadowRadius = 1.0f;

    self.signUpContainerView.layer.shadowOffset = CGSizeMake(5, 5);
    self.signUpContainerView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.signUpContainerView.layer.masksToBounds = NO;
    self.signUpContainerView.layer.shadowOpacity = 0.80f;
    self.signUpContainerView.layer.shadowRadius = 1.0f;
    
    self.forgotPasswordContainerView.layer.shadowOffset = CGSizeMake(5, 5);
    self.forgotPasswordContainerView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.forgotPasswordContainerView.layer.masksToBounds = NO;
    self.forgotPasswordContainerView.layer.shadowOpacity = 0.80f;
    self.forgotPasswordContainerView.layer.shadowRadius = 1.0f;
}

- (IBAction)signUpButtonClicked:(id)sender {

}

- (IBAction)faceBookButtonClicked:(id)sender {
    self.signInContainerView.hidden = YES;
    self.signUpContainerView.hidden = YES;
    self.forGotPasswordMainContainerView.hidden = NO;
}

- (IBAction)signUpToLoginButtonClicked:(id)sender {
    self.signInContainerView.hidden = FALSE;
    self.signUpContainerView.hidden = YES;
}

- (IBAction)signInButtonClicked:(id)sender {

}

- (IBAction)signInSignUpButtonClicked:(id)sender {
    self.signInContainerView.hidden = YES;
    self.signUpContainerView.hidden = NO;
}

- (IBAction)forgotPasswordResetButtonClicked:(id)sender {
    self.signInContainerView.hidden = NO;
    self.signUpContainerView.hidden = YES;
    self.forGotPasswordMainContainerView.hidden = YES;
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
