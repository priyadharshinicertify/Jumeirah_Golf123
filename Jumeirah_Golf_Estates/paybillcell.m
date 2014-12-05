//
//  paybillcell.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 15/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "paybillcell.h"

@implementation paybillcell
@synthesize servicecharge,amt,invoice,dt,ssss;
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
