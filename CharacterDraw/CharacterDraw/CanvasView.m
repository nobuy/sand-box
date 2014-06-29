//
//  CanvasView.m
//  CharacterDraw
//
//  Created by 山口 信行 on 2014/03/19.
//  Copyright (c) 2014年 Nobuyuki Yamaguchi. All rights reserved.
//

#import "CanvasView.h"

@interface CanvasView()
@property (nonatomic) CGContextRef bitmapContext;
@end

@implementation CanvasView

- (CGContextRef)bitmapContext
{
    if (!_bitmapContext)
    {
        int width = self.bounds.size.width;
        int height = self.bounds.size.height;
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        _bitmapContext = CGBitmapContextCreate(NULL, width, height, 8, 4 * width,
                                               colorSpace, kCGImageAlphaPremultipliedFirst);
        CGColorSpaceRelease(colorSpace);
        
        CGContextSetLineWidth(_bitmapContext, 3.0);
        CGContextSetLineCap(_bitmapContext, kCGLineCapRound);
        CGContextSetStrokeColorWithColor(_bitmapContext, [UIColor redColor].CGColor);
    }
    return _bitmapContext;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGImageRef image = CGBitmapContextCreateImage(self.bitmapContext);
    CGContextRef curentContext = UIGraphicsGetCurrentContext();
    CGContextDrawImage(curentContext, rect, image);
    CGImageRelease(image);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"touches count : %d (touchesMoved:withEvent:)", [touches count]);
//    NSLog(@"allTouches count : %d (touchesMoved:withEvent:)", [[event allTouches] count]);

    NSArray	*touchesObjects = [[event allTouches] allObjects];
    int i = 0;
    for (UITouch *touch in touchesObjects)
    {
        CGPoint p = [touch locationInView:self];
        CGPoint q = [touch previousLocationInView:self];
        printf("%d q(%f, %f) p(%f, %f)\n", i, q.x, q.y, p.x, p.y);
        
        CGContextMoveToPoint(self.bitmapContext, q.x, q.y);
        CGContextAddLineToPoint(self.bitmapContext, p.x, p.y);
        CGContextStrokePath(self.bitmapContext);
        
        [self setNeedsDisplay];
        
        i += 1;
    }
#if 0
    CGPoint p = [[touches anyObject] locationInView:self];
    CGPoint q = [[touches anyObject] previousLocationInView:self];
    printf("q(%f, %f) p(%f, %f)\n", q.x, q.y, p.x, p.y);
    
    CGContextMoveToPoint(self.bitmapContext, q.x, q.y);
    CGContextAddLineToPoint(self.bitmapContext, p.x, p.y);
    CGContextStrokePath(self.bitmapContext);
    [self setNeedsDisplay];
#endif
}

- (void)setColor:(UIColor *)color
{
    CGContextSetStrokeColorWithColor(self.bitmapContext, color.CGColor);
}

- (void)setLineWidth:(float)width
{
    CGContextSetLineWidth(self.bitmapContext, width);
}

- (void)setImage:(UIImage *)image
{
    UIGraphicsPushContext(self.bitmapContext);
    [image drawInRect:self.bounds];
    UIGraphicsPopContext();
    [self setNeedsDisplay];
}

- (void)refreshImage
{
    UIGraphicsPushContext(self.bitmapContext);
    UIImage *image = [UIImage imageNamed:@"character_001.png"];
    [image drawInRect:self.bounds];
    UIGraphicsPopContext();
    [self setNeedsDisplay];
}

- (void)dealloc
{
    CGContextRelease(_bitmapContext);
}


@end
