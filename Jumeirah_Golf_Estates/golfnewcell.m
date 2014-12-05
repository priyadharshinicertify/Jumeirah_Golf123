//
//  golfnewcell.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 03/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "golfnewcell.h"

@implementation golfnewcell
@synthesize myImageView,txt,title,title1,vi,colored
;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        vi=[[UIView alloc] initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:vi];
        myImageView = [[UIImageView alloc] initWithFrame:self.vi.bounds];
        [self.contentView addSubview:myImageView];
       
    }
    return self;
}


@end
