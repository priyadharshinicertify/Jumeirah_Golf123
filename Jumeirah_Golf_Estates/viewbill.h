//
//  viewbill.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 15/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
@interface viewbill : GAITrackedViewController
{
    singleton *manage; 
}
@property (strong, nonatomic) IBOutlet UITextField *cus_id;
@property (strong, nonatomic) IBOutlet UITextField *detail;
@property(strong,nonatomic) NSMutableArray *arraypay;

- (IBAction)pay:(id)sender;


-(IBAction)back:(id)sender;
@property(nonatomic,strong)IBOutlet UIView *sample;

@property(nonatomic,strong)IBOutlet UIView *ss1;


@property (strong, nonatomic) IBOutlet UITextField *dueamt;

@property(strong,nonatomic)IBOutlet UIScrollView *scroll;

@property (strong, nonatomic) IBOutlet UITextField *inoiceamnt;

@property (strong, nonatomic) IBOutlet UITextField *revenue;

@property (strong, nonatomic) IBOutlet UITextField *invoicedate;

@property (strong, nonatomic) IBOutlet UITextField *duedate;

@property (strong, nonatomic) IBOutlet UITextField *invoiceno;
@property (strong, nonatomic) IBOutlet UITextField *propcode;

@end
