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

#import "StreetHawkCore_Pointzi.h"

#import "AppDelegate.h"
#import "SampleCaseViewController.h"
#import "AppKeyChoiceViewController.h"
#import "MBProgressHUD.h"

#define SH_APPKEY   @"SH_APPKEY"

@interface AppDelegate ()

- (void)installRegisterSuccessHandler:(NSNotification *)notification;
- (void)pointziUpdateTipsHandler:(NSNotification *)notification;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    SampleCaseViewController *sampleCaseVC = [[SampleCaseViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:sampleCaseVC];
    navigationVC.navigationBar.translucent = NO;
    
    self.window.rootViewController = navigationVC;
    [self.window makeKeyAndVisible];
    
    NSString *appKey = [[NSUserDefaults standardUserDefaults] objectForKey:SH_APPKEY];
    if (appKey.length == 0)
    {
        AppKeyChoiceViewController *appKeyListVC = [[AppKeyChoiceViewController alloc] initWithStyle:UITableViewStyleGrouped];
        UINavigationController *navigationAppKeyListVC = [[UINavigationController alloc] initWithRootViewController:appKeyListVC];
        appKeyListVC.selectedCallback = ^(NSString *selectedAppKey)
        {
            [[NSUserDefaults standardUserDefaults] setObject:selectedAppKey forKey:SH_APPKEY];
            [[NSUserDefaults standardUserDefaults] synchronize];
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"AppKey is setup. Restart App to take effect."
                                                                                     message:@"Click \"OK\" to close App."
                                                                              preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * _Nonnull action) {
                                                               exit(0); //kill App
                                                           }];
            [alertController addAction:action];
            [navigationAppKeyListVC presentViewController:alertController animated:YES completion:nil];
        };
        [self.window.rootViewController presentViewController:navigationAppKeyListVC animated:YES completion:nil];
        return YES; //need to kill and restart
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(installRegisterSuccessHandler:) name:SHInstallRegistrationSuccessNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pointziUpdateTipsHandler:) name:@"Pointzi_Tip_Updated" object:nil];
    [StreetHawk registerInstallForApp:appKey withDebugMode:YES];
    
    //Sample code to handle open url.
    StreetHawk.openUrlHandler = ^(NSURL *openUrl)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Open url handler" message:openUrl.absoluteString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    };
    
    //Sample code to handle fetch feeds.
    StreetHawk.newFeedHandler = ^
    {
        NSLog(@"Find new feeds.");
    };
    
    //Sample code to add spotlight search item
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)
    {
        [StreetHawk indexSpotlightSearchForIdentifier:@"1" forDeeplinking:@"hawk://testsearch?id=12" withSearchTitle:@"An interesting restaurant for kids." withSearchDescription:@"It has many toys for kids, \nand the table is colorful." withThumbnail:[UIImage imageNamed:@"icon.png"] withKeywords:@[@"child", @"play"]];
    }
    
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    return [Pointzi openURL:url];
}

- (void)installRegisterSuccessHandler:(NSNotification *)notification
{
    dispatch_async(dispatch_get_main_queue(), ^
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Choose one to tag sh_cuid."
                                                                                 message:nil
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        //promote choice list to tag sh_cuid.
        NSArray *tagChoice = @[@"david",
                               @"nick",
                               @"christine",
                               @"yichang",
                               @"steven",
                               @"linda",
                               @"QA"];
        for (NSString *choice in tagChoice)
        {
            UIAlertAction *actionTag = [UIAlertAction actionWithTitle:choice
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * _Nonnull action) {
                                                                  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                                                                  [dateFormatter setDateFormat:@"MM-dd HH:mm"];
                                                                  NSString *dateStr = [dateFormatter stringFromDate:[NSDate date]];
                                                                  NSString *person = [NSString stringWithFormat:@"%@ %@", choice, dateStr];
                                                                  [StreetHawk tagCuid:person];
                                                                  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Tag %@ to sh_cuid", person] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                                  [alertView show];
                                                              }];
            [alertController addAction:actionTag];
        }
        UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"Not tag any person"
                                                               style:UIAlertActionStyleCancel
                                                             handler:nil];
        [alertController addAction:actionCancel];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    });
}

- (void)pointziUpdateTipsHandler:(NSNotification *)notification
{
    dispatch_async(dispatch_get_main_queue(), ^
    {
//        BOOL isChanging = [notification.userInfo[@"change"] boolValue];
        //if (!isChanging) //Fix make "change"=YES, here use source to check.
        if ([notification.userInfo[@"source"] isEqualToString:@"fetch"])
        {
            NSArray *tips = notification.userInfo[@"tips"];
            MBProgressHUD *progressView = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
            progressView.mode = MBProgressHUDModeText;
            progressView.labelText = @"Message from App";
            progressView.detailsLabelText = [NSString stringWithFormat:@"%ld tips are read from feed.", (long)tips.count];
            [progressView hide:YES afterDelay:3];
        }
    });
}

@end
