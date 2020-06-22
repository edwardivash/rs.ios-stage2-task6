//
//  FirstViewController.m
//  Task6Project
//
//  Created by Эдуард on 6/21/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
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
    
    // Animation for circle
    [UIView animateWithDuration:0.5
         delay:0.0
       options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut
    animations:^{
        [circle setTransform:CGAffineTransformMakeScale(1.2, 1.2)];
    }completion:NULL];
    
}

// Square drawing

-(void)drawSquare {
    UIView *square = [[UIView alloc]initWithFrame:CGRectMake(150, 230, 70, 70)];
    [square.layer setCornerRadius:2.0];
    [square setBackgroundColor:[UIColor colorWithHexString:@"0x29C2D1"]];
    [self.view addSubview:square];
    
    // Animation for square
    [UIView animateWithDuration:0.5
          delay:0.0
        options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut
     animations:^{
         square.frame = CGRectMake(150, 237, 70, 70);
     }
     completion:NULL];
    
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
    
    // Start rotation animation for triangle
    [self runSpinAnimationOnView:triangle duration:1 rotations:1 repeat:1];
    
}

// Rotation method for triangle
- (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat {
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat ? HUGE_VALF : 0;

    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

-(void)goToSecondScreen {
    TabBarController *secondScreen = [[TabBarController alloc]initWithNibName:@"TabBarController" bundle:nil];
    [secondScreen setSelectedIndex:0];
    [self.navigationController pushViewController:secondScreen animated:YES];
}


@end
