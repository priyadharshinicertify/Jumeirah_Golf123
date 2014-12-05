//
//  LoginViewController.h
//  Jumeirah
//
//  Created by $ h i v a on 26/05/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "LoginViewController.h"
#import "singleton.h"
#import "forgetpass.h"

@interface LoginViewController : GAITrackedViewController<UITextFieldDelegate>
{
    NSURLConnection *Login_Connection;
    NSMutableData *Login_ResponseData;
    BOOL checked;
    singleton *manage;
    CGFloat animatedDistance;
    
}
@property(nonatomic,retain) IBOutlet UITextField *UserText;
@property(nonatomic,retain) IBOutlet UITextField *PasswdText;
@property(nonatomic,retain) IBOutlet UILabel *legand;
@property(nonatomic,retain) IBOutlet UILabel *remember;
@property(nonatomic,retain) IBOutlet UIButton *btnn1;
@property(nonatomic,retain)IBOutlet UIButton *Btnn;
@property (weak, nonatomic) IBOutlet UIButton *checkBoxButton;
@property (weak, nonatomic) IBOutlet UIView *login_view;

@property(nonatomic,strong)IBOutlet UIView *sample;
-(IBAction)submitBtn:(id)sender;
-(IBAction)backBtn:(id)sender;
-(IBAction)forget:(id)sender;
-(IBAction)home:(id)sender;
-(IBAction)checkButton:(id)sender;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr1;
@end
