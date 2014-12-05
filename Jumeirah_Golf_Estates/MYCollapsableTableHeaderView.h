//
//  MYCollapsableTableHeaderView.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 06/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MYCollapsableTableHeaderView;

@protocol MYCollapsableTableHeaderViewDelegate <NSObject>

@required

- (void)collapsableTableHeaderViewTapped:(MYCollapsableTableHeaderView *)collapsableTableHeaderView;

@end

@interface MYCollapsableTableHeaderView : UIView

@property (assign, nonatomic) id <MYCollapsableTableHeaderViewDelegate> collapsableTableHeaderViewDelegate;

@property (nonatomic) NSUInteger section;
@property (nonatomic, getter = isExpanded) BOOL expanded;

+ (instancetype)collapsableTableHeaderViewWithCollapsableTableHeaderViewDelegate:(id <MYCollapsableTableHeaderViewDelegate>)delegate;

- (CGFloat)collapsableTableHeaderViewHeight;

- (void)giveText:(NSString *)text;

@end