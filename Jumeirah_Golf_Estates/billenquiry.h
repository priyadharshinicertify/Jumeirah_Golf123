//
//  billenquiry.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 13/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
#import "paybillcell.h"
#import "viewbill.h"
#import "LoginViewController.h"
@interface billenquiry : GAITrackedViewController<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    singleton *manage;
}

@property (strong, nonatomic) IBOutlet UITextField *customername;
@property (strong, nonatomic) IBOutlet UITextField *customerid;
@property (strong, nonatomic) IBOutlet UITextField *propertycode;


@property (strong, nonatomic) IBOutlet UIView *showview;


@property (nonatomic, retain) UIPickerView *pickerView1;



@property (strong, nonatomic) IBOutlet UITableView *tablebill;
@property (strong, nonatomic) IBOutlet UILabel *message;
@property (strong, nonatomic) IBOutlet UIButton *logbtn;
- (IBAction)back:(id)sender;
- (IBAction)login:(id)sender;
@property(nonatomic,strong)IBOutlet UIView *sample;



@property (nonatomic, strong) NSArray *arrAgeRanges;




@end
