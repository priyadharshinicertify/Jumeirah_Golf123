//
//  brief_news.h
//  Jumeirah
//
//  Created by Veeramani on 18/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "latestnews.h"
#import "singleton.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface brief_news : GAITrackedViewController
{
    
    NSURLConnection *Login_Connection;
    NSMutableData *Login_ResponseData;
    NSMutableData *receivedData;
    NSMutableArray *itemshowdetailsAr;
    singleton *manage;
}
@property(nonatomic,strong)IBOutlet UIView *sample;

@property(strong,nonatomic)IBOutlet UIImageView *imgview;
@property(strong,nonatomic)IBOutlet UITextView *txtview;
@property(strong,nonatomic)IBOutlet UILabel *date;
@property(strong,nonatomic)IBOutlet UILabel *tit;
@property(strong,nonatomic)IBOutlet UILabel *tit1;
-(IBAction)back:(id)sender;
@end
