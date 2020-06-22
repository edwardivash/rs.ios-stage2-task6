//
//  UIColor+ColorFromHex.h
//  Task6Project
//
//  Created by Эдуард on 6/21/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ColorFromHex)

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

@end

NS_ASSUME_NONNULL_END
