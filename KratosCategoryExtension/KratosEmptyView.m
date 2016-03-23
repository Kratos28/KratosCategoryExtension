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


+ (instancetype)EmptyView
{
    return [[self alloc] init];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentMode = UIViewContentModeCenter;
        self.image = [UIImage imageNamed:KratosExtensionSrcName(@"icon_map_search_empty.png")] ?: [UIImage imageNamed:        KratosExtensionFrameworkSrcName(@"icon_map_search_empty.png")];

    
        NSLog(@"self.image%@",self.image);
    }
    return self;
}


- (void)didMoveToSuperview
{
    [self autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
}

@end
