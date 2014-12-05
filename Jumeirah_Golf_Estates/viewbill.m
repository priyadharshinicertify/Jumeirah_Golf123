//
//  viewbill.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 15/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "viewbill.h"
#import "BackgroundLayer.h"
@interface viewbill ()

@end

@implementation viewbill
@synthesize arraypay,cus_id,detail,dueamt,duedate,inoiceamnt,invoicedate,invoiceno,revenue,propcode,scroll;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];

    
    CGFloat borderWidth = 1.0f;
    
    self.ss1.frame = CGRectInset(self.ss1.frame, -borderWidth, -borderWidth);
    self.ss1.layer.borderColor = [UIColor blackColor].CGColor;
    self.ss1.layer.borderWidth = borderWidth;
    
    self.ss1.layer.cornerRadius=3;
    
    
     manage=[singleton share];
    arraypay=manage.payarray;
    cus_id.text=manage.b_id;
    detail.text=manage.b_details;
    dueamt.text=[NSString stringWithFormat:@"%@",manage.b_dueamt];
   
    inoiceamnt.text=[NSString stringWithFormat:@"%@",manage.b_invoiceamt];
    
    NSLog(@"%@",manage.b_duedate);
    
    NSString *actDate = manage.b_duedate;
    NSString *nDate = [[[[actDate componentsSeparatedByString:@"("] objectAtIndex:1] componentsSeparatedByString:@")"] objectAtIndex:0];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:([nDate doubleValue] / 1000)];
   
    
    invoiceno.text=manage.b_invoiceno;
    revenue.text=manage.b_revenuhead;
    propcode.text=manage.b_propertycode;
    NSDateFormatter *dtfrm = [[NSDateFormatter alloc] init];
    [dtfrm setDateFormat:@"MM/dd/yyyy"];
    nDate = [dtfrm stringFromDate:date];
     NSLog(@"heloooooo.......%@",date);
    scroll.scrollEnabled=YES;
    scroll.contentSize=CGSizeMake(287,950);
     duedate.text= [NSString stringWithFormat:@"%@",date];
    
    
    
     NSString *actDate1 = manage.b_invocedt;
    NSString *nDate1 = [[[[actDate1 componentsSeparatedByString:@"("] objectAtIndex:1] componentsSeparatedByString:@")"] objectAtIndex:0];
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:([nDate1 doubleValue] / 1000)];
    NSDateFormatter *dtfrm1 = [[NSDateFormatter alloc] init];
    [dtfrm1 setDateFormat:@"MM/dd/yyyy"];
    nDate1 = [dtfrm1 stringFromDate:date1];
    invoicedate.text=[NSString stringWithFormat:@"%@",date1];
    
    //(self.itemshowdetailsAr)[indexPath.row][@"RevenuHead"]
    
  //  cus_id.text=(self.arraypay)[indexPath.row][@"RevenuHead"];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pay:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Coming Soon!"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    
    
}
-(IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
