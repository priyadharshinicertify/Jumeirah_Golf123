//
//  salesfeedback.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 23/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"


#import "timeview.h"
#import "distrsview.h"
#import "propertytype.h"
@interface salesfeedback : GAITrackedViewController <timeview,distrsviewDelegate1,propertytypeDelegate1,UIPickerViewDelegate,UIPickerViewDataSource>
{
     CGFloat animatedDistance;
    singleton *manage;
    NSURLConnection *Login_Connection;
    NSMutableData *Login_ResponseData;
    UIView *vv;
}
@property (nonatomic, strong) IBOutlet UITextField *ddText;
@property (nonatomic, strong) IBOutlet UIView *ddMenu;
@property (nonatomic, strong) IBOutlet UIView *ddMenu1;
@property (nonatomic, strong) IBOutlet UIButton *ddMenuShowButton;
- (IBAction)ddMenuShow:(UIButton *)sender;
- (IBAction)ddMenuSelectionMade:(UIButton *)sender;
@property (strong,nonatomic)IBOutlet UIScrollView *Details_product_ScrollView;


@property (nonatomic, strong) IBOutlet UITextField *ddText1;
@property (nonatomic, strong) IBOutlet UIView *sample;

@property (nonatomic, strong) IBOutlet UIButton *ddMenuShowButton1;
- (IBAction)ddMenuShow1:(UIButton *)sender;
- (IBAction)ddMenuSelectionMade1:(UIButton *)sender;
@property (nonatomic, strong) UIPopoverController *userDataPopover;

@property (strong, nonatomic) UIDatePicker *picker1;

@property (strong, nonatomic) UIPickerView *picker2;
@property (strong, nonatomic) UIPickerView *picker3;

@property (nonatomic, strong) NSArray *arrAgeRanges;
@property (nonatomic, strong) NSArray *arrAgeRanges1;
@property (nonatomic, strong) NSArray *arrAgeRanges2;


@property (nonatomic, strong) IBOutlet UIView *ball;

@property (nonatomic, strong) IBOutlet UITextField *name;
@property (nonatomic, strong) IBOutlet UITextField *mail;
@property (nonatomic, strong) IBOutlet UITextField *mobno;
@property (nonatomic, strong) IBOutlet UITextField *time;
@property (nonatomic, strong) IBOutlet UITextField *no_bed;
@property (nonatomic, strong) IBOutlet UITextField *budget;
@property (strong, nonatomic) IBOutlet UITextField *dtText;


@property (nonatomic, strong) IBOutlet UITextField *name1;
@property (nonatomic, strong) IBOutlet UITextField *distselect;
@property (nonatomic, strong) IBOutlet UITextField *propertyselect;
-(IBAction)submit:(id)sender;
-(IBAction)sback:(id)sender;
@property (nonatomic, strong) IBOutlet UIButton *topButton;



@property (nonatomic, strong) IBOutlet UIButton *sub;

@property (nonatomic, strong) IBOutlet UIButton *dater;

@property (nonatomic, strong) IBOutlet UIButton *distr;

@property (nonatomic, strong) IBOutlet UIButton *property;



@end
