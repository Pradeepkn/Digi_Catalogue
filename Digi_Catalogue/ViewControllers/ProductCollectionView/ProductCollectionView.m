//
//  GoldDetailViewController.m
//  Digi_Catalogue
//
//  Created by Pradeep on 14/04/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#import "ProductCollectionView.h"
#import "GalleryItemCollectionViewCell.h"
#import "UIImage+ProportionalFill.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ProductCollectionView () {
  NSMutableArray *_galleryItems;
}

@property(weak, nonatomic) IBOutlet UICollectionView *galleryCollectionView;
@property(strong, nonatomic) NSMutableArray *productDetails;

@end

@implementation ProductCollectionView

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return 4; //[self.productDetails count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  GalleryItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GalleryItemCollectionViewCell" forIndexPath:indexPath];
  //  NSString *url = @"";
  //  [cell.galleryImageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"mod.png"]];
  cell.imageTitle.text = @"Purity: 22 kr";
  cell.galleryImageView.image = [cell.galleryImageView.image imageToFitSize:cell.galleryImageView.frame.size method:MGImageResizeCrop];
  cell.priceLabel.text = [NSString stringWithFormat:@"Price: र %@", @"28,000"];
  return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  //  selectedIndex = indexPath.row;
  //  [self performSegueWithIdentifier:kItemDetailSeague sender:nil];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  CGFloat picDimension = self.view.frame.size.width;
  return CGSizeMake(picDimension / 3.5, picDimension / 2.5);
}

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//  //  CGFloat leftRightInset = self.view.frame.size.width;
////  return UIEdgeInsetsMake(20, 20, 0, 20);
//}

#pragma mark -
#pragma mark - search delegates.

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar {
}

- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {
}
- (void)doneSearching_Clicked {
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
