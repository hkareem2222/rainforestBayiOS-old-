//
//  Listing.h
//  RainforestBay
//
//  Created by Husein Kareem on 7/17/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Listing : PFObject<PFSubclassing>
+ (NSString *)parseClassName;
@property NSString *headline;
@property NSString *descriptionText;
@property NSString *condition;
@property NSNumber *price;
@end
