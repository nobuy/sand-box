//
//  CanvasView.h
//  CharacterDraw
//
//  Created by 山口 信行 on 2014/03/19.
//  Copyright (c) 2014年 Nobuyuki Yamaguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CanvasView : UIView

- (void)setColor:(UIColor *)color;
- (void)setLineWidth:(float)width;
- (void)setImage:(UIImage *)image;
- (void)refreshImage;

@end
