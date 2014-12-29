//
//  CircleLayout.h
//  UICollectionViewControllerDemo
//
//  Created by 臧 立涛 on 14-12-28.
//  Copyright (c) 2014年 臧 立涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleLayout : UICollectionViewLayout
@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) NSInteger cellCount;
@end
