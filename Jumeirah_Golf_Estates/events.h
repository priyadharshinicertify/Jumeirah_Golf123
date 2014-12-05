//
//  events.h
//  Jumeirah
//
//  Created by Veeramani on 17/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "events.h"

#import <EventKitUI/EventKitUI.h>
#import "singleton.h"
@interface events : GAITrackedViewController<UITableViewDelegate,UITableViewDataSource,EKEventEditViewDelegate>
{
    singleton *manage;
    NSURLConnection *Login_Connection;
    NSMutableData *Login_ResponseData;
    NSMutableData *receivedData;
}
@property(strong,nonatomic)IBOutlet UITableView *tblvie;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
-(IBAction)home:(id)sender;
@property(nonatomic,strong)IBOutlet UIView *sample;
@end
