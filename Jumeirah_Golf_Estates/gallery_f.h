//
//  gallery_f.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 23/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FGalleryViewController.h"
#import "singleton.h"
@interface gallery_f :  GAITrackedViewController <UITableViewDataSource,UITableViewDelegate,FGalleryViewControllerDelegate> {
	NSArray *localCaptions;
    NSArray *localImages;
    NSArray *flameimages;
    NSArray *networkCaptions;
    NSArray *networkImages;
    NSArray *wispering;
    NSArray *gereral;
    NSString *pg1;
    NSString *pg2;
    NSString *pg3;
    NSString *pg4;
    
    singleton *manage;
	FGalleryViewController *localGallery;
    FGalleryViewController *networkGallery;
     FGalleryViewController *flamegallery;
      FGalleryViewController *wishperinggallery;
    FGalleryViewController *generalgallery;
     NSMutableData *receivedData;
       NSMutableData *receivedData_flame;
     NSMutableData *receivedData_flame1;
    NSString *selected_gallery;
}
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr1;
@property(strong,nonatomic)NSMutableArray *counter;


@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr_flame;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr_flame1;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr_flame2;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr_flame3;



@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr_flamet;
@property(strong,nonatomic)IBOutlet UITableView *tablviw;
@property(strong,nonatomic)IBOutlet UIActivityIndicatorView  *spinner;
//@property(strong,nonatomic)UIActivityIndicatorView
-(IBAction)home:(id)sender;
@property(nonatomic,strong)IBOutlet UIView *sample;
@end
