//
//  Eservices.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 23/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"

#import "webEservices.h"

#import "web_letter.h"
@interface Eservices : GAITrackedViewController<UITableViewDataSource,UITableViewDelegate>
{
    singleton *manage;
    NSURLConnection *Login_Connection;
    NSMutableData *Login_ResponseData;
}
@property(strong,nonatomic)IBOutlet UITableView *tblvie;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
-(IBAction)home:(id)sender;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property(nonatomic,strong)IBOutlet UIView *sample;
@end
