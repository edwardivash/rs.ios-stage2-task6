//
//  CollectionViewController.m
//  Task6Project
//
//  Created by Эдуард on 6/24/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import "CollectionViewController.h"
#import "UIColor+ColorFromHex.h"
#import "ImgCollectionViewCell.h"
#import <Photos/Photos.h>
#import "ModalVC.h"

@interface CollectionViewController ()
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,assign) int numberOfColumns;
@property(nonatomic , strong) PHFetchResult *assetsFetchResults;
@property(nonatomic , strong) PHCachingImageManager *imageManager;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollectionView];
}

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.title = @"Gallery";
}

-(void)setupCollectionView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(50, 50);
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[ImgCollectionViewCell class] forCellWithReuseIdentifier:@"CellId"];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:self.collectionView];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.collectionView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [self.collectionView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.collectionView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.collectionView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
    ]];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    if (self.view.frame.size.width < self.view.frame.size.height) {
        self.numberOfColumns = 3;
    } else {
        self.numberOfColumns = 4;
    }
    
    [PHPhotoLibrary.sharedPhotoLibrary registerChangeObserver:self];
    
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[NSSortDescriptor
                                 sortDescriptorWithKey:@"creationDate" ascending:NO]];
    self.assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
    self.imageManager = [[PHCachingImageManager alloc] init];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.assetsFetchResults.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImgCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellId" forIndexPath:indexPath];
    PHAsset *asset = self.assetsFetchResults[indexPath.item];
    [self.imageManager requestImageForAsset:asset targetSize:CGSizeMake(asset.pixelWidth, asset.pixelHeight) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage *result, NSDictionary *info) {
        cell.imgView.image = result;
    }];
    return cell;
}


-(void)photoLibraryDidChange:(PHChange *)changeInstance {
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    self.assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = self.view.frame.size.width / 3 - 10;
    return CGSizeMake(width, width);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ImgCollectionViewCell *cell = [[ImgCollectionViewCell alloc]init];
    ModalVC *modalVC = [[ModalVC alloc]initWithImage:cell.imgView.image];
    [self.navigationController pushViewController:modalVC animated:NO];
}

@end
