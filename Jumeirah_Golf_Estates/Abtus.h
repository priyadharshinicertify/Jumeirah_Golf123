//
//  Abtus.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 21/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BackgroundLayer.h"


@interface Abtus : GAITrackedViewController<UITableViewDelegate,UITableViewDataSource>
{
    
    NSURLConnection *Login_Connection;
    NSMutableData *Login_ResponseData;
    NSMutableData *receivedData;
    NSMutableArray *itemshowdetailsAr;
}


@property(nonatomic,strong)IBOutlet UIView *sample;


@property(strong,nonatomic)IBOutlet UITableView *tblvie;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@property(strong,nonatomic)IBOutlet UIImageView *img;
-(IBAction)home:(id)sender;


@end
