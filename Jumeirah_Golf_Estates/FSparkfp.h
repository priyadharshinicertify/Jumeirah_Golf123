//
//  FSparkfp.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 08/10/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
#import "web_letter.h"
@interface FSparkfp :GAITrackedViewController<UITableViewDataSource,UITableViewDelegate>
{
    singleton *manage;
    NSURLConnection *Login_Connection;
    NSMutableData *Login_ResponseData;
}
@property(strong,nonatomic)IBOutlet UITableView *tblvie;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;


@end
