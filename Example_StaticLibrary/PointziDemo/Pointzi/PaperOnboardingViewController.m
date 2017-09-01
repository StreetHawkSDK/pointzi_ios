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

#import "PaperOnboardingViewController.h"
#import <PaperOnboarding/PaperOnboarding-Swift.h>

@interface PaperOnboardingViewController () <PaperOnboardingDataSource, PaperOnboardingDelegate>

@property (nonatomic, strong) SHFeedObject *feedObj;
@property (nonatomic, strong) NSArray<NSDictionary *> *arrayData;

@end

@implementation PaperOnboardingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)receiveCustomFeed:(id)feed
{
    if ([feed isKindOfClass:[SHFeedObject class]])
    {
        SHFeedObject *feedObj = (SHFeedObject *)feed;
        if ([feedObj.content[@"custom-selector"] isEqualToString:@"paper-onboarding-pointzi-example"])
        {
            self.feedObj = feedObj;
            self.arrayData = self.feedObj.content[@"custom-data"];
            if ([self.arrayData isKindOfClass:[NSArray class]] &&
                self.arrayData.count > 0)
            {
                PaperOnboarding *onboardingView = [[PaperOnboarding alloc]
                                                   initWithItemsCount:self.arrayData.count];
                onboardingView.dataSource = self;
                onboardingView.delegate = self;
                onboardingView.translatesAutoresizingMaskIntoConstraints = NO;
                [self.view addSubview:onboardingView];
                
                NSLayoutConstraint *leading = [NSLayoutConstraint
                                               constraintWithItem:onboardingView
                                               attribute:NSLayoutAttributeLeading
                                               relatedBy:NSLayoutRelationEqual
                                               toItem:self.view
                                               attribute:NSLayoutAttributeLeading
                                               multiplier:1.0f
                                               constant:0.f];
                [self.view addConstraint:leading];
                
                NSLayoutConstraint *trailing =[NSLayoutConstraint
                                               constraintWithItem:onboardingView
                                               attribute:NSLayoutAttributeTrailing
                                               relatedBy:NSLayoutRelationEqual
                                               toItem:self.view
                                               attribute:NSLayoutAttributeTrailing
                                               multiplier:1.0f
                                               constant:0.f];
                [self.view addConstraint:trailing];
                
                NSLayoutConstraint *top =[NSLayoutConstraint
                                          constraintWithItem:onboardingView
                                          attribute:NSLayoutAttributeTop
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self.view
                                          attribute:NSLayoutAttributeTop
                                          multiplier:1.0f
                                          constant:0.f];
                [self.view addConstraint:top];
                
                NSLayoutConstraint *bottom =[NSLayoutConstraint
                                             constraintWithItem:onboardingView
                                             attribute:NSLayoutAttributeBottom
                                             relatedBy:NSLayoutRelationEqual
                                             toItem:self.view
                                             attribute:NSLayoutAttributeBottom
                                             multiplier:1.0f
                                             constant:0.f];
                [self.view addConstraint:bottom];
            }
        }
    }
}

- (NSInteger)onboardingItemsCount SWIFT_WARN_UNUSED_RESULT
{
    return self.arrayData.count;
}

- (OnboardingItemInfo * _Nonnull)onboardingItemAtIndex:(NSInteger)index SWIFT_WARN_UNUSED_RESULT
{
    OnboardingItemInfo *item = [OnboardingItemInfo new];
    NSDictionary *dict = self.arrayData[index];
    if ([dict isKindOfClass:[NSDictionary class]])
    {
        item.shImageName = [UIImage imageNamed:NONULL(dict[@"imageName"])];
        item.shTitle = NONULL(dict[@"title"]);
        item.shDesc = NONULL(dict[@"description"]);
        item.shIconName = [UIImage imageNamed:NONULL(dict[@"iconName"])];
        item.shColor = [UIColor colorFromHexString:dict[@"color"]];
        item.shTitleColor = [UIColor colorFromHexString:dict[@"titleColor"]];
        item.shDescriptionColor = [UIColor colorFromHexString:dict[@"descriptionColor"]];
        item.shTitleFont = [UIFont boldSystemFontOfSize:[NONULL(dict[@"titleFont"]) floatValue]];
        item.shDescriptionFont = [UIFont systemFontOfSize:[NONULL(dict[@"descriptionFont"]) floatValue]];
    }
    return item;
}

- (void)onboardingWillTransitonToIndex:(NSInteger)index
{
}

- (void)onboardingDidTransitonToIndex:(NSInteger)index
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [StreetHawk notifyFeedResult:self.feedObj.feed_id
                          withResult:SHResult_Accept
                          withStepId:nil
                          deleteFeed:YES
                           completed:YES];
    });
}

- (void)onboardingConfigurationItem:(OnboardingContentViewItem * _Nonnull)item index:(NSInteger)index
{
}

@end
