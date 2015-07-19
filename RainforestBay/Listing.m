//
//  Listing.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/17/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "Listing.h"
#import <Parse/PFObject+Subclass.h>

@implementation Listing
+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"Listing";
}

@dynamic headline;
@dynamic descriptionText;
@dynamic condition;
@dynamic price;
@end
