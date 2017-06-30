//
//  ViewController.m
//  QuartzFun
//
//  Created by Vasilii on 30.06.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"
#import "QuartzFunView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)changeShape:(UISegmentedControl *)sender {
    
    UISegmentedControl *control = sender;
    [(QuartzFunView *)self.view setShapeType:[control selectedSegmentIndex]];
    if ([control selectedSegmentIndex] == kImageShape) {
        self.colorControl.enabled = NO;
    } else {
        self.colorControl.enabled = YES;
    }
}

//Определяем какой именно сегмент был выбран, и формируем новый цвет на основании этого выбора. Затем приводим тип view к типу QuartzFunView. Далее устанавливаем свойство currentColor данного представления таким образом, чтобы знать, какой именно цвет следует использовать в процессе рисования, кроме тех случаев, когда выбирается произвольный цвет. Когда же выбирается произвольный цвет, мы просто устанавливаем значение YES свойства useRandomColor текущего представления.
- (IBAction)changeColor:(UISegmentedControl *)sender {
    
    UISegmentedControl *control = sender;
    NSInteger index = [control selectedSegmentIndex];
    QuartzFunView *funView = (QuartzFunView *)self.view;
    
    switch (index) {
            case kRedColorTab:
            funView.currentColor = [UIColor redColor];
            funView.useRandomColor = NO;
            break;
            
            case kBlueColorTab:
            funView.currentColor = [UIColor blueColor];
            funView.useRandomColor = NO;
            break;
            
            case kYelloColorTab:
            funView.currentColor = [UIColor yellowColor];
            funView.useRandomColor = NO;
            break;
            
            case kGreenColorTab:
            funView.currentColor = [UIColor greenColor];
            funView.useRandomColor = NO;
            break;
            
            case kRandomColorTab: funView.useRandomColor = YES;
            break;
        default: break;
    }

}
@end
