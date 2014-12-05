//
//  forgetpass.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 15/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "forgetpass.h"
#import "NSString+MD5.h"
#import "BackgroundLayer.h"
@interface forgetpass ()

@end

@implementation forgetpass
@synthesize cus_id,Btnn;
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
    

    
    
    
    
    
    CAGradientLayer *btnGradient = [BackgroundLayer blackWhiteGradient];
    btnGradient.frame = self.Btnn.bounds;
    btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    
    [self.Btnn.layer insertSublayer:btnGradient atIndex:0];
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sub_action:(id)sender {
    
    if ([cus_id.text length]==0) {
       
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Customer ID empty!"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    else
    {
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        spinner.center=self.view.center;
        spinner.color=[UIColor blackColor];
        [self.view addSubview:spinner];
        // self.view.center=spinner;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            
            //back to the main thread for the UI call
            dispatch_async(dispatch_get_main_queue(), ^{
                [spinner startAnimating];
            });
            

        
        NSString *str=@"FV150^766-552!";
        NSString *str2=@"GIL";
        NSString *str3=cus_id.text;
        NSString *str4=[str stringByAppendingString:str3];
        NSString *str5=[str4 stringByAppendingString:str2];
        
        NSString *credentials = [str5 MD5];
        NSString *post =[[NSString alloc] initWithFormat:@"SecureHash=%@&UserID=%@",credentials,cus_id.text];
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSLog(@"postData.....%@", post);
        
        // NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
        NSString *URL = [NSString stringWithFormat:@"https://communitiesuat.jumeirahgolfestates.com/FvOAWebservice/Authentication.asmx/forgotUserPassword"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
        [request setHTTPMethod:@"POST"];
        //[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        //[request setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        NSError *err;
        NSURLResponse *response;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
        if (responseData) {
                NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error: &err];
        NSLog(@"%@",jsonArray1);
        NSString *success =  jsonArray1[@"ErrorMessage"] ;
        NSLog(@"%@",success);
         if([success isEqualToString:@""])
         {
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Submitted "
                                                            delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [alert show];
         }
            
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"No Internet Connection"
                                                           delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
            dispatch_async(dispatch_get_main_queue(), ^{
                [spinner stopAnimating];
            });
        });
        
        

        
    }
    
    
}
-(IBAction)home:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
