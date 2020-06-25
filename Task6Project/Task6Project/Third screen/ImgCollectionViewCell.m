//
//  ImgCollectionViewCell.m
//  Task6Project
//
//  Created by Эдуард on 6/24/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import "ImgCollectionViewCell.h"

@implementation ImgCollectionViewCell

-(instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupImageView];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupImageView];
    }
    return self;
}

-(void)setupImageView {
    
    self.imgView = [[UIImageView alloc]init];
    self.imgView.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:self.imgView];

    [NSLayoutConstraint activateConstraints:@[
        [self.imgView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.imgView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
        [self.imgView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.imgView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
    ]];

}
@end
