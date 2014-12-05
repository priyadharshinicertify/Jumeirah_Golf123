//
//  applicationfeedback.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 21/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Rateview.h"
#import "Infoview.h"
#import "History.h"
#import "Notification.h"
#import "Perfomance.h"
#import "Career.h"
#import "Usability.h"
#import "BackgroundLayer.h"

@interface applicationfeedback : GAITrackedViewController<RateViewDelegate,InfoviewViewDelegate,HistoryViewDelegate,notificationViewDelegate,perfomanceViewDelegate,careerViewDelegate,usabilityViewDelegate,UITextViewDelegate,UITextFieldDelegate>
{
    
    NSURLConnection *Login_Connection;
    NSMutableData *Login_ResponseData;
    
}

@property(nonatomic,strong)IBOutlet UIView *sample;

@property (weak, nonatomic) IBOutlet Rateview *rateview;

@property (weak, nonatomic) IBOutlet Infoview *Infoview;
@property (weak, nonatomic) IBOutlet History *History;
@property (weak, nonatomic) IBOutlet Notification *notification;
@property (weak, nonatomic) IBOutlet Perfomance *perfomance;
@property (weak, nonatomic) IBOutlet Career *career;
@property (weak, nonatomic) IBOutlet Usability *usability;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UITextView *comments;
@property (strong, nonatomic) IBOutlet UITextView *comments2;


@property (weak, nonatomic) IBOutlet UILabel *statusLabel1;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel2;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel3;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel4;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel5;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel6;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
-(IBAction)back:(id)sender;
-(IBAction)submit:(id)sender;
-(IBAction)dismiss:(id)sender;
-(IBAction)dismissKeyboardOnTap:(id)sender;
-(IBAction)home:(id)sender;
- (IBAction)btnback:(id)sender;
@property(nonatomic,retain)IBOutlet UIScrollView *thescrollview;



@property (weak, nonatomic) IBOutlet UIButton *sub;



@property(nonatomic,strong)IBOutlet UILabel *name;
@property(nonatomic,strong)IBOutlet UILabel *mail;
@property(nonatomic,strong)IBOutlet UILabel *mob;
@property(nonatomic,strong)IBOutlet UISwitch *showbtn;
@property(nonatomic,strong)IBOutlet UITextField *fileld1;
@property(nonatomic,strong)IBOutlet UITextField *field2;
@property(nonatomic,strong)IBOutlet UITextField *field3;

-(IBAction)switchact:(id)sender;






@end
