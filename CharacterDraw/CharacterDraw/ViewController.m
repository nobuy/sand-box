//
//  ViewController.m
//  CharacterDraw
//
//  Created by 山口 信行 on 2014/03/16.
//  Copyright (c) 2014年 Nobuyuki Yamaguchi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (IBAction)touchRedButton:(id)sender
{
    [_canvas setColor:[UIColor redColor]];
}

- (IBAction)touchBlueButton:(id)sender
{
    [_canvas setColor:[UIColor blueColor]];
}

- (IBAction)changedLineWidth:(id)sender
{
    [_canvas setLineWidth:((UISlider *)sender).value * 30.0];
}


- (IBAction)touchImageButton:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePicker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    [_canvas setImage:info[UIImagePickerControllerOriginalImage]];
}

- (IBAction)touchNextButton:(id)sender
{
    [_canvas refreshImage];
}


@end








