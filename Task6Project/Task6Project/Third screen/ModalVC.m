//
//  ModalVC.m
//  Task6Project
//
//  Created by Эдуард on 6/25/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import "ModalVC.h"
#import "UIColor+ColorFromHex.h"

@interface ModalVC ()
@property (nonatomic,strong)UIImageView *imgView;
@end

@implementation ModalVC

- (instancetype)initWithImage:(UIImage *)image {
    self = [super init];
    if (self) {
        self.img = image;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationItem setHidesBackButton:YES];
    [self customButton];
    [self setupImgView];

}



-(void)customButton {
    UIButton *xButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [xButton setTitle:@"X" forState:UIControlStateNormal];
    [xButton setTitleColor:[UIColor colorWithHexString:@"0x101010"] forState:UIControlStateNormal];
    xButton.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:xButton];
    
    [NSLayoutConstraint activateConstraints:@[
        [xButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [xButton.topAnchor constraintEqualToAnchor:self.view.topAnchor],
    ]];
    
    [xButton addTarget:self action:@selector(xButtonSelector) forControlEvents:UIControlEventTouchUpInside];
}

-(void)xButtonSelector {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setupImgView {
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    self.imgView = [[UIImageView alloc]init];
    self.imgView.image = img;
    [self.view addSubview:self.imgView];
    self.imgView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.imgView setContentMode:UIViewContentModeScaleAspectFill];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.imgView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.imgView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [self.imgView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.imgView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
    ]];
    
}


@end
