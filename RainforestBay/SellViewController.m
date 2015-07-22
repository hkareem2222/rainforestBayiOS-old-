//
//  SellViewController.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/17/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "SellViewController.h"
#import "ProfileViewController.h"
#import "Listing.h"

@interface SellViewController ()
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
@property (weak, nonatomic) IBOutlet UITextField *conditionField;
@property (weak, nonatomic) IBOutlet UITextField *priceField;
@property (weak, nonatomic) IBOutlet UITextField *headlineField;
@end

@implementation SellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated {

}

#pragma mark - Submit Button

- (IBAction)onSubmitButtonPressed:(id)sender {
    //Listing Creation
    Listing *listing = [Listing new];
    listing.headline = self.headlineField.text;
    listing.condition = self.conditionField.text;
    listing.descriptionText = self.descriptionField.text;
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    listing.price = [f numberFromString:self.priceField.text];
    [listing setObject:[PFUser currentUser] forKey:@"createdBy"];
    [listing saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
            [self showAlerts:@"Item submitted for review" isSuccess:YES];
        } else {
            // There was a problem, check error.description
            [self showAlerts:[error localizedDescription] isSuccess:NO];
        }
    }];
}

#pragma mark - Alerts

-(void)showAlerts:(NSString *)message isSuccess:(BOOL)success {
    //Complete Alert
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Complete!" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        //Unwind Segue
        if (success) {
            [self performSegueWithIdentifier:@"SellToProfile" sender:self];
        }
    }];
    [alert addAction:dismissAction];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"segue");
    UITabBarController *tabBar = segue.destinationViewController;
    [tabBar setSelectedIndex:1];
}
@end
