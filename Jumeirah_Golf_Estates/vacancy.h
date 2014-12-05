//
//  vacancy.h
//  Jumeirah
//
//  Created by Veeramani on 17/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "singleton.h"
#import "brief_jobspost.h"
#import "BackgroundLayer.h"


@interface vacancy : GAITrackedViewController<UITableViewDelegate,UITableViewDataSource>
{
    singleton *manage;
    NSURLConnection *Login_Connection;
    NSMutableData *receivedData;
    NSDictionary *jsonObject;

}
@property(strong,nonatomic)IBOutlet UITableView *tblvie;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
-(IBAction)home:(id)sender;
@property(nonatomic,strong)IBOutlet UIView *sample;

//@property(nonatomic,strong)IBOutlet UIView *sample1;

@property(strong,nonatomic)IBOutlet UIButton *lbl;
@end
