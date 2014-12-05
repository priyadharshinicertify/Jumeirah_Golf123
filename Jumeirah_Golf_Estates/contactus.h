//
//  contactus.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 01/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "JFMapAnnotation.h"

#import <UIKit/UIKit.h>
#import "BackgroundLayer.h"

@interface contactus : GAITrackedViewController<MKMapViewDelegate>

{
    NSMutableData *receivedData;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (void)addGestureRecogniserToMapView;
- (void)addPinToMap:(UIGestureRecognizer *)gestureRecognizer;
- (NSMutableArray *)parseJSONCities;

@property(strong,nonatomic)IBOutlet UIView *property;
@property(strong,nonatomic)IBOutlet UIView *club;
@property(strong,nonatomic)IBOutlet UIView *membership;
@property(strong,nonatomic)IBOutlet UIView *tour;
@property(strong,nonatomic)IBOutlet UIView *maintance;
-(IBAction)propertypress:(id)sender;
-(IBAction)clubpress:(id)sender;
-(IBAction)membership:(id)sender;
-(IBAction)tourpress:(id)sender;
-(IBAction)maintance:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *property12;
@property (strong, nonatomic) IBOutlet UIButton *clube_house;
@property (strong, nonatomic) IBOutlet UIButton *tour12;
@property (strong, nonatomic) IBOutlet UIButton *maitenence;

@property(nonatomic,strong)IBOutlet UIView *sample;
@property(nonatomic,retain)IBOutlet UIScrollView *scr1;
@property (strong, nonatomic) IBOutlet UIButton *mem;
@property(strong,nonatomic)IBOutlet UIPageControl *pagecontrol;
-(IBAction)home:(id)sender;



@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr1;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr2;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr3;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr4;



@property (strong, nonatomic) IBOutlet UILabel *p_tit1;

@property (strong, nonatomic) IBOutlet UILabel *p_mail1;
@property (strong, nonatomic) IBOutlet UILabel *p_phone1;
@property (strong, nonatomic) IBOutlet UILabel *p_tit2;
@property (strong, nonatomic) IBOutlet UILabel *p_mail2;
@property (strong, nonatomic) IBOutlet UILabel *p_phone2;
@property (strong, nonatomic) IBOutlet UILabel *p_address2;

@property (strong, nonatomic) IBOutlet UILabel *main_tit;;
@property (strong, nonatomic) IBOutlet UILabel *c_tit1;

@property (strong, nonatomic) IBOutlet UILabel *c_mail1;
@property (strong, nonatomic) IBOutlet UILabel *c_phone1;
@property (strong, nonatomic) IBOutlet UILabel *c_tit2;
@property (strong, nonatomic) IBOutlet UILabel *c_mail2;
@property (strong, nonatomic) IBOutlet UILabel *c_phone2;


@property (strong, nonatomic) IBOutlet UILabel *e_tit1;
@property (strong, nonatomic) IBOutlet UILabel *e_mail1;
@property (strong, nonatomic) IBOutlet UILabel *e_phone1;

@property (strong, nonatomic) IBOutlet UILabel *cm_tit1;
@property (strong, nonatomic) IBOutlet UILabel *cm_mail1;
@property (strong, nonatomic) IBOutlet UILabel *cm_phone1;


@property (strong, nonatomic) IBOutlet UILabel *m_mail1;
@property (strong, nonatomic) IBOutlet UILabel *m_phone1;




@end
