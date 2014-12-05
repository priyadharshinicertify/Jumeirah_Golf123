//
//  FToakmont.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 01/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//
#import "FGalleryViewController1.h"
#import <UIKit/UIKit.h>
#import "singleton.h"
@interface FToakmont : UIViewController<FGalleryViewControllerDelegate>{
    NSArray *localCaptions;
    NSArray *localImages;
    NSArray *flameimages;
    NSArray *networkCaptions;
    NSArray *networkImages;
    NSArray *wispering;
    NSArray *gereral;
    
    
    
	FGalleryViewController1 *localGallery;
    FGalleryViewController1 *networkGallery;
    FGalleryViewController1 *flamegallery;
    FGalleryViewController1 *wishperinggallery;
    FGalleryViewController1 *generalgallery;
    NSMutableData *receivedData;
    NSMutableData *receivedData_flame;
    NSMutableData *receivedData_flame1;
    NSString *selected_gallery;
}
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr_flame1;
@end
