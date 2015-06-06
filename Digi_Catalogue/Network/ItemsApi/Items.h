//
//  Items.h
//  BrintDemo
//
//  Created by Pradeep on 29/11/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "Jastor.h"

@interface Items : Jastor

@property (nonatomic, strong) NSString *clarity_name;
@property (nonatomic, strong) NSString *color_name;
@property (nonatomic, strong) NSString *design_type_name;
@property (nonatomic, strong) NSString *gender_name;
@property (nonatomic, strong) NSString *jewellery_type_name;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *ring_size_name;
@property (nonatomic, strong) NSString *uri;
@property (nonatomic, strong) NSString *wearing_style_name;

@end

/*

 "clarity_name" = "<null>";
 "color_name" = Yellow;
 "design_type_name" = Drop;
 "gender_name" = Female;
 "jewellery_type_name" = Gold;
 name = "Ear Ring";
 price = "32,000.00";
 "ring_size_name" = "<null>";
 uri = "http://brinvents.com/jew/sites/default/files/antique-annapakshi-gold-beads-jimmiki-32.jpg";
 "wearing_style_name" = "Casual Wear";

*/