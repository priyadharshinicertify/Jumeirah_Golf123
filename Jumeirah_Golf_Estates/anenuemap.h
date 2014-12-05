//
//  anenuemap.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 08/10/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
#import "web_letter.h"
@interface anenuemap : GAITrackedViewController<UITableViewDataSource,UITableViewDelegate>
{
    singleton *manage;
    NSURLConnection *Login_Connection;
    NSMutableData *Login_ResponseData;
}
@property(strong,nonatomic)IBOutlet UITableView *tblvie;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
-(IBAction)home:(id)sender;
@property(nonatomic,strong)IBOutlet UIView *sample;


@end
