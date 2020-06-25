//
//  TableViewData.h
//  Task6Project
//
//  Created by Эдуард on 6/22/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewData : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *size;

-(instancetype)initWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
