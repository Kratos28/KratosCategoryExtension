//
//  KEmptyView.m
//  黑团HD
//
//  Created by Kratos on 16/3/18.
//  Copyright © 2016年 Kratos. All rights reserved.
//

#import "KratosEmptyView.h"
#import "UIView+AutoLayout.h"

@implementation KratosEmptyView


+ (instancetype)KratosEmptyView
{
    return [[self alloc] init];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentMode = UIViewContentModeCenter;
        self.image = [UIImage imageNamed:[@"KratosCategoryExtension.bundle" stringByAppendingPathComponent:@"icon_map_search_empty"]];
    }
    return self;
}


- (void)didMoveToSuperview
{
    [self autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
}

@end
