//
//  SignUpApi.h
//  BrintDemo
//
//  Created by Pradeep on 09/10/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "APIBase.h"
#import "SignUpApiKeys.h"
#import "SignUpDetails.h"

@interface SignUpApi : APIBase

@property (nonatomic, strong) SignUpDetails *signUpDetails;
@end
