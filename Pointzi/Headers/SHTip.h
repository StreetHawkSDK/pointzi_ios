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

#import <UIKit/UIKit.h>
#import "SHTipDef.h"
#import "SHTipImageElement.h"

@class SHTipSeries;

/**
 Object representing a single tip.
 */
@interface SHTip : NSObject

/**
 "id" field of a tip. It's unique in a series.
 */
@property (nonatomic, strong) NSString *suid;

/**
 A unique identifier for the containing feed. This is got from parent feed object.
 */
@property (nonatomic) NSString * feed_id;

/**
 Type of current tip.
 */
@property (nonatomic) SHTipType tipType;

/**
 The view controller which this tip should display.
 */
@property (nonatomic, strong) NSString *view;

/**
 Target element's reference name or display name, for example: "btnLogin" or "Log in". It can also be an arbitratry position locating in screen, formatted as: point_x_y. x or y can be pixel number as 20 or percentage number as 20%.
 */
@property (nonatomic, strong) NSString *target;

/**
 Only used for child element such as a cell in table. It's the child element's index.
 */
@property (nonatomic, strong) NSIndexPath *childIndex;

/**
 Position of the tip relative to target UI element.
 */
@property (nonatomic) SHTipPlacement placement;

/**
 Delay seconds before this tip show.
 */
@property (nonatomic) double delaySeconds;

/**
 The tip's top padding.
 */
@property (nonatomic) CGFloat tipPaddingTop;

/**
 The tip's left padding.
 */
@property (nonatomic) CGFloat tipPaddingLeft;

/**
 The tip's bottom padding.
 */
@property (nonatomic) CGFloat tipPaddingBottom;

/**
 The tip's right padding.
 */
@property (nonatomic) CGFloat tipPaddingRight;

/*
 The tip's top margin.
*/
@property (nonatomic) CGFloat tipMarginTop;

/**
 The tip's left margin.
 */
@property (nonatomic) CGFloat tipMarginLeft;

/**
 The tip's bottom margin.
 */
@property (nonatomic) CGFloat tipMarginBottom;

/**
 The tip's right margin.
 */
@property (nonatomic) CGFloat tipMarginRight;

/**
 The tip's box shadow.
 */
@property (nonatomic) CGFloat tipBoxShadow;

/**
 Background of the tip.
 */
@property (nonatomic, strong) UIColor *backgroundColor;

/**
 The tip's border color.
 */
@property (nonatomic, strong) UIColor *borderColor;

/**
 The tip's border width.
 */
@property (nonatomic) CGFloat borderWidth;

/**
 The tip's border corner radius.
 */
@property (nonatomic) CGFloat borderCornerRadius;

/**
 The tip's width if `tipPercentage` not exist.
 */
@property (nonatomic) CGFloat tipWidth;

/**
 The tip's height if `tipPercentage` not exist.
 */
@property (nonatomic) CGFloat tipHeight;

/**
 The color of overlay of the tip.
 */
@property (nonatomic, strong) UIColor *overlayColor;

/**
 The transparency of the overlay.
 */
@property (nonatomic) CGFloat overlayAlpha;

/**
 The highlight style of coach mark.
 */
@property (nonatomic) SHCoachMarkStyle coachmarkStyle;

/**
 The highlight corner radius of coach mark.
 */
@property (nonatomic) CGFloat coachmarkCornerRadius;

/**
 The highlight width of coach mark.
 */
@property (nonatomic) CGFloat coachmarkWidth;

/**
 The highlight height of coach mark.
 */
@property (nonatomic) CGFloat coachmarkHeight;

/**
 The diffuse of coach mark.
 */
@property (nonatomic) SHCoachMarkDiffuse coachmarkDiffuse;

/**
 The array of images.
 */
@property (nonatomic, strong) NSArray<SHTipImageElement *> *arrayImages;

/**
 Title of the tip.
 */
@property (nonatomic, strong) NSString *title;

/**
 Title color of the tip.
 */
@property (nonatomic, strong) UIColor *titleColor;

/**
 Title background color of the tip.
 */
