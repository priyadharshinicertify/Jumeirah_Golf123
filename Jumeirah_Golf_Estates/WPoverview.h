//
//  WPoverview.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 30/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"
#import "singleton.h"
@interface WPoverview : GAITrackedViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
{
   
 singleton *manage;
    NSURLConnection *Login_Connection;
    NSMutableData *Login_ResponseData;
    NSMutableData *receivedData;
    NSMutableArray *itemshowdetailsAr;
}

@property(strong,nonatomic)IBOutlet UITableView *tblvie;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr1;
@property (nonatomic) float rating;
@property(nonatomic,retain)IBOutlet UICollectionView *collectionViewPack;
@end
