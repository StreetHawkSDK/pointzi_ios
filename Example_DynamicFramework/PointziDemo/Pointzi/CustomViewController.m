/*
 * Copyright (c) StreetHawk, All rights reserved.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3.0 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library.
 */

#import "CustomViewController.h"
#import "MBProgressHUD.h"

@interface CustomViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *txtInput;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentA;
@property (strong, nonatomic) IBOutlet UISwitch *switcher;
@property (strong, nonatomic) IBOutlet UIStepper *stepper;
@property (strong, nonatomic) IBOutlet UIView *viewSuper;
@property (strong, nonatomic) IBOutlet UIView *viewRed;
@property (strong, nonatomic) IBOutlet UIView *viewGreen;
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UIButton *buttonMore;

- (IBAction)buttonClicked:(id)sender;

@end

@implementation CustomViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *buttonShare = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(buttonAddClicked:)];
//    self.navigationItem.rightBarButtonItem = buttonAdd;
//    self.navBar = self.navigationController.navigationBar;
    self.navBar.topItem.rightBarButtonItem = buttonShare;
}

- (void)buttonAddClicked:(id)sender
{
    MBProgressHUD *infoView = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    infoView.mode = MBProgressHUDModeText;
    infoView.labelText = @"App code: click add bar button.";
    [infoView hide:YES afterDelay:1];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)buttonClicked:(id)sender
{
    UIButton *button = (UIButton *)sender;
    NSLog(@"&&&&&& %@", button.superview.subviews);
    NSInteger index = [button.superview.subviews indexOfObject:button];
    NSLog(@"&&&&&& %ld", (long)index);
}
@end
