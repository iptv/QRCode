//
//  QRCodeAppDelegate.h
//  QRCode
//
//  Created by Kevin Zhang on 13-9-5.
//  Copyright (c) 2013年 zimbean. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QRCodeViewController;

@interface QRCodeAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) QRCodeViewController *viewController;

@end
