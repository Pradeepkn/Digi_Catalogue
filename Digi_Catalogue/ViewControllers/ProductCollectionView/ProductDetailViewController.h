//
//  ProductDetailViewController.h
//  Digi_Catalogue
//
//  Created by Pradeep on 6/2/15.
//  Copyright (c) 2015 Brinvents. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *itemsArray;
@property (nonatomic, assign) NSInteger selectedIndex;

@end
