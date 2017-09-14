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

#import "BackdropDetailViewController.h"

@interface BackdropDetailViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageBackdrop;

@end

@implementation BackdropDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imageBackdrop.image = self.imageBackground;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

@end

@interface BackdropViewController_iphone_screens_calendar ()

@property (nonatomic, strong) UILabel *labelTarget;

@end

@implementation BackdropViewController_iphone_screens_calendar

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.labelTarget = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-50, 80, 3, 3)];
    self.labelTarget.text = @"";
    self.labelTarget.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.labelTarget];
}

@end

@implementation BackdropViewController_iphone_screens_chat

@end

@implementation BackdropViewController_iphone_screens_login

@end

@implementation BackdropViewController_iphone_screens_MyFeed

@end

@interface BackdropViewController_iphone_screens_MyFeeds ()

@property (nonatomic, strong) UILabel *labelLinkedInTip;

@end

@implementation BackdropViewController_iphone_screens_MyFeeds

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.labelLinkedInTip = [[UILabel alloc] initWithFrame:CGRectMake(190, 300, 3, 3)];
    self.labelLinkedInTip.text = @"";
    self.labelLinkedInTip.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.labelLinkedInTip];
}

@end

@interface BackdropViewController_iphone_screens_v2_chat ()

@property (nonatomic, strong) UILabel *labelNetFlixTip;
@property (nonatomic, strong) UILabel *labelTour3;

@end

@implementation BackdropViewController_iphone_screens_v2_chat

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.labelNetFlixTip = [[UILabel alloc] initWithFrame:CGRectMake(60, 230, 3, 3)];
    self.labelNetFlixTip.text = @"";
    self.labelNetFlixTip.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.labelNetFlixTip];
    self.labelTour3 = [[UILabel alloc] initWithFrame:CGRectMake(180, 350, 3, 3)];
    self.labelTour3.text = @"";
    self.labelTour3.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.labelTour3];
}

@end

@implementation BackdropViewController_iphone_screens_v2_login

@end

@interface BackdropViewController_iphone_screens_v2_google_calendar ()

@property (nonatomic, strong) UILabel *labelTour1;
@property (nonatomic, strong) UILabel *labelTour2;
@property (nonatomic, strong) UILabel *labelTour3;

@end

@implementation BackdropViewController_iphone_screens_v2_google_calendar

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.labelTour1 = [[UILabel alloc] initWithFrame:CGRectMake(300, 180, 3, 3)];
    self.labelTour1.text = @"";
    self.labelTour1.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.labelTour1];
    self.labelTour2 = [[UILabel alloc] initWithFrame:CGRectMake(80, 180, 3, 3)];
    self.labelTour2.text = @"";
    self.labelTour2.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.labelTour2];
    self.labelTour3 = [[UILabel alloc] initWithFrame:CGRectMake(260, 550, 3, 3)];
    self.labelTour3.text = @"";
    self.labelTour3.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.labelTour3];
}

@end

@interface BackdropViewController_iphone_screens_v2_MyFeed ()

@property (nonatomic, strong) UILabel *labelTour1;

@end

@implementation BackdropViewController_iphone_screens_v2_MyFeed

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.labelTour1 = [[UILabel alloc] initWithFrame:CGRectMake(180, 500, 3, 3)];
    self.labelTour1.text = @"";
    self.labelTour1.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.labelTour1];
}

@end

@interface BackdropViewController_iphone_screens_v2_MyFeeds ()

@property (nonatomic, strong) UILabel *labelRealTip;
@property (nonatomic, strong) UILabel *labelLinkedInTip;

@end

@implementation BackdropViewController_iphone_screens_v2_MyFeeds

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.labelRealTip = [[UILabel alloc] initWithFrame:CGRectMake(190, 272, 3, 3)];
    self.labelRealTip.text = @"";
    self.labelRealTip.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.labelRealTip];
    self.labelLinkedInTip = [[UILabel alloc] initWithFrame:CGRectMake(50, 350, 3, 3)];
    self.labelLinkedInTip.text = @"";
    self.labelLinkedInTip.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.labelLinkedInTip];
}

@end
