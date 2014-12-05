//
//  servicecell.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 24/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "servicecell.h"

@implementation servicecell
@synthesize date1,des,txt;
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
