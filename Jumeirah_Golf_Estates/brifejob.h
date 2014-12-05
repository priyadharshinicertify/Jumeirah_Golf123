//
//  brifejob.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 15/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
#import "vacancy.h"
#import "car_register.h"

@interface brifejob : GAITrackedViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIAlertViewDelegate,UIScrollViewDelegate>
{
    singleton *manage;
    UIButton * choosePhotoBtn;
    NSData *imageData;
    UIImage *imageView;
    NSMutableArray *itemshowdetailsAr;
    UITextField   * usernamee;
    UITextField  *passworde;
}
@property(strong,nonatomic)IBOutlet UILabel *ref_no;
@property(strong,nonatomic)IBOutlet UILabel *job_tit;
@property(strong,nonatomic)IBOutlet UILabel *job_post_date;
@property(strong,nonatomic)IBOutlet UILabel *des;
@property(strong,nonatomic)IBOutlet UILabel *last_date_app;
@property(strong,nonatomic)IBOutlet UILabel *edu_quali;
@property(strong,nonatomic)IBOutlet UILabel *exp;
@property(strong,nonatomic)IBOutlet UILabel *who_app;
@property (strong,nonatomic)IBOutlet UIScrollView *Details_product_ScrollView;
@property(strong,nonatomic)IBOutlet UIButton *lbl1;
@property(strong,nonatomic)IBOutlet UIButton *lbl;
@property(strong,nonatomic)IBOutlet UIView *loginview;
@property(strong,nonatomic)IBOutlet UIView *loginview_acc;
@property(strong,nonatomic)IBOutlet UITextField *mail;
@property(strong,nonatomic)IBOutlet UITextField *password;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;

@property(nonatomic,strong)IBOutlet UIView *sample;

@property(strong,nonatomic)IBOutlet UIView *forgetview;
@property(strong,nonatomic)IBOutlet UITextField *forget_mail;

//-(IBAction)vacancy:(id)sender;
-(IBAction)job_apply:(id)sender;
-(IBAction)hideview:(id)sender;
-(IBAction)log_acc:(id)sender;
-(IBAction)apply_login:(id)sender;
-(IBAction)cancel_login:(id)sender;
-(IBAction)resignkeybaod:(id)sender;
-(IBAction)forget:(id)sender;
-(IBAction)create_acc:(id)sender;
-(IBAction)cancel_forget:(id)sender;
-(IBAction)apply_forget:(id)sender;

@property(strong,nonatomic)IBOutlet UIView *carregister;

@property(strong,nonatomic)IBOutlet UITextField *firstname;
@property(strong,nonatomic)IBOutlet UITextField *lastname;
@property(strong,nonatomic)IBOutlet UITextField *username;
@property(strong,nonatomic)IBOutlet UITextField *password1;
@property(strong,nonatomic)IBOutlet UITextField *date_birth;
@property(strong,nonatomic)IBOutlet UITextField *nationality;
@property(strong,nonatomic)IBOutlet UITextField *country;
@property(strong,nonatomic)IBOutlet UITextField *lan;
@property(strong,nonatomic)IBOutlet UITextField *mob_no;
@property(strong,nonatomic)IBOutlet UITextField *driving_license;
@property(strong,nonatomic)IBOutlet UITextField *highest_qualification;
@property(strong,nonatomic)IBOutlet UITextField *major;
@property(strong,nonatomic)IBOutlet UITextField *quali_area;
@property(strong,nonatomic)IBOutlet UITextField *exp_years;
@property(strong,nonatomic)IBOutlet UITextField *exp_sal;
@property(strong,nonatomic)IBOutlet UITextField *up_pho;
@property(strong,nonatomic)IBOutlet UITextField *up_res;
@property(strong,nonatomic)IBOutlet UITextView *add;
@property(strong,nonatomic)IBOutlet UITextView *summary;
-(IBAction)submit:(id)sender;
@property (strong,nonatomic)IBOutlet UIScrollView *Details_product_ScrollView1;


@property (nonatomic, strong) IBOutlet UILabel *ddText;
@property (nonatomic, strong) IBOutlet UIView *ddMenu;
@property (nonatomic, strong) IBOutlet UIButton *ddMenuShowButton;
- (IBAction)ddMenuShow:(UIButton *)sender;
- (IBAction)ddMenuSelectionMade:(UIButton *)sender;


-(IBAction)back1:(id)sender;



@property (nonatomic, retain) IBOutlet UIImageView * imageView123;
@property (nonatomic, retain) IBOutlet UIButton * choosePhotoBtn;
-(IBAction) getPhoto:(id) sender;


@property(nonatomic,retain)IBOutlet UIButton *sub;


@property(nonatomic,strong)IBOutlet UIButton *btn1;
@property(nonatomic,strong)IBOutlet UIButton *btn2;
@property(nonatomic,strong)IBOutlet UIButton *btn3;
@property(nonatomic,strong)IBOutlet UIButton *btn4;


@property(nonatomic,strong)IBOutlet UIButton *btn18;
@property(nonatomic,strong)IBOutlet UIButton *btn28;
@property(nonatomic,strong)IBOutlet UIButton *btn38;
@property(nonatomic,strong)IBOutlet UIButton *btn48;
@property(nonatomic,strong)IBOutlet UIButton *btn17;
@property(nonatomic,strong)IBOutlet UIButton *btn27;
@property(nonatomic,strong)IBOutlet UIButton *btn37;
@property(nonatomic,strong)IBOutlet UIButton *btn7;





@property(nonatomic,strong)IBOutlet UIView *viewsuper;
@property(nonatomic,strong)IBOutlet UIView *viewsub1;
@property(nonatomic,strong)IBOutlet UIView *viewsub2;




@end
