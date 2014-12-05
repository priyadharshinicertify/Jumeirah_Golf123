//
//  viewtransaction.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 30/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
@interface viewtransaction : GAITrackedViewController
{
    singleton *manage;
}
@property (strong, nonatomic) IBOutlet UILabel *Receipt_detail;
@property (strong, nonatomic) IBOutlet UITextField *Receipt_amt;
@property(strong,nonatomic) NSMutableArray *arraypay;

- (IBAction)pay:(id)sender;


-(IBAction)back:(id)sender;
@property(nonatomic,strong)IBOutlet UIView *sample;

@property(nonatomic,strong)IBOutlet UIView *ss1;


@property (strong, nonatomic) IBOutlet UITextField *Receipt_no;

@property(strong,nonatomic)IBOutlet UIScrollView *scroll;

@property (strong, nonatomic) IBOutlet UITextField *inoiceamnt;

@property (strong, nonatomic) IBOutlet UITextField *Receipt_date;

@property (strong, nonatomic) IBOutlet UITextField *invoicedate;

@property (strong, nonatomic) IBOutlet UITextField *adjustamt;

@property (strong, nonatomic) IBOutlet UITextField *invoiceno;
@property (strong, nonatomic) IBOutlet UITextField *propcode;

@property (strong, nonatomic) IBOutlet UILabel *invoice_details;
@end
