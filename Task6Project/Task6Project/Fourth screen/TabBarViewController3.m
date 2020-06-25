//
//  TabBarViewController3.m
//  Task6Project
//
//  Created by Эдуард on 6/21/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import "TabBarViewController3.h"
#import "FirstViewController.h"
#import "UIColor+ColorFromHex.h"

@interface TabBarViewController3 ()
@property (nonatomic, strong) UIView *circle;
@property (nonatomic, strong) UIView *square;
@property (nonatomic, strong) UIView *triangle;

@end

@implementation TabBarViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLabels];
    
    [self drawTwoLines];
    
    [self drawCircle];
    [self drawSquare];
    [self drawTriangle];
    
    [self setupAppleImage];
    [self setupButtons];
}

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.title = @"RSSchool Task 6";

}

-(void)setupAppleImage {
    UIImageView *apple = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    apple.translatesAutoresizingMaskIntoConstraints = false;
    apple.image = [UIImage imageNamed:@"apple"];
    [self.view addSubview:apple];
    
    [NSLayoutConstraint activateConstraints:@[
        [apple.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20],
        [apple.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:40]
    ]];
}

-(void)setupLabels {
    
    // Name label
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(150, 30, 300, 20)];
    name.text = [NSString stringWithFormat:@"%@",[[UIDevice currentDevice]name]];
    name.textColor = [UIColor colorWithHexString:@"0x101010"];
    name.font = [UIFont systemFontOfSize:17 weight:UIFontWeightMedium];
    [self.view addSubview:name];
    
    // Model label
    UILabel *model = [[UILabel alloc]initWithFrame:CGRectMake(150, 60, 300, 20)];
    model.text = [NSString stringWithFormat:@"%@",[[UIDevice currentDevice]model]];
    model.textColor = [UIColor colorWithHexString:@"0x101010"];
    model.font = [UIFont systemFontOfSize:17 weight:UIFontWeightMedium];
    [self.view addSubview:model];
    
    // System label
    UILabel *system = [[UILabel alloc]initWithFrame:CGRectMake(150, 90, 300, 20)];
    system.text = [NSString stringWithFormat:@"%@",[[UIDevice currentDevice]systemVersion]];
    model.textColor = [UIColor colorWithHexString:@"0x101010"];
    system.font = [UIFont systemFontOfSize:17 weight:UIFontWeightMedium];
    [self.view addSubview:system];
}

-(void)drawTwoLines {
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(40, 170, 300, 2)];
    line1.backgroundColor = [UIColor colorWithHexString:@"0x707070"];
    [self.view addSubview:line1];
    
    [NSLayoutConstraint activateConstraints:@[
        [line1.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:40],
        [line1.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor]
    ]];
    
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(40, 360, 300, 2)];
    line2.backgroundColor = [UIColor colorWithHexString:@"0x707070"];
    [self.view addSubview:line2];
    
    [NSLayoutConstraint activateConstraints:@[
        [line2.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:40],
        [line2.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor]
    ]];
}

-(void)setupButtons {
    
    // Start button
    UIButton *startButton = [[UIButton alloc]initWithFrame:CGRectMake(40, 480, self.view.frame.size.width - 120, 55)];
    startButton.layer.cornerRadius = startButton.frame.size.height / 2;
    [startButton setTitle:@"Go to start!" forState:UIControlStateNormal];
    startButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startButton setBackgroundColor:[UIColor colorWithHexString:@"0xEE686A"]];
    [startButton addTarget:self action:@selector(startButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:startButton];
    
//    [NSLayoutConstraint activateConstraints:@[
//        [startButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
//        [startButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor]
//    ]];
    
    // Git button
    UIButton *gitButton = [[UIButton alloc]initWithFrame:CGRectMake(40, 400, self.view.frame.size.width - 120, 55)];
    gitButton.layer.cornerRadius = gitButton.frame.size.height / 2;
    [gitButton setTitle:@"Open Git CV" forState:UIControlStateNormal];
    gitButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
    [gitButton setTitleColor:[UIColor colorWithHexString:@"0x101010"] forState:UIControlStateNormal];
    [gitButton setBackgroundColor:[UIColor colorWithHexString:@"0xF9CC78"]];
    [gitButton addTarget:self action:@selector(gitButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:gitButton];
        
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

-(void)gitButtonAction {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://github.com/edwardivash"] options:@{} completionHandler:nil];
}

-(void)startButtonAction {
    FirstViewController *fistVC = [[FirstViewController alloc]init];
    [self.navigationController pushViewController:fistVC animated:YES];
}

@end
