//
//  GalleryItemCollectionViewCell.h
//  Cheripo
//
//  Created by Pradeep on 02/04/15.
//  Copyright (c) 2015 Cheripo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryItemCollectionViewCell : UICollectionViewCell
@property(weak, nonatomic) IBOutlet UIImageView *galleryImageView;
@property(weak, nonatomic) IBOutlet UILabel *imageTitle;
@property(weak, nonatomic) IBOutlet UILabel *imagePoweredByLabel;
@property(weak, nonatomic) IBOutlet UILabel *priceLabel;
@property(weak, nonatomic) IBOutlet UIButton *shareButton;
@property(weak, nonatomic) IBOutlet UIButton *wishListButton;

@end
