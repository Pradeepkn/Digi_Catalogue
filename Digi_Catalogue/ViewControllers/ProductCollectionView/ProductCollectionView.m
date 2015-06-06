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
#import "Constant.h"
#import "DataManager.h"
#import "ProductDetailViewController.h"
#import "CollectionsApi.h"
#import "DataUtility.h"
#import "ListOfItems.h"
#import "Products.h"
#import "Items.h"

static NSString *const kEKProductDetailsStoryboard = @"ProductDetailStoryboard";

@interface ProductCollectionView () {
  NSMutableArray *_galleryItems;
    HomeViewType homeType;
}

@property(weak, nonatomic) IBOutlet UICollectionView *galleryCollectionView;
@property(weak, nonatomic) IBOutlet UISearchBar *itemSearchBar;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedFilterBar;

@property(strong, nonatomic) NSMutableArray *productDetails;

@end

@implementation ProductCollectionView

- (void)viewDidLoad {
    [super viewDidLoad];
    homeType = [[DataManager sharedInstance] getCollectionViewType];
    switch (homeType) {
        case GoldViewTab:
            self.collectionType = @"gold";
            break;
        case SilverViewTab:
            self.collectionType = @"silver";
            break;
        case DiamondViewTab:
            self.collectionType = @"diamond";
            break;
        case PlatinumViewTab:
            self.collectionType = @"platinum";
            break;
            
        default:
            break;
    }
    [self callGoldCollectionApiWithType:@"price"];
    [self initializeSearchView];
}

- (void)callGoldCollectionApiWithType:(NSString *)type {
    CollectionsApi *collectionApi = [[CollectionsApi alloc] init];
    collectionApi.apiType = Get;
    collectionApi.cacheing = CACHE_MEMORY;
    collectionApi.collectionApiName = [NSMutableString stringWithFormat:@"%@", self.collectionType];
    [[DataUtility sharedInstance] dataForObject:collectionApi response:^(APIBase *response, DataType dataType) {
        if (collectionApi.errorCode == 0) {
            if (!self.imagesArray) {
                self.imagesArray = [[NSMutableArray alloc] init];
            }
            if (!self.dataSourceArray) {
                self.dataSourceArray = [[NSMutableArray alloc] init];
            }
            for (ListOfItems *listOfItems in collectionApi.listOfItems) {
                for (Products *products in listOfItems.products) {
                    for (Items *items in products.items) {
                        [self.imagesArray addObject:items.uri];
                        [self.dataSourceArray addObject:items];
                    }
                }
            }
            [self hideLoadingMode];
            [self searchResults:type];
        }
    }];
}

- (void)initializeSearchView {
    self.itemSearchBar.placeholder = NSLocalizedString(@"Search", @"Search");
    self.itemSearchBar.backgroundColor = CLEAR_COLOR;
    [self.itemSearchBar setBackgroundImage:[[UIImage alloc] init]];
    [self.segmentedFilterBar addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
}

- (void)segmentedControlChangedValue:(UISegmentedControl *)segmentControl {
    self.selectedSearchOption = segmentControl.selectedSegmentIndex;
    
    switch (_selectedSearchOption) {
        case SearchItemByPrice: {
            [self callGoldCollectionApiWithType:@"price"];
            break;
        }
        case SearchItemByPurity: {
            [self callGoldCollectionApiWithType:@"color_name"];
            break;
        }
        case SearchItemByName: {
            [self callGoldCollectionApiWithType:@"name"];
            break;
        }
        default:
            break;
    }
}

- (void)reloadCollectionView {
    [self.galleryCollectionView reloadData];
    [self.galleryCollectionView setContentOffset:CGPointZero];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSourceArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  GalleryItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GalleryItemCollectionViewCell" forIndexPath:indexPath];
    Items *item = (Items *)[self.dataSourceArray objectAtIndex:indexPath.row];
  [cell.galleryImageView sd_setImageWithURL:[NSURL URLWithString:item.uri] placeholderImage:[UIImage imageNamed:@"Placeholder.png"]];
  cell.imageTitle.text = @"Purity: 22 kr";
  cell.priceLabel.text = [NSString stringWithFormat:@"Price: र %@", @"28,000"];
  return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  //  selectedIndex = indexPath.row;
    [self navigateToProductDetailsViewController];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  CGFloat picDimension = self.view.frame.size.width;
  return CGSizeMake(picDimension / 3.5, picDimension / 2.5);
}


- (void)navigateToProductDetailsViewController {
    UIStoryboard *productDetailStoryBoard = [UIStoryboard storyboardWithName:kEKProductDetailsStoryboard bundle:nil];
    ProductDetailViewController *productDetailsViewController = (ProductDetailViewController*)[productDetailStoryBoard instantiateInitialViewController];
    [self.navigationController pushViewController:productDetailsViewController animated:YES];
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
    _searchFlags.doneClicked = YES;
    _itemSearchBar.text = @"";
    _searchFlags.searching = NO;
    [self reloadCollectionView];
}


- (void)abortSearchingMode {
    _searchFlags.searching = NO;
    _itemSearchBar.text = @"";
    [self.searchListArray removeAllObjects];
    [self reloadCollectionView];
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


- (void)searchResults:(NSString *)searchString {
    NSMutableArray *sortedArray = [[NSMutableArray alloc] init];
    NSMutableDictionary *sortingDict = [[NSMutableDictionary alloc] init];
    for (Items *items in self.dataSourceArray) {
        switch (_selectedSearchOption) {
            case SearchItemByPrice: {
                [sortingDict setObject:items forKey:items.price];
                break;
            }
            case SearchItemByPurity: {
                [sortingDict setObject:items forKey:items.color_name];
                break;
            }
            case SearchItemByName: {
                [sortingDict setObject:items forKey:items.name];
                break;
            }
            default:
                break;
        }
        [sortedArray addObject:items];
    }
    
    NSArray *keys = [sortingDict allKeys];
    NSArray *sKeys = [keys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    NSMutableArray *resultsArray = [[NSMutableArray alloc] init];
    
    for (id k in sKeys) {
        Items *val = [sortingDict objectForKey:k];
        [resultsArray addObject:val];
    }
    if ([resultsArray count]) {
        [self.dataSourceArray removeAllObjects];
        self.dataSourceArray = resultsArray;
    } else {
        [self.dataSourceArray removeAllObjects];
    }
    
    [self reloadCollectionView];
}


@end