@property (nonatomic, strong) UIColor *titleBackgroundColor;

/**
 Title alignment of the tip.
 */
@property (nonatomic) NSTextAlignment titleAlignment;

/**
 The title's top padding.
 */
@property (nonatomic) CGFloat titlePaddingTop;

/**
 The title's left padding.
 */
@property (nonatomic) CGFloat titlePaddingLeft;

/**
 The title's bottom padding.
 */
@property (nonatomic) CGFloat titlePaddingBottom;

/**
 The title's right padding.
 */
@property (nonatomic) CGFloat titlePaddingRight;

/**
 The title's top margin.
 */
@property (nonatomic) CGFloat titleMarginTop;

/**
 The title's left margin.
 */
@property (nonatomic) CGFloat titleMarginLeft;

/**
 The title's bottom margin.
 */
@property (nonatomic) CGFloat titleMarginBottom;

/**
 The title's right margin.
 */
@property (nonatomic) CGFloat titleMarginRight;

/**
 The title's box shadow.
 */
@property (nonatomic) CGFloat titleBoxShadow;

/**
 The title's font name.
 */
@property (nonatomic, strong) NSString *titleFontName;

/**
 The title's font size.
 */
@property (nonatomic) CGFloat titleFontSize;

/**
 The title's font weight. Just keep original data from payload.
 */
@property (nonatomic, strong) NSString *titleFontWeight;

/**
 Content of the tip.
 */
@property (nonatomic, strong) NSString *content;

/**
 Content color of the tip.
 */
@property (nonatomic, strong) UIColor *contentColor;

/**
 Content background color of the tip.
 */
@property (nonatomic, strong) UIColor *contentBackgroundColor;

/**
 Content alignment of the tip.
 */
@property (nonatomic) NSTextAlignment contentAlignment;

/**
 The content's top padding.
 */
@property (nonatomic) CGFloat contentPaddingTop;

/**
 The content's left padding.
 */
@property (nonatomic) CGFloat contentPaddingLeft;

/**
 The content's bottom padding.
 */
@property (nonatomic) CGFloat contentPaddingBottom;

/**
 The content's right padding.
 */
@property (nonatomic) CGFloat contentPaddingRight;

/**
 The content's top margin.
 */
@property (nonatomic) CGFloat contentMarginTop;

/**
 The content's left margin.
 */
@property (nonatomic) CGFloat contentMarginLeft;

/**
 The content's bottom margin.
 */
@property (nonatomic) CGFloat contentMarginBottom;

/**
 The content's right margin.
 */
@property (nonatomic) CGFloat contentMarginRight;

/**
 The content's box shadow.
 */
@property (nonatomic) CGFloat contentBoxShadow;

/**
 The content's font name.
 */
@property (nonatomic, strong) NSString *contentFontName;

/**
 The content's font size.
 */
@property (nonatomic) CGFloat contentFontSize;

/**
 The content's font weight. Just keep original data from payload.
 */
@property (nonatomic, strong) NSString *contentFontWeight;

/**
 Web url of this tip.
 */
@property (nonatomic, strong) NSString *url;

/**
 Web html content of this tip. `urlcontent` is priority to `url` when presenting web page.
 */
@property (nonatomic, strong) NSString *urlcontent;

/**
 button Prev of the tip.
 */
@property (nonatomic, strong) NSString *buttonPrev;

/**
 button Prev color of the tip.
 */
@property (nonatomic, strong) UIColor *buttonPrevColor;

/**
 button Prev background color of the tip.
 */
@property (nonatomic, strong) UIColor *buttonPrevBackgroundColor;

/**
 button Prev border color.
 */
@property (nonatomic, strong) UIColor *buttonPrevBorderColor;

/**
 button Prev border width.
 */
@property (nonatomic) CGFloat buttonPrevBorderWidth;

/**
 button Prev border corner radius.
 */
@property (nonatomic) CGFloat buttonPrevBorderCornerRadius;

/**
 button Prev alignment of the tip.
 */
@property (nonatomic) NSTextAlignment buttonPrevAlignment;

