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

#import "SampleCaseViewController.h"
#import "FeedbackCasesViewController.h"
#import "LogTagCasesViewController.h"
#import "FeedCasesController.h"
#import "PointziViewController.h"
#import "PointziDemo-Swift.h"

@implementation SampleCaseViewController

#pragma mark - life cycle

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        //use array instead of dictionary as NSDictionary.allKeys cannot keep order.
        self.arraySampleCasesTitle = [NSMutableArray arrayWithArray:@[@"Pointzi", @"Feedback Sample", @"Tag & Log Sample", @"Feeds Sample", @"Install Sample", @"Swift Sample"]];
        self.arraySampleCasesVC = [NSMutableArray arrayWithArray:@[@"PointziViewController", @"FeedbackCasesViewController", @"LogTagCasesViewController", @"FeedCasesController", @"InstallViewController", @"SwiftViewController"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Sample Cases";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appStatusChangedNotificationHandler:) name:@"SHAppStatusChangeNotification" object:nil];
}

- (void)appStatusChangedNotificationHandler:(NSNotification *)notification
{
    dispatch_async(dispatch_get_main_queue(), ^
    {
        [self.tableView reloadData]; //host url is changed, update UI
    });
}

#pragma mark - UITableViewController delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arraySampleCasesTitle.count + 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.row == 0)
    {
        static NSString *cellIdentifier = @"SampleCaseHostCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }
        //SHAppStatus is private class, to get alive host and without affecting code structure.
        NSString *aliveHostUrl = nil;
        Class appstatusClass = NSClassFromString(@"SHAppStatus");
        if (appstatusClass)
        {
            SEL sharedInstanceSelector = NSSelectorFromString(@"sharedInstance");
            id sharedInstance = ((id (*)(id, SEL))[appstatusClass methodForSelector:sharedInstanceSelector])(appstatusClass, sharedInstanceSelector);
            SEL aliveHostSelector = NSSelectorFromString(@"aliveHostInner");
            aliveHostUrl = ((id (*)(id, SEL))[sharedInstance methodForSelector:aliveHostSelector])(sharedInstance, aliveHostSelector);
        }
        cell.textLabel.text = StreetHawk.appKey;
        cell.detailTextLabel.text = aliveHostUrl;
        cell.textLabel.textColor = [UIColor redColor];
        cell.detailTextLabel.textColor = [UIColor redColor];
    }
    else if (indexPath.row == 1)
    {
        static NSString *cellIdentifier = @"SampleCaseInstallTokenCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            UITextField *textToken = [[UITextField alloc] initWithFrame:CGRectMake(10, 5, cell.bounds.size.width - 20, cell.bounds.size.height - 10)];
            textToken.placeholder = @"Install Token";
            textToken.returnKeyType = UIReturnKeyDone;
            textToken.autocorrectionType = UITextAutocorrectionTypeNo;
            textToken.autocapitalizationType = UITextAutocapitalizationTypeNone;
            textToken.delegate = self;
            [cell.contentView addSubview:textToken];
        }
        UITextField *textToken = cell.contentView.subviews[0];
        textToken.text = [[NSUserDefaults standardUserDefaults] objectForKey:SH_INSTALL_TOKEN];
    }
    else if (indexPath.row - 2 < self.arraySampleCasesTitle.count)
    {
        static NSString *cellIdentifier = @"SampleCaseModuleCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.textLabel.text = self.arraySampleCasesTitle[indexPath.row - 2];
        cell.textLabel.textColor = [UIColor darkTextColor];
    }
    else
    {
        static NSString *cellIdentifier = @"VersionCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        NSString *clientVersion = [NSString stringWithFormat:@"%@ (%@)",
                                   [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"],
                                   [[NSBundle mainBundle] infoDictionary][@"CFBundleVersion"]];
        cell.textLabel.text = clientVersion;
        cell.textLabel.textColor = [UIColor lightGrayColor];
        cell.textLabel.font = [UIFont systemFontOfSize:10];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0
        || indexPath.row == 1
        || indexPath.row == self.arraySampleCasesTitle.count + 2)
    {
        return; //host server
    }
    NSString *className = self.arraySampleCasesVC[indexPath.row - 2];
    Class vcClass = NSClassFromString(className);
    if (vcClass == nil)
    {
        //swift class name is formatted like "_TtC11SHSampleDev19SwiftViewController", check in SHSampleDev-Swift.h.
        NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
        className = [NSString stringWithFormat:@"_TtC%lu%@%lu%@", (unsigned long)appName.length, appName, (unsigned long)className.length, className];
        vcClass = NSClassFromString(className);
    }
    NSAssert(vcClass != nil, @"Fail to create view controller class.");
    UIViewController *vc = [[vcClass alloc] init];
    vc.title = self.arraySampleCasesTitle[indexPath.row - 2];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString *inputToken = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [[NSUserDefaults standardUserDefaults] setObject:NONULL(inputToken) forKey:SH_INSTALL_TOKEN]; //this is not normally use. it must restart App to take effect as SHHttpSessionManager set "X-Install-Token" when sigleton init.
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
