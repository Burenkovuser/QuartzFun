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
            //нужны скобки. Дело в том, что компилятору трудно интерпретировать переменные, объявляемые в первой строке после оператора case. Поэтому фигурные скобки упрощают интерпретацию исходного кода компилятором. Переменную horizontalOffset можно было бы объявить и до оператора switch, но в предлагаемом здесь варианте весь связанный код сохраняется вместе.
            case kImageShape:{
                //расчитывается центр изображения
            CGFloat horizontalOffset = _drawImage.size.width / 2;
            CGFloat verticalOffset = _drawImage.size.height / 2;
            CGPoint drawPoint = CGPointMake(_lastTouch.x - horizontalOffset,
                                            _lastTouch.y - verticalOffset);
                [_drawImage drawAtPoint:drawPoint];//нарисовать изображение
            break;
            }
        default:
        break;
    }
}

@end
