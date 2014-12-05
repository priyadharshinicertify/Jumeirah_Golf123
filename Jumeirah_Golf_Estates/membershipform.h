//
//  membershipform.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 11/10/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "calender.h"
#import "singleton.h"
#import "web_letter.h"
@interface membershipform : UIViewController<UIPopoverControllerDelegate,calenderpickerview,UIScrollViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextViewDelegate>
{
      UIView *popview;
    BOOL exist_mem;
    BOOL new_mem;
    BOOL founder;
    BOOL home_own;
     NSMutableData *receivedData;
    BOOL debenture;
    BOOL annual;
    BOOL family;
    BOOL mid_week;
    BOOL gold;
    BOOL silver;
    CGFloat animatedDistance;

    BOOL over;
    singleton *manage;
    NSString *jsonArray;

    
    
}
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@property(strong,nonatomic)IBOutlet UIView *view1;
@property(strong,nonatomic)IBOutlet UIView *view2;
@property(strong,nonatomic)IBOutlet UIView *view3;
@property(strong,nonatomic)IBOutlet UIView *view4;

@property (strong, nonatomic) UIDatePicker *picker1;
@property (strong, nonatomic) UIDatePicker *picker2;

@property(strong,nonatomic)IBOutlet UIButton *v1_pre;

@property(strong,nonatomic)IBOutlet UIButton *v1_next;
@property(strong,nonatomic)IBOutlet UIButton *v2_pre;

@property(strong,nonatomic)IBOutlet UIButton *v2_next;
@property(strong,nonatomic)IBOutlet UIButton *v3_pre;

@property(strong,nonatomic)IBOutlet UIButton *v3_next;
@property(strong,nonatomic)IBOutlet UIButton *v4_pre;

@property (nonatomic, strong) UIPopoverController *userDataPopover;

-(IBAction)View1action_Prev:(id)sender;
-(IBAction)View1action_Next:(id)sender;
-(IBAction)View2action_Prev:(id)sender;
-(IBAction)View2action_Next:(id)sender;
-(IBAction)View3action_Prev:(id)sender;
-(IBAction)View3action_Next:(id)sender;

-(IBAction)View4action_Prev:(id)sender;
-(IBAction)back:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *mem_no;
@property (strong, nonatomic) IBOutlet UILabel *junilename;
@property (strong, nonatomic) IBOutlet UITextField *juniletext;
@property (strong, nonatomic) IBOutlet UITextField *junileplayingtxt;
@property (strong, nonatomic) IBOutlet UILabel *juniledob;




@property (strong, nonatomic) IBOutlet UITextField *juniledobtxt;



@property (strong, nonatomic) IBOutlet UILabel *juneliplaying;

@property (strong, nonatomic) IBOutlet UIButton *btn_Exist;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Exist;
- (IBAction)btn_Exist_action:(id)sender;



@property (strong, nonatomic) IBOutlet UIButton *btn_Mem_new;


- (IBAction)btn_Mem_new_action:(id)sender;

/***********complted*******/

@property (strong, nonatomic) IBOutlet UIButton *btn_Founf_mem;

- (IBAction)btn_Founf_mem_action:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_Ownermem;

- (IBAction)btn_Ownermem_action:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_Debenmem;

- (IBAction)btn_Debenmem_action:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_Annualmem;

- (IBAction)btn_Annualmem_action:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_Familmem;

- (IBAction)btn_Familmem_action:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_Midmem;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
- (IBAction)btn_Midmem_action:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_Corpgold;

- (IBAction)btn_Corpgold_action:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btn_Corpsilver;

- (IBAction)btn_Corpsilver_action:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_Oversea;

- (IBAction)btn_Oversea_action:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *txt_Family;

@property (strong, nonatomic) IBOutlet UITextField *txt_Given;

@property (strong, nonatomic) IBOutlet UITextField *txt_DOB;

@property (strong, nonatomic) IBOutlet UITextField *txt_Playing;

