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
@property (strong, nonatomic) UIStackView *stackView;
@property (strong, nonnull) UIView *circle;
@property (strong, nonnull) UIView *square;
@property (strong, nonnull) UIView *triangle;
@property (strong, nonatomic) UIView *containerForCircle;
@property (strong, nonatomic) UIView *containerForSquare;
@property (strong, nonatomic) UIView *containerForTriangle;


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLabel];
    [self setupButton];
    [self updateConstraints];
    [self drawCircle];
    [self drawSquare];
    [self drawTriangle];
}

// Hide navigation bar

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
    self.title = @"";
    self.view.backgroundColor = [UIColor whiteColor];
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
    self.circle = [[UIView alloc]initWithFrame:CGRectMake(50, 230, 70, 70)];
    [self.circle.layer setCornerRadius:self.circle.frame.size.width / 2];
    [self.circle setBackgroundColor:[UIColor colorWithHexString:@"0xEE686A"]];
    self.circle.translatesAutoresizingMaskIntoConstraints = false;
    
    // Animation for circle
    [UIView animateWithDuration:0.5
         delay:0.0
       options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut
    animations:^{
        [self.circle setTransform:CGAffineTransformMakeScale(1.1, 1.1)];
    }completion:NULL];
    
    [self.stackView addSubview:self.circle];
}

// Square drawing

-(void)drawSquare {
    self.square = [[UIView alloc]initWithFrame:CGRectMake(150, 230, 70, 70)];
    [self.square.layer setCornerRadius:2.0];
    [self.square setBackgroundColor:[UIColor colorWithHexString:@"0x29C2D1"]];
    self.square.translatesAutoresizingMaskIntoConstraints = false;
    
    // Animation for square
    [UIView animateWithDuration:0.5
          delay:0.0
        options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut
     animations:^{
         self.square.frame = CGRectMake(150, 237, 70, 70);
     }
     completion:NULL];

    [self.stackView addSubview:self.square];

}

// Triangle drawing

-(void)drawTriangle {
    
    self.triangle = [[UIView alloc]initWithFrame:CGRectMake(250, 230, 70, 70)];
    [self.triangle.layer setCornerRadius:2.0];
    [self.triangle setBackgroundColor:[UIColor clearColor]];
    
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint:CGPointMake(0, 70)];
    [bezierPath addLineToPoint:CGPointMake(35, 0)];
    [bezierPath addLineToPoint:CGPointMake(70, 70)];
    [bezierPath closePath];

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.triangle.bounds;
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.fillColor = [UIColor colorWithHexString:@"0x34C1A1"].CGColor;
    
    self.triangle.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.triangle.layer addSublayer:shapeLayer];
    
    // Start rotation animation for triangle
    [self runSpinAnimationOnView:self.triangle duration:1 rotations:1 repeat:1];
    
    [self.stackView addSubview:self.triangle];
}

-(void)updateConstraints {
    // Autolayout
    
    self.stackView = [[UIStackView alloc]init];
    self.stackView.translatesAutoresizingMaskIntoConstraints = false;
    self.stackView.axis = UILayoutConstraintAxisHorizontal;
    self.stackView.distribution = UIStackViewDistributionFillEqually;

//
    [self.view addSubview:self.stackView];
//
//    [NSLayoutConstraint activateConstraints:@[
//        [self.stackView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
//        [self.stackView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-20],
//        [self.stackView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
//        [self.stackView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
//    ]];
    
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
