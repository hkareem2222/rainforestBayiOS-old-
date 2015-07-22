//
//  MarketplaceViewController.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/17/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "MarketplaceViewController.h"
#import <Parse/Parse.h>
#import "Listing.h"

@interface MarketplaceViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation MarketplaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated {
    PFQuery *listingQuery = [Listing query];
    //listingQuery whereKey isFeatured is YES
    [listingQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            //show featured listings
        }
    }];
}

#pragma mark - TableView

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListingID"];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

#pragma mark - Buy/Sell Buttons

//- (IBAction)onBuyButtonPressed:(id)sender {
//    [self performSegueWithIdentifier:@"OnBuyButtonSegue" sender:sender];
//}
//
//- (IBAction)onSellButtonPressed:(id)sender {
//    [self performSegueWithIdentifier:@"onSellButtonSegue" sender:sender];
//}
@end
