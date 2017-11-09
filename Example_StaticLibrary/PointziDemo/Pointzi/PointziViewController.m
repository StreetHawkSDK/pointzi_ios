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

#import "PointziViewController.h"
#import "BackdropViewController.h"
#import "TravelViewController.h"
#import "SmileViewController.h"
#import "LoginViewController.h"
#import "FrontMenuViewController.h"
#import "CustomViewController.h"
#import "VarietyViewController.h"
#import "TabViewController.h"
#import "CollectionViewController.h"

@interface PointziViewController ()

@property (nonatomic, strong) NSArray *arrayCases;
@property (nonatomic, strong) NSArray *arrayDescriptions;

@end

@implementation PointziViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Tip Cases";
    self.arrayCases = @[@"Force fill tips from feeds", @"Backdrop demo tips", @"Modal tip show on page load", @"Modal tip show on button click", @"Pop tip show on enter textbox", @"Mixed tour shown on front menu", @"Custom page for testing.", @"Variety page for testing", @"Tab page for testing", @"Collection view for testing", @"Onboarding"];
    self.arrayDescriptions = @[@"app_status/feed has bug which not set timestamp ontime", @"Beautiful backgrop demo tips", @"Campaign \"iOS Modal (travel)\"", @"Campaign \"iOS Modal (smile)\"", @"Campaign \"iOS Pop (password)\"", @"Campaign \"iOS Tour (front menu)\"", @"Create your own campaign to test.", @"Rick colorful page.", @"Create tab bar campaigin to test", @"Create collection view campaigin to test", @"Show onboarding page"];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayCases.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cellTooltipCases";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.detailTextLabel.numberOfLines = 0;
        cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    cell.textLabel.text = self.arrayCases[indexPath.row];
    cell.detailTextLabel.text = self.arrayDescriptions[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SH_FeedBridge_SetFeedTimestamp" object:nil userInfo:@{@"timestamp": NONULL(shFormatStreetHawkDate([NSDate date]))}];
    }
    if (indexPath.row == 1)
    {
        BackdropViewController *vc = [[BackdropViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 2)
    {
        TravelViewController *vc = [[TravelViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 3)
    {
        SmileViewController *vc = [[SmileViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 4)
    {
        LoginViewController *vc = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 5)
    {
        FrontMenuViewController *vc = [[FrontMenuViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 6)
    {
        CustomViewController *vc = [[CustomViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 7)
    {
        VarietyViewController *vc = [[VarietyViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 8)
    {
        TabViewController *vc = [[TabViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 9)
    {
        CollectionViewController *vc = [[CollectionViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
