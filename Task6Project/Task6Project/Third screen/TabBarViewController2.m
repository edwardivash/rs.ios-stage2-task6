//
//  TabBarViewController2.m
//  Task6Project
//
//  Created by Эдуард on 6/21/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import "TabBarViewController2.h"
#import "CollectionViewCell.h"

@interface TabBarViewController2 ()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *imageNames;

@end

@implementation TabBarViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Gallery";
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

-  (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    return cell;
}
@end
