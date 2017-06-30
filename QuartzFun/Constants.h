//
//  Constants.h
//  QuartzFun
//
//  Created by Vasilii on 30.06.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#ifndef QuartzFun_Constants_h
#define QuartzFun_Constants_h

//перечисление для форм
typedef NS_ENUM(NSInteger, ShapeType) {
    kLineShape = 0,
    kRectShape,
    kEllipseShape,
    kImageShape
};
//перечисление для цеветов
typedef NS_ENUM(NSInteger, ColorTabIndex) {
    kRedColorTab = 0,
    kBlueColorTab,
    kYelloColorTab,
    kGreenColorTab,
    kRandomColorTab
};

#define degreesToRadian(x) (M_PI * (x) / 180.0)

#endif

//значения соответстувую сегментам 
