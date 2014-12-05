//
//  newsletter.h
//  Jumeirah
//
//  Created by Veeramani on 18/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
#import "web_letter.h"


@interface newsletter : GAITrackedViewController<UITableViewDataSource,UITableViewDelegate>
{
    singleton *manage;
    NSURLConnection *Login_Connection;
    NSMutableData *Login_ResponseData;
}
@property(strong,nonatomic)IBOutlet UITableView *tblvie;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;

@property(strong,nonatomic)IBOutlet UILabel *titleing;

-(IBAction)home:(id)sender;
@property(nonatomic,strong)IBOutlet UIView *sample;
@end
