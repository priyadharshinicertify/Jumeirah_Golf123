//
//  CollectionViewItem.m
//  Jumeirah
//
//  Created by Veeramani on 20/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "CollectionViewItem.h"

@implementation CollectionViewItem
@synthesize myImageView,view1,label,textlabel;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
       if (self) {
        view1=[[UIView alloc] initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:view1];

        myImageView = [[UIImageView alloc] initWithFrame:self.view1.bounds];
        [self.view1 addSubview:myImageView];
               label=[[UILabel alloc] initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:label];
           
           
           
       
    }
   
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    self.view1.layer.cornerRadius = self.view1.frame.size.width / 2;
    self.view1.clipsToBounds = YES;
    self.contentView.backgroundColor=[UIColor blackColor];
    self.view1.backgroundColor=[UIColor whiteColor];
    self.label.textColor=[UIColor whiteColor];
    
    
    self.textlabel.clipsToBounds = YES;
    self.textlabel.layer.cornerRadius=self.textlabel.frame.size.width / 2;
    self.textlabel.backgroundColor=[UIColor redColor];
    self.textlabel.textColor=[UIColor whiteColor];
    self.textlabel.textAlignment=NSTextAlignmentCenter;

}


@end
