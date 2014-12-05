//
//  teebooking.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 25/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "TestViewController.h"
#import "memberViewController.h"
#import "players.h"
#import "datepickerview.h"
@interface teebooking : GAITrackedViewController<UITextFieldDelegate,UIScrollViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UIActionSheetDelegate, TestViewControllerDelegate,memberViewControllerDelegate1,playersViewControllerDelegate1,datepickerview>
{
    CGFloat animatedDistance;
     UITextField* activeField;
    UIDatePicker *datepicker;
    UIPopoverController *popOverForDatePicker;

}
@property (nonatomic, strong) IBOutlet UITextField *ddText;
@property (nonatomic, strong) IBOutlet UIView *ddMenu;
@property (nonatomic, strong) IBOutlet UIButton *ddMenuShowButton;
- (IBAction)ddMenuShow:(UIButton *)sender;
- (IBAction)ddMenuSelectionMade:(UIButton *)sender;

@property(nonatomic,strong)IBOutlet UIView *sample;
@property (nonatomic, strong) IBOutlet UITextField *ddText1;
@property (nonatomic, strong) IBOutlet UIView *ddMenu1;

@property (nonatomic, strong) IBOutlet UIView *ball;

@property (nonatomic, strong) IBOutlet UIButton *ddMenuShowButton1;
- (IBAction)ddMenuShow1:(UIButton *)sender;
- (IBAction)ddMenuSelectionMade1:(UIButton *)sender;


@property (nonatomic, strong) IBOutlet UITextField *ddText2;
@property (nonatomic, strong) IBOutlet UIView *ddMenu2;
@property (nonatomic, strong) IBOutlet UIButton *ddMenuShowButton2;
- (IBAction)ddMenuShow2:(UIButton *)sender;
- (IBAction)ddMenuSelectionMade2:(UIButton *)sender;

@property (nonatomic, strong) UIPopoverController *userDataPopover;
@property(strong,nonatomic) IBOutlet UITextField *course;
@property(strong,nonatomic) IBOutlet UITextField *member;
@property(strong,nonatomic) IBOutlet UITextField *player;

@property (nonatomic, retain) NSMutableArray *dataArray;

@property (nonatomic, retain) NSMutableArray *dataArray1;
@property (nonatomic, retain) NSMutableArray *dataArray2;
@property (nonatomic, retain) UIPickerView *pickerView123;

@property (nonatomic, retain) UIPickerView *pickerView1;
@property (nonatomic, retain) UIPickerView *pickerView2;

@property (nonatomic, retain) UIPickerView *membervisitor;
@property (nonatomic, retain) UIPickerView *playerno;



@property (strong, nonatomic) UIDatePicker *picker1;
@property(strong,nonatomic) IBOutlet UITextField *memberid;
@property(strong,nonatomic) IBOutlet  UITextField *firstname;
@property(strong,nonatomic) IBOutlet  UITextField *lastname;
@property(strong,nonatomic) IBOutlet  UITextField *email;
@property(strong,nonatomic) IBOutlet  UITextField *mobilno;
@property(strong,nonatomic) IBOutlet  UITextField *date;
@property (nonatomic, strong) IBOutlet UIButton *topButton;

//@property (strong, nonatomic) IBOutlet UITextField *date1;

@property (nonatomic, strong) IBOutlet UIButton *coursebutton;
@property (nonatomic, strong) IBOutlet UIButton *memberbutton;
@property (nonatomic, strong) IBOutlet UIButton *playerbutton;



@property(strong,nonatomic) IBOutlet UIButton *sub;


-(IBAction)submit:(id)sender;

@property (strong,nonatomic)IBOutlet UIScrollView *Details_product_ScrollView;

//@property(nonatomic,retain)IBOutlet UIDatePicker *datePicker;

-(IBAction)datepic:(id)sender;
- (IBAction)buttonBackMethod:(id)sender;


//@property (strong, nonatomic) UIDatePicker *picker1;

@property (strong, nonatomic) UIPickerView *picker2;
@property (strong, nonatomic) UIPickerView *picker3;
@property (strong, nonatomic) UIPickerView *picker4;

@property (nonatomic, strong) NSArray *arrAgeRanges;
@property (nonatomic, strong) NSArray *arrAgeRanges1;
@property (nonatomic, strong) NSArray *arrAgeRanges2;


@property (nonatomic, strong) NSArray *arrAgeRanges3;


@property (nonatomic, strong) NSArray *visitorarray;
@property (nonatomic, strong) NSArray *playerarray;


@end
