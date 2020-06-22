//
//  FirstViewController.m
//  Task6Project
//
//  Created by Эдуард on 6/21/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import "FirstViewController.h"
#import "UIColor+ColorFromHex.h"
#import "TabBarController.h"

@interface FirstViewController ()

@property (strong, nonatomic) IBOutlet UILabel *readyLabel;
@property (strong, nonatomic) IBOutlet UIButton *startButton;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLabel];
    [self setupButton];
    [self drawCircle];
    [self drawSquare];
    [self drawTriangle];
    
}

// Hide navigation bar

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
}

// Label setup

-(void)setupLabel {
    self.readyLabel.textColor = [UIColor colorWithHexString:@"0x101010"];
}

// Button setup

-(void)setupButton {
    self.startButton.layer.cornerRadius = self.startButton.frame.size.height / 2;
    self.startButton.tintColor = [UIColor colorWithHexString:@"0x101010"];
    self.startButton.backgroundColor = [UIColor colorWithHexString:@"0xF9CC78"];
        [self.startButton addTarget:self action:@selector(goToSecondScreen) forControlEvents:UIControlEventTouchUpInside];
}

// Circle drawing

-(void)drawCircle {
    UIView *circle = [[UIView alloc]initWithFrame:CGRectMake(50, 230, 70, 70)];
    [circle.layer setCornerRadius:circle.frame.size.width / 2];
    [circle setBackgroundColor:[UIColor colorWithHexString:@"0xEE686A"]];
    [self.view addSubview:circle];
    
    [UIView animateWithDuration:3 animations:^{
        const CGFloat scale = 1.2;
        [circle setTransform:CGAffineTransformMakeScale(scale, scale)];
    }];
    
    self.view.translatesAutoresizingMaskIntoConstraints = false;

    [NSLayoutConstraint activateConstraints:@[
        
    ]];
    
}

// Square drawing

-(void)drawSquare {
    UIView *square = [[UIView alloc]initWithFrame:CGRectMake(150, 230, 70, 70)];
    [square.layer setCornerRadius:2.0];
    [square setBackgroundColor:[UIColor colorWithHexString:@"0x29C2D1"]];
    [self.view addSubview:square];
}

// Triangle drawing

-(void)drawTriangle {
    
    UIView *triangle = [[UIView alloc]initWithFrame:CGRectMake(250, 230, 70, 70)];
    [triangle.layer setCornerRadius:2.0];
    [triangle setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:triangle];
    
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint:CGPointMake(0, 70)];
    [bezierPath addLineToPoint:CGPointMake(35, 0)];
    [bezierPath addLineToPoint:CGPointMake(70, 70)];
    [bezierPath closePath];

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = triangle.bounds;
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.fillColor = [UIColor colorWithHexString:@"0x34C1A1"].CGColor;
    
    [triangle.layer addSublayer:shapeLayer];
}

-(void)goToSecondScreen {
    TabBarController *secondScreen = [[TabBarController alloc]initWithNibName:@"TabBarController" bundle:nil];
    [secondScreen setSelectedIndex:0];
    [self.navigationController pushViewController:secondScreen animated:YES];
}








@end
