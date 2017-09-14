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

#import "BackdropViewController.h"
#import "BackdropDetailViewController.h"

@interface BackdropViewController ()

@property (nonatomic, strong) NSArray *arrayBackdrops;
@property (nonatomic, strong) NSArray *arrayVCs;

@end

@implementation BackdropViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Backdrop Cases";
    self.arrayBackdrops = @[@"iphone-screens-calendar.png", @"iphone-screens-chat.png", @"iphone-screens-login.png", @"iphone-screens-MyFeed.png", @"iphone-screens-MyFeeds.png", @"iphone-screens-v2-chat.png", @"iphone-screens-v2-login.png", @"iphone-screens-v2-google-calendar.png", @"iphone-screens-v2-MyFeed.png", @"iphone-screens-v2-MyFeeds.png"];
    self.arrayVCs = @[@"BackdropViewController_iphone_screens_calendar", @"BackdropViewController_iphone_screens_chat", @"BackdropViewController_iphone_screens_login", @"BackdropViewController_iphone_screens_MyFeed", @"BackdropViewController_iphone_screens_MyFeeds", @"BackdropViewController_iphone_screens_v2_chat", @"BackdropViewController_iphone_screens_v2_login", @"BackdropViewController_iphone_screens_v2_google_calendar", @"BackdropViewController_iphone_screens_v2_MyFeed", @"BackdropViewController_iphone_screens_v2_MyFeeds"];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayBackdrops.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cellBackdropCases";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.arrayBackdrops[indexPath.row];
    cell.detailTextLabel.text = self.arrayVCs[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *className = self.arrayVCs[indexPath.row];
    Class vcClass = NSClassFromString(className);
    if (vcClass == nil)
    {
        //swift class name is formatted like "_TtC11SHSampleDev19SwiftViewController", check in SHSampleDev-Swift.h.
        NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
        className = [NSString stringWithFormat:@"_TtC%lu%@%lu%@", (unsigned long)appName.length, appName, (unsigned long)className.length, className];
        vcClass = NSClassFromString(className);
    }
    NSAssert(vcClass != nil, @"Fail to create view controller class.");
    UIViewController *vc = [((UIViewController *)[vcClass alloc]) initWithNibName:@"BackdropDetailViewController" bundle:nil];
    NSString *imageFile = self.arrayBackdrops[indexPath.row];
    ((BackdropDetailViewController *)vc).imageBackground = [UIImage imageNamed:imageFile];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
