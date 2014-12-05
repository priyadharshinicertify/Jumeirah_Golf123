//
//  latestnews.h
//  Jumeirah
//
//  Created by Veeramani on 26/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "singleton.h"

#import "SDWebImage/UIImageView+WebCache.h"


@interface latestnews : GAITrackedViewController
{
    
    
    NSMutableArray *itemshowdetailsAr;
    
}
@property(nonatomic,strong)IBOutlet UIView *sample;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@end
