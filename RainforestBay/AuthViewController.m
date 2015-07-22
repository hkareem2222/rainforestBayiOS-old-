//
//  AuthViewController.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/19/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "AuthViewController.h"

@interface AuthViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passwordField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;
@end

@implementation AuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onAuthButtonPressed:(UIButton *)button {
    if ([self.barButton.title isEqualToString:@"Log In"]) {
        [button setTitle:@"Sign up!" forState:UIControlStateNormal];
    } else {
        [button setTitle:@"Log In!" forState:UIControlStateNormal];
    }
}
- (IBAction)onBarButtonPressed:(UIBarButtonItem *)button {
    if ([button.title isEqualToString:@"Log In"]) {
        [button setTitle:@"Sign Up"];
    } else {
        [button setTitle:@"Log In"];
    }
}
@end
