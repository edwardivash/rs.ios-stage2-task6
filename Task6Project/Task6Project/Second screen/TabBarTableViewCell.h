//
//  TabBarTableViewCell.h
//  Task6Project
//
//  Created by Эдуард on 6/22/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TabBarTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *bigImage;
@property (strong, nonatomic) IBOutlet UIImageView *smallImage;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *subtitle;


@end

NS_ASSUME_NONNULL_END
