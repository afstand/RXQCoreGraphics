//
//  CustomView.m
//  RXQCoreGraphics
//
//  Created by Shevchenko on 2018/6/1.
//  Copyright © 2018年 Shevchenko. All rights reserved.
//

#import "CustomView.h"

@interface CustomView()

@property (nonatomic,assign) CGContextRef currentContext;


@end

@implementation CustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    _currentContext = UIGraphicsGetCurrentContext();
    [self createCGpathRefStyles];
}

- (void)createCGpathRefStyles {
    //根据已有路径创建
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 30, 500);
    CGPathAddLineToPoint(path, NULL, 170, 500);
    CGPathAddQuadCurveToPoint(path, NULL, 245, 400, 320, 500);//根据三点确定贝塞尔曲线
    
   //根据已存在的路劲绘制路径
//    CGPathRef path0 = CGPathCreateCopy(path);
//    CGContextSetRGBStrokeColor(self.currentContext, 0.5, 0.1, 0.6, 1);
//    CGContextSetLineWidth(self.currentContext, 2);
//    CGContextAddPath(self.currentContext, path0);
//    CGContextStrokePath(self.currentContext);
//    CGPathRetain(path0);
    
    // CGAffineTransform 用于在二维空间的旋转，缩放和平移
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, -100);
    CGPathRef path1 = CGPathCreateCopyByTransformingPath(path, &transform);
    CGContextSetRGBStrokeColor(self.currentContext, 0.5, 0.1, 0.6, 1);
    CGContextSetLineWidth(self.currentContext, 2);
    CGContextAddPath(self.currentContext, path1);
    CGContextStrokePath(self.currentContext);
    CGPathRelease(path1);
    
    CGPathRef path2 = CGPathCreateWithRect(CGRectMake(50, 270, 80, 60), NULL);
    CGContextSetRGBStrokeColor(self.currentContext, 0.5, 0.1, 0.6, 1);
    CGContextSetLineWidth(self.currentContext, 2);
    CGContextAddPath(self.currentContext, path2);
    CGContextStrokePath(self.currentContext);
    CGPathRelease(path2);
    
    CGPathRef path3 = CGPathCreateWithEllipseInRect(CGRectMake(150, 275, 100, 50), NULL);
    CGContextSetRGBStrokeColor(self.currentContext, 0.5, 0.1, 0.6, 1);
    CGContextSetLineWidth(self.currentContext, 2);
    CGContextAddPath(self.currentContext, path3);
    CGContextStrokePath(self.currentContext);
    CGPathRelease(path3);
    
    CGPathRef path4 = CGPathCreateWithRoundedRect(CGRectMake(260, 250, 100, 100),30,40,NULL);
    CGContextSetRGBStrokeColor(self.currentContext, 0.5, 0.1, 0.6, 1);
    CGContextSetLineWidth(self.currentContext, 2);
    CGContextAddPath(self.currentContext, path4);
    CGContextStrokePath(self.currentContext);
    CGPathRelease(path4);
    
    CGFloat dash[] = {55,20,25,30};
    CGPathRef path5 = CGPathCreateCopyByDashingPath(path, NULL, 0, dash, 2);
    CGContextSetRGBStrokeColor(self.currentContext, 0.5, 0.1, 0.6, 1);
    CGContextSetLineWidth(self.currentContext, 2);
    CGContextAddPath(self.currentContext, path5);
    CGContextStrokePath(self.currentContext);
//    CGPathRelease(path5);
    
    CGPathRef path6 = CGPathCreateCopyByStrokingPath(path5, NULL, 10, kCGLineCapRound, kCGLineJoinRound, 3);
    //将路径加在上下文对象上
    CGContextSetRGBStrokeColor(self.currentContext, 0.6, 0.4, 0.5, 1);
    CGContextSetLineWidth(self.currentContext, 2);
    CGContextAddPath(self.currentContext, path6);
    CGContextStrokePath(self.currentContext);
    
    
    
}

@end
