//
//  newscell.m
//  Jumeirah
//
//  Created by Veeramani on 16/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "newscell.h"

@implementation newscell
@synthesize tit,des,img,date;
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
- (void)viewDidLoad
{
    tit.font=[UIFont fontWithName:@"Roboto-Regular" size:5.0];
    tit.font=[UIFont systemFontOfSize:10.0];
    
    date.font=[UIFont fontWithName:@"Roboto-Regular" size:5.0];
    date.font=[UIFont systemFontOfSize:10.0];
    img.contentMode = UIViewContentModeScaleAspectFit;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
