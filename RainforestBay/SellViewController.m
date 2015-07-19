//
//  SellViewController.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/17/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "SellViewController.h"
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

- (IBAction)onSubmitButtonPressed:(id)sender {
    Listing *listing = [Listing new];
    listing.headline = self.headlineField.text;
    listing.condition = self.conditionField.text;
    listing.descriptionText = self.descriptionField.text;
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    listing.price = [f numberFromString:self.priceField.text];
    [listing saveInBackground];
}
@end
