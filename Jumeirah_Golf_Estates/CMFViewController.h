//
//  CMFViewController.h
//  UICollectionGallery
//
//  Created by Tim on 05/04/2013.
//  Copyright (c) 2013 Charismatic Megafauna Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FGalleryViewController.h"
@interface CMFViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,FGalleryViewControllerDelegate>
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
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr_flame;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr_flame1;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr_flame2;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr_flame3;

//-(IBAction)earth:(id)sender;
-(IBAction)etpi:(id)sender;
//-(IBAction)fire:(id)sender;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) IBOutlet UIButton *lft;
@property (strong, nonatomic)IBOutlet UIButton *rft;
-(IBAction)left:(id)sender;
-(IBAction)right:(id)sender;
@end
