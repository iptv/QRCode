//
//  QRCodeViewController.m
//  QRCode
//
//  Created by Kevin Zhang on 13-9-5.
//  Copyright (c) 2013年 zimbean. All rights reserved.
//

#import "QRCodeViewController.h"
//#import "ZXingWidgetController.h"
//#import "QRCodeReader.h"
@interface QRCodeViewController ()

@end

@implementation QRCodeViewController

@synthesize scanButton;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)createQRCode:(id)sender{
    int qrcodeImageDimension = 250;
    
    //the string can be very long
    NSString *aVeryLongURL = @"张蓓蓓";
    
    //first encode the string into a matrix of bools, TRUE for black dot and FALSE for white. Let the encoder decide the error correction level and version
    DataMatrix* qrMatrix = [QREncoder encodeWithECLevel:QR_ECLEVEL_AUTO version:QR_VERSION_AUTO string:aVeryLongURL];
    
    //then render the matrix
    UIImage* qrcodeImage = [QREncoder renderDataMatrix:qrMatrix imageDimension:qrcodeImageDimension];
    
    UIImageWriteToSavedPhotosAlbum(qrcodeImage, 0,nil,nil);
    
     
    //put the image into the view
//    UIImageView* qrcodeImageView = [[UIImageView alloc] initWithImage:qrcodeImage];
//    
//    UIViewController *vc = [[UIViewController alloc] init];
//    vc.view.backgroundColor = [UIColor whiteColor];
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pressBackButton:)];
//    [vc.navigationItem setRightBarButtonItem:rightButton];
//    [vc.view addSubview:qrcodeImageView];
//    [qrcodeImageView setCenter:vc.view.center];
//    
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//    [self presentViewController:nav animated:YES completion:^{}];
}

- (IBAction)scanButtonRsp:(id)sender{
    ZXingWidgetController *zxingWidgetCtrl = [[ZXingWidgetController alloc]initWithDelegate:self
                                                                                 showCancel:YES
                                                                                   OneDMode:NO];
    
    NSMutableSet *readers = [[NSMutableSet alloc]init];
    QRCodeReader *qrcodeReader = [[QRCodeReader alloc]init];
    [readers addObject:qrcodeReader];
    zxingWidgetCtrl.readers = readers;
    [self presentViewController:zxingWidgetCtrl animated:YES completion:NULL];
}

#pragma mark ZXingDelegate
- (void)zxingController:(ZXingWidgetController*)controller didScanResult:(NSString *)result{
    [self dismissViewControllerAnimated:NO completion:NULL];
    NSLog(@"result: %@",result);
}

- (void)zxingControllerDidCancel:(ZXingWidgetController*)controller{
    NSLog(@"cancel...");
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
