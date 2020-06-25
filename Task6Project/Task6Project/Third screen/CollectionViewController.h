//
//  CollectionViewController.h
//  Task6Project
//
//  Created by Эдуард on 6/24/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, PHPhotoLibraryChangeObserver>

@end

NS_ASSUME_NONNULL_END
