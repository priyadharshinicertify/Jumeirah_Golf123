//
//  settings.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 21/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "settings.h"
#import "BackgroundLayer.h"

@interface settings ()

@end

@implementation settings

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
       manage=[singleton share];
      strr=manage.str1;
      
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)billpayment:(id)sender {
    
    if (self.bill_switch.on)
    {
        //method call
    }
    else
    {
        //Nothing
    }
    
    
}

- (IBAction)general_notifi:(id)sender {
    
    
}
-(IBAction)home:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Settings Screen";
}

- (IBAction)sent:(id)sender {
    BOOL value;
    if (self.general_switch.on)
    {
        
        value=YES;
    }
    else
    {
        value=NO;
    }
        NSString *post =[[NSString alloc] initWithFormat:@"unique_identifier=%@&notification_receive=%i",strr,value];
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSLog(@"postData.....%@", post);
        
        
        NSString *URL = [NSString stringWithFormat:@"http://mobileapp.certifytechnologies.com/jumeirah/notification_receive.php"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
        [request setHTTPMethod:@"POST"];
        
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        NSError *err;
        NSURLResponse *response;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
        NSLog(@"%@",responseData);
        @try {
         //   NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error: &err];
           // NSLog(@"%@",jsonArray1);
            
          //  NSString *jsonArray=jsonArray1[@"error_message"];
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:jsonArray  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//            [alert show];
        }
        @catch (NSException *exception) {
            NSLog(@"Exception: %@", exception);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Network Failed!"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }

        
        NSLog(@"general switch on");
   }

@end
