//
//  brifejob.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 15/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "brifejob.h"
#import "BackgroundLayer.h"
@interface brifejob ()
-(IBAction)hideview1:(id)sender;
@end

@implementation brifejob

@synthesize ref_no,job_post_date,job_tit,des,last_date_app,edu_quali,exp,who_app,Details_product_ScrollView,lbl,loginview,loginview_acc,mail,password,forget_mail,forgetview;
@synthesize firstname,lan,lastname,username,password1,country,mob_no,major,ddMenu,ddMenuShowButton,ddText,date_birth,nationality,add,driving_license,highest_qualification,quali_area,exp_sal,exp_years,summary,Details_product_ScrollView1,carregister,imageView123,choosePhotoBtn,itemshowdetailsAr,viewsub1,viewsub2,viewsuper,btn1,btn17,btn18,btn2,btn27,btn28,btn3,btn37,btn38,btn4,btn48,btn7;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"brief_jobspot Screen";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.lbl.bounds;
    //btnGradient1.cornerRadius=5;
    //btnGradient1.borderWidth=1.0;
    //btnGradient1.borderColor=([UIColor whiteColor]).CGColor;
    [self.lbl.layer insertSublayer:btnGradient1 atIndex:0];
    
    
    
    
    CAGradientLayer *btnGradient3 = [BackgroundLayer blackWhiteGradient];
    btnGradient3.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient3 atIndex:0];
    
    
    
    
    
    
    
    
    
    CAGradientLayer *btnGradient2 = [BackgroundLayer blackWhiteGradient];
    btnGradient2.frame = self.lbl1.bounds;
    btnGradient2.cornerRadius=5;
    btnGradient2.borderWidth=1.0;
    btnGradient2.borderColor=([UIColor whiteColor]).CGColor;
    [self.lbl1.layer insertSublayer:btnGradient2 atIndex:0];
    
    Details_product_ScrollView.scrollEnabled=YES;
   
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        Details_product_ScrollView.contentSize=CGSizeMake(320,900);
    }
    else
    {
        
    }

  
    manage=[singleton share];
    ref_no.text=manage.job_reference_number;
    job_tit.text=manage.job_title;
    job_post_date.text=manage.job_postdate;
    des.text=manage.job_description;
    last_date_app.text=manage.job_last_date;
    edu_quali.text=manage.job__educational_qualification;
    exp.text=manage.job_experience;
    who_app.text=manage.job_who_can_apply;
    self.loginview.hidden=YES;
    self.loginview_acc.hidden=YES;
    self.forgetview.hidden=YES;
    self.carregister.hidden=YES;
    //[self.view addSubview:loginview];
    [self.view addSubview:loginview];
    self.ddMenu.hidden = YES;
    
    
    ddText.layer.borderWidth = 1.0f;
    ddText.layer.borderColor = [[UIColor whiteColor] CGColor];
    ddText.layer.cornerRadius = 5;
    ddText.clipsToBounds = YES;
    
    
    ddMenu.layer.borderWidth = 1.0f;
    ddMenu.layer.borderColor = [[UIColor whiteColor] CGColor];
    ddMenu.layer.cornerRadius = 5;
    ddMenu.clipsToBounds = YES;
    
    
    firstname.layer.borderWidth = 1.0f;
    firstname.layer.borderColor = [[UIColor whiteColor] CGColor];
    firstname.layer.cornerRadius = 5;
    firstname.clipsToBounds = YES;
    
    lastname.layer.borderWidth = 1.0f;
    lastname.layer.borderColor = [[UIColor whiteColor] CGColor];
    lastname.layer.cornerRadius = 5;
    lastname.clipsToBounds = YES;
    
    date_birth.layer.borderWidth = 1.0f;
    date_birth.layer.borderColor = [[UIColor whiteColor] CGColor];
    date_birth.layer.cornerRadius = 5;
    date_birth.clipsToBounds = YES;
    
    
    username.layer.borderWidth = 1.0f;
    username.layer.borderColor = [[UIColor whiteColor] CGColor];
    username.layer.cornerRadius = 5;
    username.clipsToBounds = YES;
    
    password.layer.borderWidth = 1.0f;
    password.layer.borderColor = [[UIColor whiteColor] CGColor];
    password.layer.cornerRadius = 5;
    password.clipsToBounds = YES;
    
    country.layer.borderWidth = 1.0f;
    country.layer.borderColor = [[UIColor whiteColor] CGColor];
    country.layer.cornerRadius = 5;
    country.clipsToBounds = YES;
    
    lan.layer.borderWidth = 1.0f;
    lan.layer.borderColor = [[UIColor whiteColor] CGColor];
    lan.layer.cornerRadius = 5;
    lan.clipsToBounds = YES;
    
    
    nationality.layer.borderWidth = 1.0f;
    nationality.layer.borderColor = [[UIColor whiteColor] CGColor];
    nationality.layer.cornerRadius = 5;
    nationality.clipsToBounds = YES;
    
    
    mob_no.layer.borderWidth = 1.0f;
    mob_no.layer.borderColor = [[UIColor whiteColor] CGColor];
    mob_no.layer.cornerRadius = 5;
    mob_no.clipsToBounds = YES;
    
    
    highest_qualification.layer.borderWidth = 1.0f;
    highest_qualification.layer.borderColor = [[UIColor whiteColor] CGColor];
    highest_qualification.layer.cornerRadius = 5;
    highest_qualification.clipsToBounds = YES;
    
    
    mail.layer.borderWidth = 1.0f;
    mail.layer.borderColor = [[UIColor whiteColor] CGColor];
    mail.layer.cornerRadius = 5;
    mail.clipsToBounds = YES;
    
    exp_sal.layer.borderWidth = 1.0f;
    exp_sal.layer.borderColor = [[UIColor whiteColor] CGColor];
    exp_sal.layer.cornerRadius = 5;
    exp_sal.clipsToBounds = YES;
    
    
    exp_years.layer.borderWidth = 1.0f;
    exp_years.layer.borderColor = [[UIColor whiteColor] CGColor];
    exp_years.layer.cornerRadius = 5;
    exp_years.clipsToBounds = YES;
    
    
    quali_area.layer.borderWidth = 1.0f;
    quali_area.layer.borderColor = [[UIColor whiteColor] CGColor];
    quali_area.layer.cornerRadius = 5;
    quali_area.clipsToBounds = YES;
    
    
    driving_license.layer.borderWidth = 1.0f;
    driving_license.layer.borderColor = [[UIColor whiteColor] CGColor];
    driving_license.layer.cornerRadius = 5;
    driving_license.clipsToBounds = YES;
    
    add.layer.borderWidth = 1.0f;
    add.layer.borderColor = [[UIColor whiteColor] CGColor];
    add.layer.cornerRadius = 5;
    add.clipsToBounds = YES;
    
    summary.layer.borderWidth = 1.0f;
    summary.layer.borderColor = [[UIColor whiteColor] CGColor];
    summary.layer.cornerRadius = 5;
    summary.clipsToBounds = YES;
    
    
    loginview.layer.borderWidth = 1.0f;
    loginview.layer.borderColor = [[UIColor whiteColor] CGColor];
    loginview.layer.cornerRadius = 5;
    loginview.clipsToBounds = YES;
    
    
    
    
    
    
    
    
    CAGradientLayer *btnGradient = [BackgroundLayer blackWhiteGradient];
    btnGradient.frame = self.sub.bounds;
    btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sub.layer insertSublayer:btnGradient atIndex:0];
    
    
    
    
    
    
    
     CAGradientLayer *btnGradient13 = [BackgroundLayer blackWhiteGradient];
    btnGradient13.frame = self.btn1.bounds;
    btnGradient13.cornerRadius=5;
    btnGradient13.borderWidth=1.0;
    btnGradient13.borderColor=([UIColor whiteColor]).CGColor;
    [self.btn1.layer insertSublayer:btnGradient13 atIndex:0];
    
    btnGradient.frame = self.btn2.bounds;
    btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.btn2.layer insertSublayer:btnGradient atIndex:0];
    
    
    
    
    CAGradientLayer *btnGradienta = [BackgroundLayer blackWhiteGradient];
    btnGradienta.frame = self.btn3.bounds;
    btnGradienta.cornerRadius=5;
    btnGradienta.borderWidth=1.0;
    btnGradienta.borderColor=([UIColor whiteColor]).CGColor;
    [self.btn3.layer insertSublayer:btnGradienta atIndex:0];
    
    
    
    
     CAGradientLayer *btnGradientb = [BackgroundLayer blackWhiteGradient];
    btnGradientb.frame = self.btn4.bounds;
    btnGradientb.cornerRadius=5;
    btnGradientb.borderWidth=1.0;
    btnGradientb.borderColor=([UIColor whiteColor]).CGColor;
    [self.btn4.layer insertSublayer:btnGradientb atIndex:0];
    
    
    
    
     CAGradientLayer *btnGradientc = [BackgroundLayer blackWhiteGradient];
    btnGradientc.frame = self.btn18.bounds;
    btnGradientc.cornerRadius=5;
    btnGradientc.borderWidth=1.0;
    btnGradientc.borderColor=([UIColor whiteColor]).CGColor;
    [self.btn18.layer insertSublayer:btnGradientc atIndex:0];

    
    CAGradientLayer *btnGradientd = [BackgroundLayer blackWhiteGradient];

    btnGradientd.frame = self.btn17.bounds;
    btnGradientd.cornerRadius=5;
    btnGradientd.borderWidth=1.0;
    btnGradientd.borderColor=([UIColor whiteColor]).CGColor;
    [self.btn17.layer insertSublayer:btnGradientd atIndex:0];

    
    btnGradient.frame = self.btn28.bounds;
    btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.btn28.layer insertSublayer:btnGradient atIndex:0];

    
    
    btnGradient.frame = self.btn38.bounds;
    btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.btn38.layer insertSublayer:btnGradient atIndex:0];

    
    
    btnGradient.frame = self.btn27.bounds;
    btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.btn27.layer insertSublayer:btnGradient atIndex:0];

    
    
    btnGradient.frame = self.btn7.bounds;
    btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.btn7.layer insertSublayer:btnGradient atIndex:0];

    
    
    btnGradient.frame = self.btn48.bounds;
    btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.btn48.layer insertSublayer:btnGradient atIndex:0];

    
    btnGradient.frame = self.btn37.bounds;
    btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.btn37.layer insertSublayer:btnGradient atIndex:0];

    
    
    viewsuper.hidden=YES;
    viewsub1.hidden=YES;
    viewsub2.hidden=YES;
    
    // [self.view addsubview:car_register];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)job_apply:(id)sender
{
    
    /*
    if(viewsuper.hidden==YES)
    {
        viewsuper.hidden=NO;
        viewsub1.hidden=NO;
        viewsub2.hidden=YES;
    }
     */
    
  UIAlertView *jobseeker=  [[UIAlertView alloc]initWithTitle:@"JobSeeker Login" message:@"" delegate:self cancelButtonTitle:@"Create new"  otherButtonTitles:@"Existing account", @"Cancel", nil];
    
    jobseeker.tag=999;
    [jobseeker show];
    
    
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==999) {
        if (buttonIndex==0) {
            NSLog(@"neew");
            [self create_acc:nil];
        }
        else  if (buttonIndex==1)
        {
             NSLog(@"exist");
            
            UIAlertView *jobseeker=  [[UIAlertView alloc]initWithTitle:@"JobSeeker Login" message:nil delegate:self cancelButtonTitle:@"Apply" otherButtonTitles:@"Cancel", nil];
            jobseeker.alertViewStyle=UIAlertViewStyleLoginAndPasswordInput;
            [[jobseeker textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeEmailAddress];
            
            jobseeker.tag=199;
            [jobseeker show];
            
        }
        else
        {
            
        }
    }
    
    if (alertView.tag==199) {
        if (buttonIndex==0) {
            NSLog(@"apply");
            
            
            usernamee = [alertView textFieldAtIndex:0];
            passworde=[alertView textFieldAtIndex:1];
                        
            
            NSString *post =[[NSString alloc] initWithFormat:@"email=%@&password=%@",usernamee.text,passworde.text];
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            NSLog(@"postData.....%@", post);
            
            
            NSString *URL = [NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/job_apply.php	"];
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
            [request setHTTPMethod:@"POST"];
            
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
            NSError *err;
            NSURLResponse *response;
            NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
            NSLog(@"%@",responseData);
            @try {
                NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error: &err];
                NSLog(@"%@",jsonArray1);
                
                NSString *jsonArray=jsonArray1[@"error_message"];
                if([jsonArray isEqualToString:@" Applied Sucessfully"])
                {
                    loginview_acc.hidden=YES;
                }
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:jsonArray  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
            @catch (NSException *exception) {
                NSLog(@"Exception: %@", exception);
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Network Failed!"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }

            
            
       
            
        }
        else
        {
            NSLog(@"exist");
           
            
        }
    }

}



-(IBAction)hideview:(id)sender
{
    if(viewsuper.hidden==NO)
    {
        viewsuper.hidden=YES;
        //Details_product_ScrollView.hidden=NO;
    }
    
}


-(IBAction)hideview1:(id)sender
{
    if(viewsuper.hidden==NO)
    {
        viewsuper.hidden=YES;
        //Details_product_ScrollView.hidden=NO;
    }
    
}
-(IBAction)log_acc:(id)sender
{
    if(viewsub2.hidden==YES)
    {
        viewsub2.hidden=NO;
        viewsub1.hidden=YES;
    }
    
}
-(IBAction)apply_login:(id)sender
{
    
    /*
    NSString *post =[[NSString alloc] initWithFormat:@"email=%@&password=%@",mail.text,password.text];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSLog(@"postData.....%@", post);
    
    
    NSString *URL = [NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/job_apply.php	"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
    [request setHTTPMethod:@"POST"];
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSError *err;
    NSURLResponse *response;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSLog(@"%@",responseData);
    @try {
        NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error: &err];
        NSLog(@"%@",jsonArray1);
        
        NSString *jsonArray=jsonArray1[@"error_message"];
        if([jsonArray isEqualToString:@" Applied Sucessfully"])
        {
            loginview_acc.hidden=YES;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:jsonArray  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Network Failed!"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    */
    
}
-(IBAction)cancel_login:(id)sender
{
    if(loginview_acc.hidden==NO)
    {
        loginview_acc.hidden=YES;
    }
}
-(IBAction)resignkeybaod:(id)sender
{
    
}
-(IBAction)cancel_forget:(id)sender
{
    if (forgetview.hidden==NO) {
        forgetview.hidden=YES;
    }
}
-(IBAction)apply_forget:(id)sender
{
    NSString *post =[[NSString alloc] initWithFormat:@"email=%@",forget_mail.text];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSLog(@"postData.....%@", post);
    
    
    NSString *URL = [NSString stringWithFormat:@"http://mobileapp.certifytechnologies.com/jumeirah/career_forgetpass.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
    [request setHTTPMethod:@"POST"];
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSError *err;
    NSURLResponse *response;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSLog(@"%@",responseData);
    @try {
        NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error: &err];
        NSLog(@"%@",jsonArray1);
        
        NSString *jsonArray=jsonArray1[@"error_message"];
        //        if([jsonArray isEqualToString:@" Applied Sucessfully"])
        //        {
        //            loginview_acc.hidden=YES;
        //        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:jsonArray  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Network Failed!"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    
}
-(IBAction)forget:(id)sender
{
    if (forgetview.hidden==YES) {
        forgetview.hidden=NO;
        loginview_acc.hidden=YES;
    }
}
-(IBAction)create_acc:(id)sender
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        car_register *login = [[car_register alloc]initWithNibName:@"carregister_iphone" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
    else
    {
        car_register *login = [[car_register alloc]initWithNibName:@"carregister_ipad" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
    
}
-(IBAction)back:(id)sender
{
    
    carregister.hidden=YES;   // [self.navigationController popViewControllerAnimated:YES];
}


-(IBAction)back1:(id)sender
{
    
    /* if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
     {
     vacancy *login = [[vacancy alloc]initWithNibName:@"vacancy_iphone" bundle:nil];
     [self.navigationController pushViewController:login animated:YES];
     }
     else
     {
     vacancy *login = [[vacancy alloc]initWithNibName:@"vacancy_ipad" bundle:nil];
     [self.navigationController pushViewController:login animated:YES];
     }
     */
    [self.navigationController popViewControllerAnimated:YES];
}





-(IBAction)submit:(id)sender
{
    
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    
    if ([mail.text isEqualToString:@""] || mail.text.length==0 || [firstname.text isEqualToString:@""] || firstname.text.length==0 || [mob_no.text isEqualToString:@""] || mob_no.text.length==0 || [lastname.text isEqualToString:@""] || lastname.text.length==0 || [username.text isEqualToString:@""] || username.text.length==0 || [password.text isEqualToString:@""] || password.text.length==0 ||[date_birth.text isEqualToString:@""] || date_birth.text.length==0 ||[nationality.text isEqualToString:@""] || nationality.text.length==0 ||[country.text isEqualToString:@""] || country.text.length==0 ||[lan.text isEqualToString:@""] || lan.text.length==0) {
        
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Fill The All Details" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrt show];
        
    }
    
    //Valid email address
    else if  ([emailTest evaluateWithObject:mail.text] == NO)
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"InValid Email Format!!" message:@"Ener the Correct Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrt show];
    }
    else
    {
        
        NSString *post =[[NSString alloc] initWithFormat:@"first_name=%@&last_name=%@&username=%@&password=%@&gender=%@&date_of_birth=%@&nationality=%@&current_country=%@&current_address=%@&telephone=%@&mobile_no=%@&driving_licence=%@&highest_qualification=%@&major=%@&functional_area=%@&years_of_experience=%@&expected_salary=%@&resume_summary=%@",firstname.text,lastname.text,username.text,password1.text,ddText.text,date_birth.text,nationality.text,country.text,add.text,lan.text,mob_no.text,driving_license.text,highest_qualification.text,major.text,quali_area.text,exp_years.text,exp_sal.text,summary.text];
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSLog(@"postData.....%@", post);
        
        
        NSString *URL = [NSString stringWithFormat:@"http://mobileapp.certifytechnologies.com/jumeirah/career_registration.php"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
        [request setHTTPMethod:@"POST"];
        
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        NSError *err;
        NSURLResponse *response;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
        NSLog(@"%@",responseData);
        @try {
            NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error: &err];
            NSLog(@"%@",jsonArray1);
            
            NSArray *jsonArray=jsonArray1[@"email_id"];
            
            for (NSDictionary *tmp in jsonArray)
            {
                NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
                
                [itemshowdetails setValue:tmp[@"error_message"] forKey:@"error_message"];
                
                
                [self.itemshowdetailsAr addObject:itemshowdetails];
                NSString *js=itemshowdetailsAr[0][@"error_message"];
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:js  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }
        
        @catch (NSException *exception) {
            NSLog(@"Exception: %@", exception);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Network Failed!"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
}
- (IBAction)ddMenuShow:(UIButton *)sender
{
    if (sender.tag == 0) {
        sender.tag = 1;
        self.ddMenu.hidden = NO;
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        sender.tag = 0;
        self.ddMenu.hidden = YES;
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
}
- (IBAction)ddMenuSelectionMade:(UIButton *)sender
{
    self.ddText.text = sender.titleLabel.text;
    [self.ddMenuShowButton setTitle:@"" forState:UIControlStateNormal];
    self.ddMenuShowButton.tag = 0;
    self.ddMenu.hidden = YES;
}











-(IBAction) getPhoto:(id) sender {
    
    /*
     UIImagePickerController * picker = [[UIImagePickerController alloc] init];
     picker.delegate = self;
     
     if((UIButton *) sender == choosePhotoBtn) {
     picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
     } else {
     picker.sourceType = UIImagePickerControllerSourceTypeCamera;
     }
     
     [self presentViewController:picker animated:YES completion:nil];
     */
    /*
     UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
     imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
     imagePickerController.delegate = self;
     [self presentViewController:imagePickerController animated:YES completion:nil];*/
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    
    imageView123.image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    
}





@end
