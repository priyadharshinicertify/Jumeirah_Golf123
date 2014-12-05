//
//  Ovierview1.h
//  Jumeirah
//
//  Created by Veeramani on 11/07/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
@interface Ovierview1 : GAITrackedViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
{
    
    singleton *manage;
    NSURLConnection *Login_Connection;
    NSMutableData *Login_ResponseData;
    NSMutableData *receivedData;
    NSMutableArray *itemshowdetailsAr;
}

@property(strong,nonatomic)IBOutlet UITableView *tblvie;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@property (nonatomic) float rating;

@property(nonatomic,retain)IBOutlet UICollectionView *collectionViewPack;
@end
