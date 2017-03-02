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

#import "SHApp.h" //for extension SHApp
#import "SHTip.h"

/**
 Extension for Pointzi API.
 */
@interface SHApp (PointziExt)

/**
 Create a tip with most properties are setup to default. Customer can also modify the properties to meet their requirement. 
 @param type The enum of supported type. 
 @param title The display title, optional. 
 @param content The display content message, optional. 
 @param url The display html page, optional. 
 @param button1 The button display on left, optional.
 @param button2 The button display on right, optional.
 @param view The page view where the tip will show, mandatory.
 @param targetControl The target control in case the tip is aligned with, optional. 
 @param child In case the `targetControl` is a table, use `child` to indicate which row. It has two format: 1. section_int: row_int; 2. display string. It's optional.
 @return A default tip.
 */
+ (SHTip *)createTipForType:(SHTipType)type withTitle:(NSString *)title withContent:(NSString *)content withUrl:(NSString *)url withButton1:(NSString *)button1 withButton2:(NSString *)button2 forView:(NSString *)view forTargetControl:(NSString *)targetControl withChild:(NSString *)child;

/**
 Show tips. It would be a single one or a series tour. It's added into tip series together with those fetched from server, and display automatically when meet requirement.
 @param tips The tips to display. It displays one by one.
 @param triggerType The way to trigger the tips. 
 */
+ (void)showTips:(NSArray<SHTip *> *)tips forTrigger:(SHTipTrigger)triggerType;

@end
