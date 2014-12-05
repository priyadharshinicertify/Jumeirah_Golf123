//
//  maintanance.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 16/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "maintancepopview.h"
@interface maintanance : GAITrackedViewController<maintancepopviewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
{
    CGFloat animatedDistance;

}
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;

@property (strong, nonatomic) IBOutlet UITextField *districtstext;

@property (strong, nonatomic) IBOutlet UITextField *email;

@property (strong, nonatomic) IBOutlet UITextField *fullname;

@property (strong, nonatomic) IBOutlet UITextField *phonno;

@property (strong, nonatomic) IBOutlet UITextField *villano;

@property (strong, nonatomic) IBOutlet UITextField *issuesummary;
@property (strong, nonatomic) UIPickerView *picker2;

@property (strong, nonatomic) IBOutlet UITextField *viewdetails;


@property (strong, nonatomic) IBOutlet UIButton *submit;

@property (nonatomic, strong) UIPopoverController *userDataPopover;
- (IBAction)sub_action:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *showing;
@property (nonatomic, strong) NSArray *arrAgeRanges;

- (IBAction)back:(id)sender;
@property (nonatomic, strong) IBOutlet UIView *ball;
@property(nonatomic,strong)IBOutlet UIView *sample;
@end
