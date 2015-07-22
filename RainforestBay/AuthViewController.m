//
//  AuthViewController.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/19/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "AuthViewController.h"
#import <Parse/Parse.h>

@interface AuthViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *authButton;
@end

@implementation AuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Buttons

- (IBAction)onAuthButtonPressed:(UIButton *)button {
    if ([button.titleLabel.text isEqualToString:@"Sign Up!"]) {
        [self signUpUser];
    } else {
        [self loginUser];
    }

}
- (IBAction)onBarButtonPressed:(UIBarButtonItem *)button {
    if ([button.title isEqualToString:@"Log In"]) {
        [button setTitle:@"Sign Up"];
        [self.authButton setTitle:@"Log In!" forState:UIControlStateNormal];
    } else {
        [button setTitle:@"Log In"];
        [self.authButton setTitle:@"Sign Up!" forState:UIControlStateNormal];
    }
}

#pragma mark - PFUser

- (void)signUpUser {
    PFUser *user = [PFUser user];
    user.username = self.usernameField.text;
    user.password = self.passwordField.text;
//    user.email = @"email@example.com";

    // other fields can be set just like with PFObject
//    user[@"phone"] = @"415-392-0202";

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
        } else {
            NSString *errorString = [error userInfo][@"error"];
            [self showAlerts:errorString];
        }
    }];
}

- (void)loginUser {
    [PFUser logInWithUsernameInBackground:self.usernameField.text password:self.passwordField.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                        } else {
                                            [self showAlerts:[error localizedDescription]];
                                        }
                                    }];
}

#pragma mark - Alerts

-(void)showAlerts:(NSString *)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error, please try again!" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        //insert action items here
    }];
    [alert addAction:dismissAction];
    [self presentViewController:alert animated:YES completion:nil];
};
@end
