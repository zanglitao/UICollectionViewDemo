//
//  SimpleFlowLayoutCell.m
//  UICollectionViewControllerDemo
//
//  Created by 臧 立涛 on 14-12-28.
//  Copyright (c) 2014年 臧 立涛. All rights reserved.
//

#import "SimpleFlowLayoutCell.h"

@implementation SimpleFlowLayoutCell

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont boldSystemFontOfSize:15.0];
        self.backgroundColor = [UIColor lightGrayColor];
        
        [self.contentView addSubview:self.label];
        
        self.contentView.layer.borderWidth = 1.0f;
        self.contentView.layer.borderColor = [UIColor blackColor].CGColor;
    }
    
    return self;
}

@end