/**
 The buttonPrev's top padding.
 */
@property (nonatomic) CGFloat buttonPrevPaddingTop;

/**
 The buttonPrev's left padding.
 */
@property (nonatomic) CGFloat buttonPrevPaddingLeft;

/**
 The buttonPrev's bottom padding.
 */
@property (nonatomic) CGFloat buttonPrevPaddingBottom;

/**
 The buttonPrev's right padding.
 */
@property (nonatomic) CGFloat buttonPrevPaddingRight;

/**
 The buttonPrev's top margin.
 */
@property (nonatomic) CGFloat buttonPrevMarginTop;

/**
 The buttonPrev's left margin.
 */
@property (nonatomic) CGFloat buttonPrevMarginLeft;

/**
 The buttonPrev's bottom margin.
 */
@property (nonatomic) CGFloat buttonPrevMarginBottom;

/**
 The buttonPrev's right margin.
 */
@property (nonatomic) CGFloat buttonPrevMarginRight;

/**
 The buttonPrev's box shadow.
 */
@property (nonatomic) CGFloat buttonPrevBoxShadow;

/**
 The buttonPrev's font name.
 */
@property (nonatomic, strong) NSString *buttonPrevFontName;

/**
 The buttonPrev's font size.
 */
@property (nonatomic) CGFloat buttonPrevFontSize;

/**
 The buttonPrev's font weight. Just keep original data from payload.
 */
@property (nonatomic, strong) NSString *buttonPrevFontWeight;

/**
 The buttonPrev's deeplinking url.
 */
@property (nonatomic, strong) NSString *buttonPrevUrl;

/**
 button Next of the tip.
 */
@property (nonatomic, strong) NSString *buttonNext;

/**
 button Next color of the tip.
 */
@property (nonatomic, strong) UIColor *buttonNextColor;

/**
 button Next background color of the tip.
 */
@property (nonatomic, strong) UIColor *buttonNextBackgroundColor;

/**
 button Next border color.
 */
@property (nonatomic, strong) UIColor *buttonNextBorderColor;

/**
 button Next border width.
 */
@property (nonatomic) CGFloat buttonNextBorderWidth;

/**
 button Next border corner radius.
 */
@property (nonatomic) CGFloat buttonNextBorderCornerRadius;

/**
 button Next alignment of the tip.
 */
@property (nonatomic) NSTextAlignment buttonNextAlignment;

/**
 The buttonNext's top padding.
 */
@property (nonatomic) CGFloat buttonNextPaddingTop;

/**
 The buttonNext's left padding.
 */
@property (nonatomic) CGFloat buttonNextPaddingLeft;

/**
 The buttonNext's bottom padding.
 */
@property (nonatomic) CGFloat buttonNextPaddingBottom;

/**
 The buttonNext's right padding.
 */
@property (nonatomic) CGFloat buttonNextPaddingRight;

/**
 The buttonNext's top margin.
 */
@property (nonatomic) CGFloat buttonNextMarginTop;

/**
 The buttonNext's left margin.
 */
@property (nonatomic) CGFloat buttonNextMarginLeft;

/**
 The buttonNext's bottom margin.
 */
@property (nonatomic) CGFloat buttonNextMarginBottom;

/**
 The buttonNext's right margin.
 */
@property (nonatomic) CGFloat buttonNextMarginRight;

/**
 The buttonNext's box shadow.
 */
@property (nonatomic) CGFloat buttonNextBoxShadow;

/**
 The buttonNext's font name.
 */
@property (nonatomic, strong) NSString *buttonNextFontName;

/**
 The buttonNext's font size.
 */
@property (nonatomic) CGFloat buttonNextFontSize;

/**
 The buttonNext's font weight. Just keep original data from payload.
 */
@property (nonatomic, strong) NSString *buttonNextFontWeight;

/**
 The buttonNext's deeplinking url.
 */
@property (nonatomic, strong) NSString *buttonNextUrl;

/**
 Pair of predefined buttons. //TODO: not implement now.
 */
@property (nonatomic, strong) NSString *pair;

