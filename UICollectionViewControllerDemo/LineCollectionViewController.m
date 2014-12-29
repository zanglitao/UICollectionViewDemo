//
//  LineCollectionViewController.m
//  UICollectionViewControllerDemo
//
//  Created by 臧 立涛 on 14-12-28.
//  Copyright (c) 2014年 臧 立涛. All rights reserved.
//

#import "LineCollectionViewController.h"
#import "LineLayout.h"
#import "LineLayoutCell.h"

@interface LineCollectionViewController ()

@end

@implementation LineCollectionViewController

-(void)viewDidLoad
{
    [self.collectionView registerClass:[LineLayoutCell class] forCellWithReuseIdentifier:@"MY_CELL"];
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return 60;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    LineLayoutCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"MY_CELL" forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%d",indexPath.item];
    return cell;
}

@end
