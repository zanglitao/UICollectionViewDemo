//
//  ViewController.m
//  UICollectionViewControllerDemo
//
//  Created by 臧 立涛 on 14-12-26.
//  Copyright (c) 2014年 臧 立涛. All rights reserved.
//

#import "ViewController.h"
#import "SimpleFlowLayoutCell.h"
#import "SimpleFlowLayoutSupplementaryView.h"

#define cellidentifier @"MY_CELL"

@interface ViewController ()
@property(nonatomic,strong)UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[SimpleFlowLayoutCell class] forCellWithReuseIdentifier:@"MY_CELL"];
    //追加视图的类型是UICollectionElementKindSectionHeader，也可以设置为UICollectionElementKindSectionFooter
    [self.collectionView registerClass:[SimpleFlowLayoutSupplementaryView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MY_SUPPLEMENT"];
    
    [self.view addSubview:self.collectionView];
    
    //配置UICollectionViewFlowLayout属性
    //每个itemsize的大小
    layout.itemSize = CGSizeMake(80, 50);
    //行与行的最小间距
    layout.minimumLineSpacing = 44;
    
    //每行的item与item之间最小间隔（如果）
    layout.minimumInteritemSpacing = 20;
    //每个section的头部大小
    layout.headerReferenceSize = CGSizeMake(44, 44);
    //每个section距离上方和下方20，左方和右方10
    layout.sectionInset = UIEdgeInsetsMake(20, 10, 20, 10);
    //垂直滚动(水平滚动设置UICollectionViewScrollDirectionHorizontal)
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
}

//每个section中有32个item
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  8;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SimpleFlowLayoutCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellidentifier forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%d",indexPath.item];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    SimpleFlowLayoutSupplementaryView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MY_SUPPLEMENT" forIndexPath:indexPath];
    view.label.text = [NSString stringWithFormat:@"section header %d",indexPath.section];
    return view;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(44, 44);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(80, 40);
    } else {
        return CGSizeMake(40, 40);
    }
}

@end