//
//  LoginViewController.m
//  Jumeirah
//
//  Created by $ h i v a on 26/05/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "LoginViewController.h"
#import "fav.h"
#import <QuartzCore/QuartzCore.h>
#import "BackgroundLayer.h"
#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@interface LoginViewController ()
-(IBAction)btt:(id)sender;
@end

@implementation LoginViewController

@synthesize UserText,PasswdText,Btnn,legand,btnn1,remember,checkBoxButton,login_view,itemshowdetailsAr,itemshowdetailsAr1;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)backBtn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
//static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
//static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
//static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fontstyle];
    [self checkbox];
    manage=[singleton share];
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
   
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    
  }

# pragma Mark- storing username and password
-(void)checkbox
{
    
    
    
    NSString *checkcond= [[NSUserDefaults standardUserDefaults]stringForKey:@"checked"];
    NSString *cc=[[NSUserDefaults standardUserDefaults]stringForKey:@"username"];
    
    if ([checkcond isEqualToString:@"YES"])
    {
        if (!cc.length==0) {
            UserText.text=[[NSUserDefaults standardUserDefaults]stringForKey:@"username"];
            PasswdText.text=[[NSUserDefaults standardUserDefaults]stringForKey:@"Password"];
            [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"checkbox-checked.png"]
                                      forState:UIControlStateNormal];
            [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"c_box.png"]
                                      forState:UIControlStateSelected];

        }
        else
        {
            checked = 0;
            
            
            [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"c_box.png"]
                                      forState:UIControlStateNormal];
            [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"checkbox-checked.png"]
                                      forState:UIControlStateSelected];
        }
        
        
    }
    else
    {
        checked = 0;
        
        
        [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"c_box.png"]
                                  forState:UIControlStateNormal];
        [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"checkbox-checked.png"]
                                  forState:UIControlStateSelected];
     //   [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"checkbox-pressed.png"]
                                  //forState:UIControlStateHighlighted];
       // checkBoxButton.adjustsImageWhenHighlighted=YES;

        
    }
    
    
}

#pragma Mark - font style for labels and buttons
-(void)fontstyle
{
    checkBoxButton.contentMode = UIViewContentModeScaleToFill;
  
    
    
    CAGradientLayer *btnGradient = [BackgroundLayer blackWhiteGradient];
    btnGradient.frame = self.Btnn.bounds;
    btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    
    [self.Btnn.layer insertSublayer:btnGradient atIndex:0];
   // [self submitButtontapped];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)home:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)submitButtontapped {
    // do the next thing
}

# pragma login validation

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UserText resignFirstResponder];
    [PasswdText resignFirstResponder];
}