@property (strong, nonatomic) IBOutlet UITextField *txt_Company;

@property (strong, nonatomic) IBOutlet UITextField *txt_Mobile;

@property (strong, nonatomic) IBOutlet UITextField *txt_Email;

@property (strong, nonatomic) IBOutlet UITextField *txt_National;

@property (strong, nonatomic) IBOutlet UITextView *txt_Address;




@property (strong, nonatomic) IBOutlet UISegmentedControl *Menu_Tab;

- (IBAction)Menu_Tab_action:(id)sender;


@property (strong, nonatomic) IBOutlet UILabel *junior2;

@property (strong, nonatomic) IBOutlet UITextField *junior2text;

@property (strong, nonatomic) IBOutlet UILabel *junior_han_lbl;

@property (strong, nonatomic) IBOutlet UITextField *junior_han_txt;


@property (strong, nonatomic) IBOutlet UILabel *junior_dob_lbl;


@property (strong, nonatomic) IBOutlet UITextField *junior_dob_txt;









@property (strong, nonatomic) IBOutlet UIView *Inter_1;

@property (strong, nonatomic) IBOutlet UITextField *txt_SpouceN;

@property (strong, nonatomic) IBOutlet UITextField *txt_Given1;

@property (strong, nonatomic) IBOutlet UITextField *txt_DOB1;

@property (strong, nonatomic) IBOutlet UITextField *txt_Playing1;

@property (strong, nonatomic) IBOutlet UITextField *txt_Company1;

@property (strong, nonatomic) IBOutlet UIView *inter_2;
@property (strong, nonatomic) IBOutlet UITextField *txt_Junior;

@property (strong, nonatomic) IBOutlet UITextField *txt_Playing2;

@property (strong, nonatomic) IBOutlet UITextField *txt_DOB2;

@property (strong, nonatomic) IBOutlet UILabel *lbl_Addjun;

@property (strong, nonatomic) IBOutlet UIButton *btn_Addjunr;

@property (strong, nonatomic) IBOutlet UIButton  *ju1;
@property (strong, nonatomic) IBOutlet UIButton *ju2;
@property (strong, nonatomic) IBOutlet UIButton  *jr1;
@property (strong, nonatomic) IBOutlet UIButton  *jr2;
@property (strong, nonatomic) IBOutlet UIImageView *ju3;

@property (strong, nonatomic) IBOutlet UIImageView *jr3;








- (IBAction)btn_Addjunr_action:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *inter_3;

@property (strong, nonatomic) IBOutlet UITextField *txt_Juvenile;

@property (strong, nonatomic) IBOutlet UITextField *txt_Playing3;
@property (strong, nonatomic) IBOutlet UITextField *txt_DOB3;

@property (strong, nonatomic) IBOutlet UILabel *lbl_Addjuven;
@property (strong, nonatomic) IBOutlet UIButton *btn_Addjuven;

- (IBAction)btn_Addjuven_action:(id)sender;
@property(strong,nonatomic)IBOutlet UIButton *btn_pdf;
- (IBAction)btn_pdf_action:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_Cash;

- (IBAction)btn_Cash_action:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_Cheque;

- (IBAction)btn_Cheque_action:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn_Electroinc;

- (IBAction)btn_Electroinc_action:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_Credit;

- (IBAction)btn_Credit_action:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btn_ManualCred;


- (IBAction)btn_ManualCred_action:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *txt_Sign;

@property (strong, nonatomic) IBOutlet UITextField *txt_Date;


@property (strong, nonatomic) IBOutlet UIButton *btn_Submit;
- (IBAction)btn_Submit_action:(id)sender;

@property(nonatomic,strong)IBOutlet UIView *sample;
- (IBAction)membtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *mmembtno;


@property (strong, nonatomic) IBOutlet UIButton *spouseck;

- (IBAction)spouseck_action:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *juniorck;
- (IBAction)juniorck_action:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *junenileck;
- (IBAction)junenileck_action:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *btn2_spouse;

#pragma mark-booleans variables












@end
