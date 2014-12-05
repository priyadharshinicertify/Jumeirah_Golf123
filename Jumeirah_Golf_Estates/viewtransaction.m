//
//  viewtransaction.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 30/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "viewtransaction.h"
#import "BackgroundLayer.h"
@interface viewtransaction ()

@end

@implementation viewtransaction

@synthesize Receipt_amt,Receipt_date,Receipt_detail,Receipt_no,sample,ss1,adjustamt,inoiceamnt,invoice_details,invoicedate,invoiceno,propcode,scroll;
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
      scroll.scrollEnabled=YES;
    scroll.contentSize=CGSizeMake(287,1200);
    
    Receipt_detail.text=manage.t_receiptdet;
    
    Receipt_amt.text=[NSString stringWithFormat:@"%@",manage.t_receiptamt];
    Receipt_no.text=manage.t_receiptno;
    propcode.text=manage.t_propertycode;
    
    NSString *actDate1 = manage.t_receiptdate;
    NSString *nDate1 = [[[[actDate1 componentsSeparatedByString:@"("] objectAtIndex:1] componentsSeparatedByString:@")"] objectAtIndex:0];
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:([nDate1 doubleValue] / 1000)];
    NSDateFormatter *dtfrm1 = [[NSDateFormatter alloc] init];
    [dtfrm1 setDateFormat:@"MM/dd/yyyy"];
    nDate1 = [dtfrm1 stringFromDate:date1];
      Receipt_date.text=[NSString stringWithFormat:@"%@",date1];
    
  
    invoice_details.text=manage.t_invoicedetail;
    adjustamt.text=[NSString stringWithFormat:@"%@",manage.t_adjustamt];
    
    
    
    
     
    inoiceamnt.text=[NSString stringWithFormat:@"%@",manage.t_ivoiceamt];
    
    invoiceno.text=manage.t_invoiceno;
   // NSLog(@"%@",manage.b_duedate);
    
    
    
    
    NSString *actDate2 = manage.t_invoicedate;
    NSString *nDate2 = [[[[actDate2 componentsSeparatedByString:@"("] objectAtIndex:1] componentsSeparatedByString:@")"] objectAtIndex:0];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:([nDate2 doubleValue] / 1000)];
    NSDateFormatter *dtfrm2 = [[NSDateFormatter alloc] init];
    [dtfrm2 setDateFormat:@"MM/dd/yyyy"];
    nDate1 = [dtfrm2 stringFromDate:date2];
    invoicedate.text=[NSString stringWithFormat:@"%@",date2];
    
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
