//
//  ModalVC.h
//  Task6Project
//
//  Created by Эдуард on 6/25/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ModalVC : UIViewController

@property (nonatomic,strong) UIImage *img;
-(instancetype)initWithImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
