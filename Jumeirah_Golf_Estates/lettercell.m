//
//  lettercell.m
//  Jumeirah
//
//  Created by Veeramani on 18/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "lettercell.h"

@implementation lettercell
@synthesize date,des,txt;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