/**
 Whether buttons layout horizontal.
 */
@property (nonatomic) BOOL isHorizontal;

/**
 Dismiss button image resource name. It's built inside App's resource bundle. If the file name in payload has no extension, use ***.png.
 */
@property (nonatomic, strong) NSString * buttonDismissIcon;

/**
 The dismiss button's width.
 */
@property (nonatomic) CGFloat buttonDismissWidth;

/**
 The dismiss button's height.
 */
@property (nonatomic) CGFloat buttonDismissHeight;

/**
 The dismiss button's top padding.
 */
@property (nonatomic) CGFloat buttonDismissPaddingTop;

/**
 The dismiss button's left padding.
 */
@property (nonatomic) CGFloat buttonDismissPaddingLeft;

/**
 The dismiss button's bottom padding.
 */
@property (nonatomic) CGFloat buttonDismissPaddingBottom;

/**
 The dismiss button's right padding.
 */
@property (nonatomic) CGFloat buttonDismissPaddingRight;

/**
 The dismiss button's top margin.
 */
@property (nonatomic) CGFloat buttonDismissMarginTop;

/**
 The dismiss button's left margin.
 */
@property (nonatomic) CGFloat buttonDismissMarginLeft;

/**
 The dismiss button's bottom margin.
 */
@property (nonatomic) CGFloat buttonDismissMarginBottom;

/**
 The dismiss button's right margin.
 */
@property (nonatomic) CGFloat buttonDismissMarginRight;

/**
 The dismiss button's color.
 */
@property (nonatomic, strong) UIColor *buttonDismissColor;

/**
 The dismiss button's backgroundcolor.
 */
@property (nonatomic, strong) UIColor *buttonDismissBackgroundColor;

/**
 The dismiss button's border color.
 */
@property (nonatomic, strong) UIColor *buttonDismissBorderColor;

/**
 The dismiss button's border width.
 */
@property (nonatomic) CGFloat buttonDismissBorderWidth;

/**
 The dismiss button's corner radius.
 */
@property (nonatomic) CGFloat buttonDismissBorderCornerRadius;

/**
 Button for positive on delete confirm dialog, which is on the left.
 */
@property (nonatomic, strong) NSString *dismissB1;

/**
 Button for negative on delete confirm dialog, which is on the right.
 */
@property (nonatomic, strong) NSString *dismissB2;

/**
 Title on delete confirm dialog.
 */
@property (nonatomic, strong) NSString *dismissTitle;

/**
 Message content on delete confirm dialog.
 */
@property (nonatomic, strong) NSString *dismissContent;

/**
 Whether dismiss the tip (equal next button is clicked) when touching inside of the tip.
 */
@property (nonatomic) BOOL dismissWhenTouchInside;

/**
 Whether dismiss the tip (equal next button is clicked) when touching outside of the tip.
 */
@property (nonatomic) BOOL dismissWhenTouchOutside;

/**
 Animation type when transition in
 */
@property (nonatomic) SHTipAnimationType transitionInType;

/**
 Animation duration when transition in
 */
@property (nonatomic) CGFloat transitionInDuration;

/**
 Animation direction when transition in
 */
@property (nonatomic) SHTipAnimationDirection transitionInDirection;

/**
 Animation type when transition out
 */
@property (nonatomic) SHTipAnimationType transitionOutType;

/**
 Animation duration when transition out
 */
@property (nonatomic) CGFloat transitionOutDuration;

/**
 Animation direction when transition out
 */
@property (nonatomic) SHTipAnimationDirection transitionOutDirection;

/**
 Weak reference to containing series. This is assigned when a tip is added into a series.
 */
@property (nonatomic, weak) SHTipSeries *series;

/**
 Weak reference to this tip's view controller. It's assigned when showing a view controller and match this tip's. In a series the tips' view controller can be different in case of multiple page.
 */
@property (nonatomic, weak) UIViewController *viewController;

/**
 Weak reference of the target control which this tip is aligned with. It's assigned when parsing tip for a view controller. It decides the position of tip.
 */
