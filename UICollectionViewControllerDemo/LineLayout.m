//
//  LineLayout.m
//  UICollectionViewControllerDemo
//
//  Created by 臧 立涛 on 14-12-28.
//  Copyright (c) 2014年 臧 立涛. All rights reserved.
//

#import "LineLayout.h"

#define ITEM_SIZE 200.0
#define ACTIVE_DISTANCE 200
#define ZOOM_FACTOR 0.3

@implementation LineLayout

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.itemSize = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.sectionInset = UIEdgeInsetsMake(200, 0.0, 200, 0.0);
        self.minimumLineSpacing = 50.0;
    }
    return self;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat offsetAdjustment = MAXFLOAT;
    
    //预期滚动停止时水平方向的中心点
    CGFloat horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);
    
    //预期滚动停止时显示在屏幕上的区域
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    
    //获取该区域的UICollectionViewLayoutAttributes集合
    NSArray* array = [super layoutAttributesForElementsInRect:targetRect];
    
    
    for (UICollectionViewLayoutAttributes* layoutAttributes in array) {
        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
        //循环结束后offsetAdjustment的值就是预期滚定停止后离水平方向中心点最近的item的中心店
        if (ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment)) {
            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
        }
    }
    
    //返回偏移量
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    return YES;
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    //获取rect区域的UICollectionViewLayoutAttributes集合
    NSArray* array = [super layoutAttributesForElementsInRect:rect];
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    visibleRect.size = self.collectionView.bounds.size;
    
    for (UICollectionViewLayoutAttributes* attributes in array) {
        //只处理可视区域内的item
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            //可视区域中心点与item中心点距离
            CGFloat distance = CGRectGetMidX(visibleRect) - attributes.center.x;
            
            CGFloat normalizedDistance = distance / ACTIVE_DISTANCE;
            if (ABS(distance) < ACTIVE_DISTANCE) {
                //放大系数
                //当可视区域中心点和item中心点距离为0时达到最大放大倍数1.3
                //当可视区域中心点和item中心点距离大于200时达到最小放大倍数1，也就是不放大
                //距离在0~200之间时放大倍数在1.3~1
                CGFloat zoom = 1 + ZOOM_FACTOR*(1 - ABS(normalizedDistance));
                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
                attributes.zIndex = 1;
            }
        }
    }
    return array;
}

@end
