//
//  tranctionhistory.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 16/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
#import "celltransaction.h"
#import "viewbill.h"
#import "viewtransaction.h"
@interface tranctionhistory : GAITrackedViewController<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    singleton *manage;
    
    
}
@property(nonatomic,strong)IBOutlet UIView *sample;
@property (strong, nonatomic) IBOutlet UIButton *btnall;
@property (strong, nonatomic) IBOutlet UIButton *btngeneral;
@property (nonatomic,weak) IBOutlet UISegmentedControl *segmentedControl;

-(IBAction) segmentedControlIndexChanged;

@property (nonatomic, retain) UIPickerView *pickerView1;


@property (strong, nonatomic) IBOutlet UIButton *btnreserve;
- (IBAction)all:(id)sender;

- (IBAction)bill:(id)sender;
- (IBAction)invoice:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *view1;

@property (strong, nonatomic) IBOutlet UIView *view2;
@property (strong, nonatomic) IBOutlet UIView *view3;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr1;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr2;


@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr3;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr4;
@property (nonatomic, strong) NSArray *arrAgeRanges;

@property (strong, nonatomic) IBOutlet UITextField *propertycode;


@property (strong, nonatomic) IBOutlet UITableView *table1;
@property (strong, nonatomic) IBOutlet UITableView *table2;
@property (strong, nonatomic) IBOutlet UITableView *table3;


@property (strong, nonatomic) IBOutlet UILabel *lbl;


- (IBAction)back:(id)sender;




@end
