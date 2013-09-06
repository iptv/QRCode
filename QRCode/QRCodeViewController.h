//
//  QRCodeViewController.h
//  QRCode
//
//  Created by Kevin Zhang on 13-9-5.
//  Copyright (c) 2013年 zimbean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QRCodeReader.h>
#import "QREncoder.h"
#import "ZXingWidgetController.h"
@interface QRCodeViewController : UIViewController<ZXingDelegate>{
    
}

@property (nonatomic, retain)IBOutlet UIButton *scanButton;

- (IBAction)scanButtonRsp:(id)sender;
- (IBAction)createQRCode:(id)sender;

@end
