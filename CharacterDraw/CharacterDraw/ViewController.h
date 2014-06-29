//
//  ViewController.h
//  CharacterDraw
//
//  Created by 山口 信行 on 2014/03/16.
//  Copyright (c) 2014年 Nobuyuki Yamaguchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasView.h"

@interface ViewController : UIViewController <UINavigationControllerDelegate,  UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet CanvasView *canvas;
- (IBAction)touchRedButton:(id)sender;
- (IBAction)touchBlueButton:(id)sender;
- (IBAction)changedLineWidth:(id)sender;
- (IBAction)touchImageButton:(id)sender;
- (IBAction)touchNextButton:(id)sender;

@end
