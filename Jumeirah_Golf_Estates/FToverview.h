//
//  FToverview.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 01/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FToverview : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
{
    
    
    NSURLConnection *Login_Connection;
    NSMutableData *Login_ResponseData;
    NSMutableData *receivedData;
    NSMutableArray *itemshowdetailsAr;
}

@property(strong,nonatomic)IBOutlet UITableView *tblvie;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@property (nonatomic) float rating;
@property(nonatomic,retain)IBOutlet UICollectionView *collectionViewPack;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr1;
@end
