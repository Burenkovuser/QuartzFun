//
//  QuartzFunView.m
//  QuartzFun
//
//  Created by Vasilii on 30.06.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "QuartzFunView.h"
#import "UIColor+Random.h"

@implementation QuartzFunView

- (id)initWithCoder:(NSCoder *)coder {
    if(self = [super initWithCoder:coder]) {
        _currentColor = [UIColor redColor];//красный цвет начальный
        _useRandomColor = NO;
        _drawImage = [UIImage imageNamed:@"qr-code"];
    }
    
    return self;
}

#pragma mark - Touch Handling

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (_useRandomColor) {
    self.currentColor = [UIColor randomColor];
    }
    UITouch *touch = [touches anyObject];
    _firstTouch = [touch locationInView:self];
    _lastTouch = [touch locationInView:self];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    [self setNeedsDisplay];
}

//рисуем
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();//ссылка на кнонтекст где рисовать
    CGContextSetLineWidth(context, 2.0);//линия толщеной 2
    CGContextSetStrokeColorWithColor(context, _currentColor.CGColor);//цвет
    
    CGContextSetFillColorWithColor(context, _currentColor.CGColor);//заливка для элипса и прямоугольника
    //координаты и размеры (высота и ширина)
    CGRect currentRect = CGRectMake(_firstTouch.x,
                                    _firstTouch.y,
                                    _lastTouch.x - _firstTouch.x,
                                    _lastTouch.y - _firstTouch.y);
    
    switch (_shapeType) {
            case kLineShape://линия
            CGContextMoveToPoint(context, _firstTouch.x, _firstTouch.y);
            CGContextAddLineToPoint(context, _lastTouch.x, _lastTouch.y);
            CGContextStrokePath(context);
            break;
            
            case kRectShape://квадрат
            CGContextAddRect(context, currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
            
            case kEllipseShape://элипс
            CGContextAddEllipseInRect(context, currentRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
            
            case kImageShape:
            break;
            
        default:
        break;
    }
}

@end
