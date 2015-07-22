//
//  ProfileViewController.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/19/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>
#import "Listing.h"

@interface ProfileViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *listings;
@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated {
    PFQuery *listingQuery = [Listing query];
    [listingQuery whereKey:@"createdBy" equalTo:[PFUser currentUser]];
    [listingQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            self.listings = objects;
            [self.tableView reloadData];
        }
    }];
}

- (IBAction)onLogoutButtonPressed:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"ProfileToAuth" sender:self];
}

#pragma mark - TableView

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListingID"];
    Listing *listing = self.listings[indexPath.row];
    cell.textLabel.text = listing.headline;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listings.count;
}
@end
