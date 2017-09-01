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

#import "VarietyViewController.h"
#import "MBProgressHUD.h"

@interface VarietyViewController ()

@property (weak, nonatomic) IBOutlet UIButton *buttonClickMe;
@property (weak, nonatomic) IBOutlet UITextField *textboxInput;

@property (nonatomic, strong) UIBarButtonItem *buttonDone;

@end

@implementation VarietyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.textboxInput.font = [UIFont fontWithName:@"HugsandKissesxoxoDemo" size:26];
    self.buttonClickMe.titleLabel.font = [UIFont fontWithName:@"HugsandKissesxoxoDemo" size:26];
    
    self.buttonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(buttonDoneClicked:)];
    UIBarButtonItem *buttonSave = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(buttonDoneClicked:)];
    self.navigationItem.rightBarButtonItems = @[self.buttonDone, buttonSave];
}

- (void)buttonDoneClicked:(id)sender
{
    MBProgressHUD *infoView = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    infoView.mode = MBProgressHUDModeText;
    infoView.labelText = [NSString stringWithFormat:@"App code: click bar button %@.", sender];
    [infoView hide:YES afterDelay:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
