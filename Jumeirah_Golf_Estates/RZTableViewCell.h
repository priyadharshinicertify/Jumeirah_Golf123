//
//  RZTableViewCell.h
//  RZCellSizeManagerDemo
//
//  Created by Alex Rouse on 12/20/13.
//  Copyright (c) 2013 Raizlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RZCellData;
@class RZEntry;
@interface RZTableViewCell : UITableViewCell

@property (nonatomic, weak) RZCellData* cellData;
@property (nonatomic, weak) RZEntry* cellEntry;

+ (NSString *)reuseIdentifier;

+ (UINib *)reuseNib;

+ (CGFloat)estimatedCellHeight;
@property(strong,nonatomic)IBOutlet UILabel *l1;
@property(strong,nonatomic)IBOutlet UILabel *l2;
@end
