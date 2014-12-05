//
//  fav.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 27/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewItem.h"
#import "STCollapseTableView.h"
#import "Notifications.h"
#import "gallery_f.h"
#import "newgolf.h"
#import "membershipform.h"
#import "billenquiry.h"
#import "trancation.h"
#import "maintanance.h"
#import "changepassword.h"
#import "CMFViewController.h"
#import "districview1.h"
#import "abtjgeus.h"
#import "contactus.h"
#import "STCollapseTableView.h"
#import "singleton.h"
#import "BackgroundLayer.h"
#import "contactus.h"
#import "RZTableViewController.h"
@interface fav : GAITrackedViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *array1 ;
    NSMutableArray *array2;
    NSMutableArray *array3;
    NSMutableArray *array4;
    NSMutableArray *array5;
    NSMutableArray *array6;
    NSMutableArray *array7;
    NSMutableArray *imgarray;
    NSMutableArray *u_array1 ;
    NSMutableArray *u_array2;
    NSMutableArray *u_array3;
    NSMutableArray *u_array4;
    NSMutableArray *u_array5;
    NSMutableArray *u_array6;
    NSMutableArray *u_array7;
    singleton *manage;
    
    }

@property (weak, nonatomic) IBOutlet UIView *content;
@property (weak, nonatomic) IBOutlet UIView *sub;

@property(nonatomic,strong)IBOutlet UIView *sample;


@property (weak, nonatomic) IBOutlet UIView *menuTable;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property(nonatomic,retain)IBOutlet UICollectionView *collectionViewPack;
@property(nonatomic,retain)IBOutlet UITableView *tbl;
@property(nonatomic,retain)IBOutlet UITableView *tbl1;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr1;
@property(strong,nonatomic)NSMutableArray *insertionarray;
@property(strong,nonatomic)NSMutableArray *deletearray;



@property(strong,nonatomic)NSMutableArray *u_itemshowdetailsAr;
@property(strong,nonatomic)NSMutableArray *u_itemshowdetailsAr1;























@property(strong,nonatomic)IBOutlet UIView *show;
@property(strong,nonatomic)IBOutlet UIView *show1;
- (IBAction)showMenuDown:(id)sender;


@property(nonatomic,retain)IBOutlet UIButton *expo;
@property(nonatomic,retain)IBOutlet UIButton *login;
@property(nonatomic,retain)IBOutlet UIButton *logout;
@property(nonatomic,retain)IBOutlet UIView *nav1;
@property(nonatomic,strong)IBOutlet UILabel *username123;
@property(nonatomic,strong)IBOutlet UILabel *user;





//-(IBAction)customerfeedback:(id)sender;
-(IBAction)loginBtn:(id)sender;



-(IBAction)logouting:(id)sender;





-(IBAction)expo:(id)sender;





@property (nonatomic, weak) IBOutlet STCollapseTableView *tableView1;

//-(IBAction)delete:(id)sender;

@end