@property (nonatomic, weak) UIView *targetControl;

/**
 Fill properties from feed json. Feed json is read from web console, which is not well-formatted. Return NO if fail to parse.
 @param dictPayload The dictionary item inside "payload" json.
 @return Return YES if successfully parse; return NO if fail to parse.
 */
- (BOOL)loadFromFeedDict:(NSDictionary *)dictPayload;

/**
 Deserialize function. Create an object from dictionary.
 @return A created object.
 */
+ (SHTip *)loadFromDict:(NSDictionary *)dict;

/**
 Serialize function.
 @return Serialize self into a dictionary.
 */
- (NSDictionary *)serializeToDict;

@end

/**
 Representing a series of tips.
 */
@interface SHTipSeries : NSObject

/**
 Display type of current tip series.
 */
@property (nonatomic) SHTipDisplayType tipDisplayType;

/**
 Type of current tip series.
 */
@property (nonatomic) SHTipType tipType;

/**
 Trigger of current tip series.
 */
@property (nonatomic) SHTipTrigger triggerType;

/**
 Weak reference of the trigger control which trigger this series. It's for event handler. It's assigned when hooking event in a view controller. It can be same or not same as targetView. It can be normal UIView, or UIBarButtonItem or etc.
 */
@property (nonatomic, weak) id triggerControl;

/**
 The trigger is launcher, and its indicator's image.
 */
@property (nonatomic, strong) NSString *launcherImage;

/**
 The trigger is launcher, and its indicator's placement.
 */
@property (nonatomic) SHTipPlacement launcherPlacement;

/**
 TThe trigger is launcher, and its indicator's width.
 */
@property (nonatomic) CGFloat launcherWidth;

/**
 The trigger is launcher, and its indicator's height.
 */
@property (nonatomic) CGFloat launcherHeight;

/**
 The trigger is launcher, and its indicator's color.
 */
@property (nonatomic, strong) UIColor *launcherColor;

/**
 The trigger is launcher, and its indicator's background color.
 */
@property (nonatomic, strong) UIColor *launcherBackgroundColor;

/**
 The trigger is launcher, and its indicator's top padding.
 */
@property (nonatomic) CGFloat launcherPaddingTop;

/**
 The trigger is launcher, and its indicator's left padding.
 */
@property (nonatomic) CGFloat launcherPaddingLeft;

/**
 The trigger is launcher, and its indicator's bottom padding.
 */
@property (nonatomic) CGFloat launcherPaddingBottom;

/**
 The trigger is launcher, and its indicator's right padding.
 */
@property (nonatomic) CGFloat launcherPaddingRight;

/**
 The trigger is launcher, and its indicator's top margin.
 */
@property (nonatomic) CGFloat launcherMarginTop;

/**
 The trigger is launcher, and its indicator's left margin.
 */
@property (nonatomic) CGFloat launcherMarginLeft;

/**
 The trigger is launcher, and its indicator's bottom margin.
 */
@property (nonatomic) CGFloat launcherMarginBottom;

/**
 The trigger is launcher, and its indicator's right margin.
 */
@property (nonatomic) CGFloat launcherMarginRight;

/**
 View controller of starting target page.
 */
@property (nonatomic, strong) NSString *view;

/**
 Target element's reference name or display name, for example: "btnLogin" or "Log in".
 */
@property (nonatomic, strong) NSString *target;

/**
 Only used for child element such as a cell in table. It's the child element's index.
 */
@property (nonatomic, strong) NSIndexPath *childIndex;

/**
 Array of the series.
 */
@property (nonatomic, strong) NSArray<SHTip *> *arrayTips;

/**
 Deserialize function. Create an object from dictionary.
 @param dict The original dict.
 @return A created object.
 */
+ (SHTipSeries *)loadFromDict:(NSDictionary *)dict;

/**
 Serialize function.
 @return Serialize self into a dictionary.
 */
- (NSDictionary *)serializeToDict;

/**
 Override for checking tip series is same one. It returns true if properties are same, and tips array count matches.
 */
- (BOOL)isEqual:(id)object;

@end
