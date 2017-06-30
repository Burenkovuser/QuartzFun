//
//  QuartzFunView.h
//  QuartzFun
//
//  Created by Vasilii on 30.06.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface QuartzFunView : UIView

@property (nonatomic) CGPoint firstTouch;
@property (nonatomic) CGPoint lastTouch;
@property (strong, nonatomic) UIColor *currentColor;//храним цвет
@property (nonatomic) ShapeType shapeType;//форма требуемая пользователю
@property (nonatomic, retain) UIImage *drawImage;//храним рисунок
@property (nonatomic) BOOL useRandomColor;// для изображения

@end