-(IBAction)submitBtn:(id)sender
{
    @try {
       
        if ([UserText.text length]==0)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"please enter username"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        else if ([PasswdText.text length]==0)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"please enter password"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        
        else if([UserText.text length]!=0||[PasswdText.text length]!=0)
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

            
                

            // NSLog(@"login_Dictionary.....%@", login_Dictionary);
            
            NSString *str=@"FV150^766-552!";
            NSString *str2=@"GIL";
            NSString *str3=UserText.text;
            NSString *str4=[str stringByAppendingString:str3];
            NSString *str5=[str4 stringByAppendingString:str2];
            
            NSString *credentials = [str5 MD5];
            NSString *post =[[NSString alloc] initWithFormat:@"SecureHash=%@&UserID=%@&Password=%@",credentials,UserText.text,PasswdText.text];
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            NSLog(@"postData.....%@", post);
            
            // NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
            
            NSString *URL = [NSString stringWithFormat:@"https://communitiesuat.jumeirahgolfestates.com/FvOAWebservice/Authentication.asmx/authenticateUser"];
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
            [request setHTTPMethod:@"POST"];
            //[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            //[request setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            NSError *err;
            NSURLResponse *response;
            NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
                if (responseData!=NULL) {
                    
               
                
                
            NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error: &err];
            NSLog(@"%@",jsonArray1);
            NSString *success =  jsonArray1[@"ErrorMessage"] ;
            NSLog(@"%@",success);
            
                       NSArray *jsonArray=jsonArray1[@"CustomerDetail"];
            
            if ([jsonArray count]==0) {
                   dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:success  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                       [spinner stopAnimating];
                   });


            }
            
            else
            {
                
                itemshowdetailsAr=[[NSMutableArray alloc]init];
                itemshowdetailsAr1=[[NSMutableArray alloc]init];
            
             NSLog(@"logggggg......%@",[[jsonArray objectAtIndex:0] objectForKey:@"Customer_ID"]);
            NSLog(@"arrrrrr %@",jsonArray);
           
            for (NSDictionary *tmp in jsonArray)
            {
                NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
                
                [itemshowdetails setValue:tmp[@"Customer_ID"] forKey:@"Customer_ID"];
                [itemshowdetails setValue:tmp[@"Customer_Name"] forKey:@"Customer_Name"];
                //  [itemshowdetails setValue:[tmp objectForKey:@"id"] forKey:@"id"];
                [itemshowdetails setValue:tmp[@"Property_Code"] forKey:@"Property_Code"];
                // [itemshowdetails setValue:[tmp objectForKey:@"content"] forKey:@"content"];
               // [itemshowdetails setValue:tmp[@"news_title"] forKey:@"news_title"];
                
                [self.itemshowdetailsAr addObject:itemshowdetails];
                NSLog(@"%@",itemshowdetails);
            }

              NSLog(@"arrrr....%@",self.itemshowdetailsAr);
                
                for (NSDictionary *tmp in itemshowdetailsAr)
                {
                    NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
                    
                    [itemshowdetails setValue:tmp[@"Property_Code"] forKey:@"Property_Code"];
                     [self.itemshowdetailsAr1 addObject:itemshowdetails];
                    
                }

                NSLog(@"arrrr....%@",self.itemshowdetailsAr1);
                
                
                
           // NSString *cus_id=[self.itemshowdetailsAr :@"Customer_ID"];
               
            if ([success isEqualToString:@"" ]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    {
                        fav *home = [[fav alloc]initWithNibName:@"fav_iphone" bundle:nil];
                        [self.navigationController pushViewController:home animated:YES];
                    }
                    else
                    {
                        fav *home = [[fav alloc]initWithNibName:@"fav_ipad" bundle:nil];
                        [self.navigationController pushViewController:home animated:YES];
                    }

                manage.user=UserText.text;
                NSLog(@"username...%@",manage.user);
                manage.userlogin=[[jsonArray objectAtIndex:0] objectForKey:@"Customer_Name"];
                manage.cus_iid=[[jsonArray objectAtIndex:0] objectForKey:@"Customer_ID"];
                manage.cus_property=[[jsonArray objectAtIndex:0] objectForKey:@"Property_Code"];
                    manage.log_property=itemshowdetailsAr1;

                
                    
                    [spinner stopAnimating];
                });

            
            }

            }
              }
                else
                {
                    dispatch_async(dispatch_get_main_queue(), ^{
                       
                        
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Check your internet connection!"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert show];
                        [spinner stopAnimating];
                    });
                    

 
                }
                   
            });

            
          
            
                           
            
            
                 }
       
 
        
    }
    @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Login Failed!"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    
  
    
}

- (IBAction)checkButton:(id)sender {
    
    if (checked == 0)
        
    {
        if ([checkBoxButton.currentBackgroundImage isEqual:[UIImage imageNamed:@"checkbox-checked.png"]]) {
            [checkBoxButton setSelected:NO];
            [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"username"];
            [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"Password"];
            
            [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"c_box.png"]
                                      forState:UIControlStateNormal];

            
            checked = 0;

        }
        else
        {
        [[NSUserDefaults standardUserDefaults]setObject:UserText.text forKey:@"username"];
        [[NSUserDefaults standardUserDefaults]setObject:PasswdText.text forKey:@"Password"];
        [[NSUserDefaults standardUserDefaults]setObject:@"YES" forKey:@"checked"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        [checkBoxButton setSelected:YES];
        checked = 1;
        }
    }
    else
    {
        [checkBoxButton setSelected:NO];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"username"];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"Password"];
        checked = 0;
    }
    
    
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if (connection == Login_Connection)
    {
        [Login_ResponseData setLength: 0];
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (connection == Login_Connection)
    {
        [Login_ResponseData appendData:data];
    }
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if (connection == Login_Connection)
    {
        NSLog(@"ERROR with the Conenction");
    }
}

-(IBAction)back:(id)sender
{
    [UserText resignFirstResponder];
    [PasswdText resignFirstResponder];
    // return YES;
}


/*-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect textFieldRect =
    [self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect =
    [self.view.window convertRect:self.view.bounds fromView:self.view];
    
    CGFloat midline = textFieldRect.origin.y * textFieldRect.size.height;
    CGFloat numerator =
    midline - viewRect.origin.y
    - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =
    (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)
    * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    
    
    animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.login_view setFrame:viewFrame];
    
    [UIView commitAnimations];
}*/

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Login Screen";
}

- (void)textFieldDidEndEditing:(UITextField *)textField

{
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField==UserText) {
        [PasswdText becomeFirstResponder];
        
    }
    else if (textField==PasswdText) {
        [PasswdText resignFirstResponder];
        
    }
    return YES;
}
-(IBAction)btt:(id)sender
{
   }
-(IBAction)forget:(id)sender
{
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        forgetpass *home = [[forgetpass alloc]initWithNibName:@"forgetpass_iphone" bundle:nil];
        [self.navigationController pushViewController:home animated:YES];
    }
    else
    {
        forgetpass *home = [[forgetpass alloc]initWithNibName:@"forgetpass" bundle:nil];
        [self.navigationController pushViewController:home animated:YES];
    }
 
}
@end
