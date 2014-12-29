//
//  SimpleFlowLayoutSupplementaryView.m
//  UICollectionViewControllerDemo
//
//  Created by 臧 立涛 on 14-12-28.
//  Copyright (c) 2014年 臧 立涛. All rights reserved.
//

#import "SimpleFlowLayoutSupplementaryView.h"

@implementation SimpleFlowLayoutSupplementaryView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.textColor = [UIColor blackColor];
        self.label.font = [UIFont boldSystemFontOfSize:15.0];
        self.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubview:self.label];
        
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [UIColor blackColor].CGColor;
    }
    
    return self;
}

@end
