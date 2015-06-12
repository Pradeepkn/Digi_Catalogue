//
//  HomeViewController.m
//  Digi_Catalogue
//
//  Created by Pradeep on 14/04/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#import "HomeViewController.h"
#import "iCarousel.h"
#import "OffersApi.h"
#import "DataUtility.h"

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
    [self callOffersApi];
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
    if (view == nil)
    {
        FXImageView *imageView = [[FXImageView alloc] initWithFrame:CGRectMake(self.carousel.frame.origin.x, self.view.frame.size.height/2, self.view.frame.size.width*1.5, self.view.frame.size.height/3)];
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
    ((FXImageView *)view).image = self.arrayOfImages[index];
//    self.itemLable.text  = [NSString stringWithFormat:@"%@",[self.self.arrayOfImages objectAtIndex:0]];
    
    return view;
}

- (void)callOffersApi
{
    if (!self.offersImagesArray) {
        self.offersImagesArray = [[NSMutableArray alloc] init];
    }
    self.offersImageView.image = [UIImage imageNamed:@"o6.png"];
    [self.offersImagesArray addObject:[UIImage imageNamed:@"o1.png"]];
    [self.offersImagesArray addObject:[UIImage imageNamed:@"o2.png"]];
    [self.offersImagesArray addObject:[UIImage imageNamed:@"o3.png"]];
    [self.offersImagesArray addObject:[UIImage imageNamed:@"o4.png"]];
    [self.offersImagesArray addObject:[UIImage imageNamed:@"o5.png"]];
    [self.offersImagesArray addObject:[UIImage imageNamed:@"o6.png"]];
     [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(offersImageAnimationWithImages) userInfo:nil repeats:YES];
//    OffersApi *offersApi = [[OffersApi alloc] init];
//    _imagesArray = [[NSMutableArray alloc] init];
//    offersApi.apiType = Get;
//    offersApi.cacheing = CACHE_PERSISTANT;
//    if (!self.offersImagesArray) {
//        self.offersImagesArray = [[NSMutableArray alloc] init];
//    }
//    [[DataUtility sharedInstance] dataForObject:offersApi response:^(APIBase *response, DataType dataType) {
//        if (offersApi.errorCode == 0) {
//            for (OffersDetails *offersDetails in offersApi.offers) {
//                
//                UIImageView *temp = [[UIImageView alloc] init];
//                [temp sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:offersDetails.offer_image] andPlaceholderImage:[UIImage imageNamed:@"loading.png"] options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//                } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                    if (image) {
//                        [self.offersImagesArray addObject:image];
//                    }
//                }];
//            }
//            [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(offersImageAnimationWithImages) userInfo:nil repeats:YES];
//        }
//    }];
}

- (void)offersImageAnimationWithImages
{
//    dispatch_async(dispatch_get_main_queue(), ^{
        NSInteger randomNumber = arc4random() % self.offersImagesArray.count;
        UIImage *image = (UIImage *)[self.offersImagesArray objectAtIndex:randomNumber];
        [UIView animateWithDuration:1 animations:^{
            CATransition *transition = [CATransition animation];
            transition.duration = 1.0f;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            transition.type = kCATransitionFade;
            self.offersImageView.image = image;
            self.offersImageView.contentMode = UIViewContentModeScaleAspectFit;
            [self.offersImageView.layer addAnimation:transition forKey:nil];
            [self.offersImageView startAnimating];
        }];
//    });
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
