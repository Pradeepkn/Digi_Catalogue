//
//  GalleryItemCollectionViewCell.m
//  Cheripo
//
//  Created by Pradeep on 02/04/15.
//  Copyright (c) 2015 Cheripo. All rights reserved.
//

#import "GalleryItemCollectionViewCell.h"

@implementation GalleryItemCollectionViewCell

- (void)awakeFromNib {
  // Initialization code
  self.galleryImageView.layer.shadowOffset = CGSizeMake(1, 1);
  self.galleryImageView.layer.shadowColor = [[UIColor blackColor] CGColor];
  self.galleryImageView.layer.masksToBounds = NO;
  self.galleryImageView.layer.shadowOpacity = 0.80f;
  self.galleryImageView.layer.shadowRadius = 2.0f;
}

@end
