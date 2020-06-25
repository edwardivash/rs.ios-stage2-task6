//
//  TabBarViewController3.m
//  Task6Project
//
//  Created by Эдуард on 6/21/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import "TabBarViewController3.h"
#import "UIColor+ColorFromHex.h"

@interface TabBarViewController3 ()
@property (nonatomic, strong) UIView *circle;
@property (nonatomic, strong) UIView *square;
@property (nonatomic, strong) UIView *triangle;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TabBarViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawCircle];
    [self drawSquare];
    [self drawTriangle];
}

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.title = @"RSSchool Task 6";

}



-(void)drawCircle {
    self.circle = [[UIView alloc]initWithFrame:CGRectMake(50, 230, 70, 70)];
    [self.circle.layer setCornerRadius:self.circle.frame.size.width / 2];
    [self.circle setBackgroundColor:[UIColor colorWithHexString:@"0xEE686A"]];
    self.circle.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:self.circle];
    
    // Animation for circle
    [UIView animateWithDuration:0.5
         delay:0.0
       options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut
    animations:^{
        [self.circle setTransform:CGAffineTransformMakeScale(1.1, 1.1)];
    }completion:NULL];
    
    
}

// Square drawing

-(void)drawSquare {
    self.square = [[UIView alloc]initWithFrame:CGRectMake(150, 230, 70, 70)];
    [self.square.layer setCornerRadius:2.0];
    [self.square setBackgroundColor:[UIColor colorWithHexString:@"0x29C2D1"]];
    self.square.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:self.square];
    
    // Animation for square
    [UIView animateWithDuration:0.5
          delay:0.0
        options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut
     animations:^{
         self.square.frame = CGRectMake(150, 237, 70, 70);
     }
     completion:NULL];

    
}

// Triangle drawing

-(void)drawTriangle {
    
    self.triangle = [[UIView alloc]initWithFrame:CGRectMake(250, 230, 70, 70)];
    [self.triangle.layer setCornerRadius:2.0];
    [self.triangle setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.triangle];
    
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

@end
