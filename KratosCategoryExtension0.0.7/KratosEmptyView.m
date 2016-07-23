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


+ (instancetype)KratosEmptyViewWithIconName:(NSString *)iconname;
{
    KratosEmptyView *emptyView = [[KratosEmptyView alloc] initWithIconName:iconname];
    
    return emptyView;
}


- (instancetype)initWithIconName:(NSString *)iconName;
{
    if (self = [super init]) {
        self.contentMode = UIViewContentModeCenter;
        self.image = iconName.length == 0? [UIImage imageNamed:KratosExtensionSrcName(@"icon_map_search_empty.png")] ?:
                                           [UIImage imageNamed: KratosExtensionFrameworkSrcName(@"icon_map_search_empty.png")] :
                                           [UIImage imageNamed:iconName] ;
    }
    return self;
}


- (void)didMoveToSuperview
{
    if (self.superview) {
        [self autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    }
}

@end
