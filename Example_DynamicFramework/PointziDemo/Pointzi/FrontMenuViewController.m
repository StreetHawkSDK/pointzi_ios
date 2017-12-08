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

#import "FrontMenuViewController.h"

@interface FrontMenuViewController ()

@property (nonatomic, strong) NSArray *arrayItems;

@end

@implementation FrontMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Long Table Test Case";
    NSMutableArray *arraySections = [NSMutableArray array];
    for (int sectionIndex = 1; sectionIndex <= 5; sectionIndex ++)
    {
        NSString *section = [NSString stringWithFormat:@"Section: %d", sectionIndex];
        NSMutableArray *arrayRows = [NSMutableArray array];
        for (int rowIndex = 1; rowIndex <= 10; rowIndex ++)
        {
            [arrayRows addObject:[NSString stringWithFormat:@"%d - %d", sectionIndex, rowIndex]];
        }
        [arraySections addObject:@{@"section": section,
                                   @"rows": arrayRows}];
    }
    self.arrayItems = arraySections;
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arrayItems.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.arrayItems[section][@"section"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arrayRows = self.arrayItems[section][@"rows"];
    return arrayRows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cellFrontMenuCases";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSArray *arrayRows = self.arrayItems[indexPath.section][@"rows"];
    cell.textLabel.text = arrayRows[indexPath.row];
    return cell;
}

@end


