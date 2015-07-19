//
//  MarketplaceViewController.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/17/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "MarketplaceViewController.h"

@interface MarketplaceViewController ()

@end

@implementation MarketplaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)onBuyButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"OnBuyButtonSegue" sender:sender];
}

- (IBAction)onSellButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"onSellButtonSegue" sender:sender];
}
@end
