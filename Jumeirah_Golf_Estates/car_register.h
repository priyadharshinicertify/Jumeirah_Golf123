//
//  car_register.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 23/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "brief_jobspost.h"
#import "calender.h"
#import "genderview.h"
#import "BackgroundLayer.h"

@interface car_register : GAITrackedViewController<UIScrollViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,calenderpickerview,genderviewDelegate1,UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate>
{
    CGFloat animatedDistance;
    UIPickerView *pickerView;
}
@property(nonatomic,strong)IBOutlet UIView *sample;
@property(strong,nonatomic)IBOutlet UITextField *firstname;
@property(strong,nonatomic)IBOutlet UITextField *lastname;
@property(strong,nonatomic)IBOutlet UITextField *username;
@property(strong,nonatomic)IBOutlet UITextField *password;
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
@property (nonatomic, strong) NSArray *arrAgeRanges;
@property (nonatomic, strong) UIPopoverController *userDataPopover;
@property(nonatomic,strong)IBOutlet UIButton *sub;
@property (nonatomic, strong) IBOutlet UILabel *ddText;
@property (nonatomic, strong) IBOutlet UIView *ddMenu;
@property (nonatomic, strong) IBOutlet UIButton *ddMenuShowButton;
- (IBAction)ddMenuShow:(UIButton *)sender;
- (IBAction)ddMenuSelectionMade:(UIButton *)sender;
@property (strong,nonatomic)IBOutlet UIScrollView *Details_product_ScrollView1;
-(IBAction)selectimg:(id)sender;

-(IBAction)selectimg1:(id)sender;

-(IBAction)selectimg2:(id)sender;

-(IBAction)selectimg3:(id)sender;

-(IBAction)selectimg4:(id)sender;
@property(nonatomic,strong)IBOutlet UITextField *address;

@property(nonatomic,strong)IBOutlet UITextField  *gender;
@property(nonatomic,strong)IBOutlet UITextField  *resumesummary;

@property (strong, nonatomic) UIPickerView *pickerAge;

@property (strong, nonatomic) UIDatePicker *picker1;

@property(nonatomic,strong)IBOutlet UIButton *show1;
@property(nonatomic,strong)IBOutlet UIButton *show2;
@property(nonatomic,strong)IBOutlet UIImageView *imageView;
@property(nonatomic,strong)IBOutlet UIImageView *imageView1;
@property(nonatomic,strong)IBOutlet UIImageView *imageView2;
@property(nonatomic,strong)IBOutlet UIImageView *imageView3;
@property(nonatomic,strong)IBOutlet UIImageView *imageView4;



//@property (nonatomic, strong) NSArray *arrAgeRanges;


@end
