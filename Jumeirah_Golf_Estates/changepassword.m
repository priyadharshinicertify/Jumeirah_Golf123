//
//  changepassword.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 14/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "changepassword.h"
#import "NSString+MD5.h"
#import "BackgroundLayer.h"


@interface changepassword ()

@end

@implementation changepassword
@synthesize current_pass,retype_pass,passnew,sub;

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
    CAGradientLayer *btnGradient = [BackgroundLayer blackWhiteGradient];
    btnGradient.frame = self.sub.bounds;
    btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    
    [self.sub.layer insertSublayer:btnGradient atIndex:0];
    
    
    
    
    
    
    
    
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

- (IBAction)sub_action:(id)sender {
    
    @try {
        if ([current_pass.text length]==0 && [retype_pass.text length]==0 && [passnew.text length]==0)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Kindly fill all details!"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        else if ([current_pass.text length]==0)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"please enter username"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        else if ([retype_pass.text length]==0)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"please enter password"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        
        else if([current_pass.text length]!=0||[retype_pass.text length]!=0 || [passnew.text length]!=0)
        {
            
            
            // NSLog(@"login_Dictionary.....%@", login_Dictionary);
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
            NSString *str3=manage.user;
            NSString *str4=[str stringByAppendingString:str3];
            NSString *str5=[str4 stringByAppendingString:str2];
            
            NSString *credentials = [str5 MD5];
            NSString *post =[[NSString alloc] initWithFormat:@"SecureHash=%@&UserID=%@&OldPassword=%@&NewPassword=%@",credentials,manage.user,current_pass.text,passnew.text];
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            NSLog(@"postData.....%@", post);
            
            // NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
            
            NSString *URL = [NSString stringWithFormat:@"https://communitiesuat.jumeirahgolfestates.com/FvOAWebservice/Authentication.asmx/changeUserPassword"];
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
            [request setHTTPMethod:@"POST"];
            //[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            //[request setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            NSError *err;
            NSURLResponse *response;
            NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
            
            NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error: &err];
            NSLog(@"%@",jsonArray1);
            NSString *success =  jsonArray1[@"ErrorMessage"] ;
            NSLog(@"%@",success);
            
            NSArray *jsonArray=jsonArray1[@"CustomerDetail"];
            
            manage.userlogin=[[jsonArray objectAtIndex:0] objectForKey:@"Customer_Name"];
            NSLog(@"logggggg......%@",[[jsonArray objectAtIndex:0] objectForKey:@"Customer_ID"]);
            NSLog(@"arrrrrr %@",jsonArray);
           // NSString *success1 =  jsonArray[@"ErrorMessage"] ;
            NSLog(@"%@",success);
            if([success isEqualToString:@""])
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Password changed succesfully "
                                                               delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [spinner stopAnimating];
                });
            });
            
            


           /* for (NSDictionary *tmp in jsonArray)
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
            */
            
            // NSString *cus_id=[self.itemshowdetailsAr :@"Customer_ID"];
            
          /*  if ([success isEqualToString:@""]) {
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
                
            }*/
            
            
            
        }
        
        
        
    }
    @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Login Failed!"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    

    
    
    
    
}
-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    if (textField==current_pass) {
        [passnew  becomeFirstResponder];
    }
    else if(textField==passnew)
    {
        [retype_pass becomeFirstResponder];
    }
    else if(textField==retype_pass)
    {
        [retype_pass resignFirstResponder];
    }
    return YES;
}
-(IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
