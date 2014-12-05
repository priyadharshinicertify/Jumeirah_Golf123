//
//  districview1.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 31/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FGalleryViewController.h"
#import "RESideMenu.h"
#import "BackgroundLayer.h"
#import "salesfeedback.h"
@interface districview1 : GAITrackedViewController<UICollectionViewDataSource,UICollectionViewDelegate,UINavigationBarDelegate,FGalleryViewControllerDelegate,RESideMenuDelegate>
{
    NSArray *localCaptions;
    NSArray *localImages;
    NSArray *flameimages;
    NSArray *networkCaptions;
    NSArray *networkImages;
    NSArray *wispering;
    NSArray *gereral;
    
    
    
	FGalleryViewController *localGallery;
    FGalleryViewController *networkGallery;
    FGalleryViewController *flamegallery;
    FGalleryViewController *wishperinggallery;
    FGalleryViewController *generalgallery;
    NSMutableData *receivedData;
    NSMutableData *receivedData_flame;
    NSMutableData *receivedData_flame1;
    
}
-(IBAction)home:(id)sender;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr_flame;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr_flame1;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr_flame2;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr_flame3;
@property (nonatomic) int currentIndex;

//-(IBAction)earth:(id)sender;
//-(IBAction)etpi:(id)sender;
//-(IBAction)fire:(id)sender;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) IBOutlet UIButton *lft;
@property (strong, nonatomic)IBOutlet UIButton *rft;
@property(strong,nonatomic)IBOutlet UIView *v1;
@property(strong,nonatomic)IBOutlet UIView *vearth;
@property(strong,nonatomic)IBOutlet UIView *vetpi;
@property(strong,nonatomic)IBOutlet UIView *vfire;
@property(strong,nonatomic)IBOutlet UIImageView *animatedImageView1;

@property(nonatomic,strong)IBOutlet UIView *sample;

@property(nonatomic,strong)IBOutlet UIView *sample1;

@property(strong,nonatomic)IBOutlet UITextView *text123;

@property(strong,nonatomic)IBOutlet UITextView *text2;
@property(strong,nonatomic)IBOutlet UITextView *text3;
@property(strong,nonatomic)IBOutlet UITextView *text4;


@property(strong,nonatomic)IBOutlet UILabel *lbl;

@property(strong,nonatomic)IBOutlet UIButton *btn1;

@property(strong,nonatomic)IBOutlet UIButton *btn2;
@property(strong,nonatomic)IBOutlet UIButton *btn3;


@property(strong,nonatomic)IBOutlet UIButton *b4;
@property(strong,nonatomic)IBOutlet UIButton *btn5;
@property(strong,nonatomic)IBOutlet UIButton *btn6;
@property(strong,nonatomic)IBOutlet UIButton *btn4;
@property(strong,nonatomic)IBOutlet UIButton *color;

-(IBAction)btn1action:(id)sender;
-(IBAction)btn2action:(id)sender;
-(IBAction)btn3action:(id)sender;

-(IBAction)btn4action:(id)sender;
//-(IBAction)btn5action:(id)sender;
-(IBAction)sales:(id)sender;
-(IBAction)contact:(id)sender;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property(strong,nonatomic)IBOutlet UIWebView *animatedImageView;

@property(strong,nonatomic)IBOutlet UIView *navview;

@property (strong, nonatomic) NSIndexPath *selectedIndexPath;

@end
