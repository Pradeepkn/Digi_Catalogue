//
//  HomeViewController.m
//  Digi_Catalogue
//
//  Created by Pradeep on 14/04/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#import "HomeViewController.h"
#import "iCarousel.h"

@interface HomeViewController ()

@property(strong, nonatomic) NSMutableArray *corouselDataSource;
@property(strong, nonatomic) NSMutableArray *imagesArray;
@property(strong, nonatomic) NSMutableArray *arrayOfImages;
@property(strong, nonatomic) NSMutableArray *offersImagesArray;
@property(weak, nonatomic) IBOutlet UIImageView *offersImageView;
@property(weak, nonatomic) IBOutlet iCarousel *carousel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.carousel.type = iCarouselTypeCylinder;
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(animateBackgroundImages) userInfo:nil repeats:YES];
}

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    self.arrayOfImages = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"banner1.png"], [UIImage imageNamed:@"banner2.png"], [UIImage imageNamed:@"banner3.png"], [UIImage imageNamed:@"banner4.png"], [UIImage imageNamed:@"banner5.png"], [UIImage imageNamed:@"banner6.png"], nil];

    return [self.arrayOfImages count];
}

- (void)animateBackgroundImages {
    NSMutableArray *emmaImagesArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"banner1.png"], [UIImage imageNamed:@"banner2.png"],[UIImage imageNamed:@"banner3.png"],[UIImage imageNamed:@"banner4.png"],[UIImage imageNamed:@"banner5.png"],[UIImage imageNamed:@"banner6.png"],nil];
    NSInteger randomNumber = arc4random() % 6;
    UIImage *image = (UIImage *)[emmaImagesArray objectAtIndex:randomNumber];
    [UIView animateWithDuration:1 animations:^{
        CATransition *transition = [CATransition animation];
        transition.duration = 3.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionFade;
        self.offersImageView.image = image;
        [self.offersImageView.layer addAnimation:transition forKey:nil];
        [self.offersImageView startAnimating];
    }];
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
  NSLog(@"Index == %li", (long)index);
}

- (void)carouselDidEndDecelerating:(iCarousel *)carousel {
  NSLog(@"carousel currentItemAt Index = %li", (long)carousel.currentItemIndex);
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel {
  NSLog(@"carousel currentItemAt Index = %li", (long)carousel.currentItemIndex);
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view {
    //create new view if no view is available for recycling
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(self.carousel.frame.origin.x, self.view.frame.size.height/2, self.view.frame.size.width*1.5, self.view.frame.size.height/3)];
        ((UIImageView *)view).image = (UIImage *)[self.arrayOfImages objectAtIndex:index];
        view.contentMode = UIViewContentModeScaleAspectFit;
    }
    return view;
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
