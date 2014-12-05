//
//  tablecellps.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 09/10/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "tablecellps.h"

@implementation tablecellps
@synthesize design1,plot,price,bua,bedrooms;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
 //   design1.layer.borderColor=[UIColor blueColor];
}


@end
