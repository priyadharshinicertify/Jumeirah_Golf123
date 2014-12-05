//
//  applicationfeedback.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 21/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "applicationfeedback.h"

@interface applicationfeedback ()
{
    NSString *newstring;
}

@end

@implementation applicationfeedback

@synthesize rateview,Infoview,History,notification,perfomance,career,usability;
@synthesize statusLabel,statusLabel1,statusLabel2,statusLabel3,statusLabel4,statusLabel5,statusLabel6,comments,thescrollview,sub,field2,field3,fileld1,name,mail,mob,showbtn;



-(void)history:(History *)history ratingDidChange:(float)rating{
    NSString *str=[NSString stringWithFormat:@"%f", rating];
    if (([str intValue]>0)&&([str intValue]<=1))
    {
        self.statusLabel2.text=@"very bad";
    }
    else
        if (([str intValue]>1)&&([str intValue]<=2))
        {
            self.statusLabel2.text=@"poor";
        }
        else
            if (([str intValue]>2)&&([str intValue]<=3))
            {
                self.statusLabel2.text=@"Fair";
            }
    
            else
                if (([str intValue]>3)&&([str intValue]<=4))
                {
                    self.statusLabel2.text=@"Good";
                }
                else
                    if (([str intValue]>4)&&([str intValue]<=5))
                    {
                        self.statusLabel2.text=@"Excellent";
                    }
    
    
}
-(void)notification:(Notification *)notification ratingDidChange:(float)rating
{
    NSString *str=[NSString stringWithFormat:@"%f", rating];
    if (([str intValue]>0)&&([str intValue]<=1))
    {
        self.statusLabel3.text=@"very bad";
    }
    else
        if (([str intValue]>1)&&([str intValue]<=2))
        {
            self.statusLabel3.text=@"poor";
        }
        else
            if (([str intValue]>2)&&([str intValue]<=3))
            {
                self.statusLabel3.text=@"fair";
            }
    
            else
                if (([str intValue]>3)&&([str intValue]<=4))
                {
                    self.statusLabel3.text=@"Good";
                }
                else
                    if (([str intValue]>4)&&([str intValue]<=5))
                    {
                        self.statusLabel3.text=@"Excellent";
                    }
    
    
}
-(void)perfomance:(Perfomance *)perfomance ratingDidChange:(float)rating
{
    NSString *str=[NSString stringWithFormat:@"%f", rating];
    if (([str intValue]>0)&&([str intValue]<=1))
    {
        self.statusLabel5.text=@"very bad";
    }
    else
        if (([str intValue]>1)&&([str intValue]<=2))
        {
            self.statusLabel5.text=@"poor";
        }
        else
            if (([str intValue]>2)&&([str intValue]<=3))
            {
                self.statusLabel5.text=@"fair";
            }
    
            else
                if (([str intValue]>3)&&([str intValue]<=4))
                {
                    self.statusLabel5.text=@"Good";
                }
                else
                    if (([str intValue]>4)&&([str intValue]<=5))
                    {
                        self.statusLabel5.text=@"Excellent";
                    }
    
}
-(void)career:(Career *)career ratingDidChange:(float)rating
{
    NSString *str=[NSString stringWithFormat:@"%f", rating];
    if (([str intValue]>0)&&([str intValue]<=1))
    {
        self.statusLabel4.text=@"very bad";
    }
    else
        if (([str intValue]>1)&&([str intValue]<=2))
        {
            self.statusLabel4.text=@"poor";
        }
        else
            if (([str intValue]>2)&&([str intValue]<=3))
            {
                self.statusLabel4.text=@"fair";
            }
    
            else
                if (([str intValue]>3)&&([str intValue]<=4))
                {
                    self.statusLabel4.text=@"Good";
                }
                else
                    if (([str intValue]>4)&&([str intValue]<=5))
                    {
                        self.statusLabel4.text=@"Excellent";
                    }
    
}
-(void)usability:(Usability *)usability ratingDidChange:(float)rating
{
    NSString *str=[NSString stringWithFormat:@"%f", rating];
    if (([str intValue]>0)&&([str intValue]<=1))
    {
        self.statusLabel6.text=@"very bad";
    }
    else
        if (([str intValue]>1)&&([str intValue]<=2))
        {
            self.statusLabel6.text=@"poor";
        }
        else
            if (([str intValue]>2)&&([str intValue]<=3))
            {
                self.statusLabel6.text=@"fair";
            }
    
            else
                if (([str intValue]>3)&&([str intValue]<=4))
                {
                    self.statusLabel6.text=@"Good";
                }
                else
                    if (([str intValue]>4)&&([str intValue]<=5))
                    {
                        self.statusLabel6.text=@"Excellent";
                    }
    
    
}


-(void)infoview:(Infoview *)infoview ratingDidChange:(float)rating
{
    NSString *str=[NSString stringWithFormat:@"%f", rating];
    if (([str intValue]>0)&&([str intValue]<=1))
    {
        self.statusLabel1.text=@"very bad";
    }
    else
        if (([str intValue]>1)&&([str intValue]<=2))
        {
            self.statusLabel1.text=@"poor";
        }
        else
            if (([str intValue]>2)&&([str intValue]<=3))
            {
                self.statusLabel1.text=@"fair";
            }
    
            else
                if (([str intValue]>3)&&([str intValue]<=4))
                {
                    self.statusLabel1.text=@"Good";
                }
                else
                    if (([str intValue]>4)&&([str intValue]<=5))
                    {
                        self.statusLabel1.text=@"Excellent";
                    }
    
}
-(void)rateview:(Rateview *)rateview ratingDidChange:(float)rating {
    NSString *str=[NSString stringWithFormat:@"%f", rating];
    if (([str intValue]>0)&&([str intValue]<=1))
    {
        self.statusLabel.text=@"very bad";
    }
    else
        if (([str intValue]>1)&&([str intValue]<=2))
        {
            self.statusLabel.text=@"poor";
        }
        else
            if (([str intValue]>2)&&([str intValue]<=3))
            {
                self.statusLabel.text=@"fair";
            }
    
            else
                if (([str intValue]>3)&&([str intValue]<=4))
                {
                    self.statusLabel.text=@"Good";
                }
                else
                    if (([str intValue]>4)&&([str intValue]<=5))
                    {
                        self.statusLabel.text=@"Excellent";
                    }
    // self.statusLabel.text = [NSString stringWithFormat:@"%f", rating];
    
}

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
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    
    [super viewDidLoad];
    [self style];
    [self dismissKeyboard];
    thescrollview.scrollEnabled=YES;
    //showbtn.enabled=NO;
    fileld1.enabled=NO;
    field3.enabled=NO;
    field2.enabled=NO;
    field2.backgroundColor=[UIColor grayColor];
    field3.backgroundColor=[UIColor grayColor];
    fileld1.backgroundColor=[UIColor grayColor];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        thescrollview.scrollEnabled=YES;
        thescrollview.contentSize=CGSizeMake(320,850);
        
    }
    else
    {

    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if(orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown){
        // self.view = self.potraitView;
        if(orientation ==UIInterfaceOrientationPortraitUpsideDown){
            NSLog(@"Changed Orientation To PortraitUpsideDown");
            //  [self portraitUpsideDownOrientation];
        }else{
            NSLog(@"Changed Orientation To Portrait");
            thescrollview.scrollEnabled=NO;
            [self portraitOrientation];
        }
    }else{
        // self.view = self.landscapeView;
        if(orientation ==UIInterfaceOrientationLandscapeLeft){
            NSLog(@"Changed Orientation To Landscape left");
            thescrollview.contentSize=CGSizeMake(1024,970);
            
            [self landscapeLeftOrientation];
        }else{
            NSLog(@"Changed Orientation To Landscape right");
            thescrollview.contentSize=CGSizeMake(1024,970);
            
            [self landscapeRightOrientation];
        
    }
    }
    }
    CAGradientLayer *btnGradient = [BackgroundLayer blackWhiteGradient];
    btnGradient.frame = self.sub.bounds;
    btnGradient.cornerRadius=3;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sub.layer insertSublayer:btnGradient atIndex:0];
    // self.comments=self;
    
    // Do any additional setup after loading the view from its nib.
}
#pragma  mark-switch arguments
-(IBAction)switchact:(id)sender
{
     BOOL value;
    if ((showbtn.on)) {
        value=YES;
        fileld1.enabled=YES;
        field3.enabled=YES;
        field2.enabled=YES;
        field2.backgroundColor=[UIColor whiteColor];
       fileld1.backgroundColor=[UIColor whiteColor];
        field3.backgroundColor=[UIColor whiteColor];
    }
    else
    {
        value=NO;
        fileld1.enabled=NO;
        field3.enabled=NO;
        field2.enabled=NO;
        field2.backgroundColor=[UIColor grayColor];
        fileld1.backgroundColor=[UIColor grayColor];
        field3.backgroundColor=[UIColor grayColor];
  
    }
}

# pragma mark- orientation chage




-(void)orientationChanged:(NSNotification *)object{
    NSLog(@"orientation change");
    UIDeviceOrientation deviceOrientation = [[object object] orientation];
    if(deviceOrientation == UIInterfaceOrientationPortrait || deviceOrientation == UIInterfaceOrientationPortraitUpsideDown){
        // self.view = self.potraitView;
        if(deviceOrientation ==UIInterfaceOrientationPortraitUpsideDown){
            NSLog(@"Changed Orientation To PortraitUpsideDown");
            //  [self portraitUpsideDownOrientation];
        }else{
            NSLog(@"Changed Orientation To Portrait");
            [self portraitOrientation];
        }
    }else{
        // self.view = self.landscapeView;
        if(deviceOrientation ==UIInterfaceOrientationLandscapeLeft){
            NSLog(@"Changed Orientation To Landscape left");
            [self landscapeLeftOrientation];
        }else{
            NSLog(@"Changed Orientation To Landscape right");
            [self landscapeRightOrientation];
        }
        
    }
}

-(void)landscapeLeftOrientation{
    
    // Rotates the view.
    thescrollview.scrollEnabled=YES;
    thescrollview.contentSize=CGSizeMake(1024,970);
    //    CGAffineTransform transform = CGAffineTransformMakeRotation(-(3.14159/2));
    //    self.view.transform = transform;
    //    // Repositions and resizes the view.
    //    CGRect contentRect = CGRectMake(0, 0, 480, 320);
    //    self.view.bounds = contentRect;
}
-(void)landscapeRightOrientation{
    
    // Rotates the view.
    thescrollview.scrollEnabled=YES;
    thescrollview.contentSize=CGSizeMake(1024,970);
    //    CGAffineTransform transform = CGAffineTransformMakeRotation(3.14159/2);
    //    self.view.transform = transform;
    //    // Repositions and resizes the view.
    //    CGRect contentRect = CGRectMake(0, 0, 480, 320);
    //    self.view.bounds = contentRect;
}
-(void)portraitOrientation{
    
    // Rotates the view.
    thescrollview.scrollEnabled=NO;
    //    CGAffineTransform transform = CGAffineTransformMakeRotation(0);
    //    self.view.transform = transform;
    //    // Repositions and resizes the view.
    //    CGRect contentRect = CGRectMake(0, 0, 320, 480);
    //    self.view.bounds = contentRect;
}
-(void)portraitUpsideDownOrientation{
    
    
    //    // Rotates the view.
    //    CGAffineTransform transform = CGAffineTransformMakeRotation(3.14159);
    //    self.view.transform = transform;
    //    // Repositions and resizes the view.
    //    CGRect contentRect = CGRectMake(0, 0, 320, 480);
    //    self.view.bounds = contentRect;
}



-(void)style
{
    [comments.layer setBorderColor:[[[UIColor whiteColor] colorWithAlphaComponent:0.5] CGColor]];
    [comments.layer setBorderWidth:2.0];
    
    //The rounded corner part, where you specify your view's corner radius:
    comments.layer.cornerRadius = 5;
    comments.clipsToBounds = YES;
    
  self.comments2.layer.cornerRadius = 5;
  self.comments2.clipsToBounds = YES;
    
    
    self.rateview.notselectedimage = [UIImage imageNamed:@"star_empty.png"];
    self.rateview.halfselectedimage = [UIImage imageNamed:@"star_half_full.png"];
    self.rateview.fullselectedimage = [UIImage imageNamed:@"star_full.png"];
    self.rateview.rating = 0;
    self.rateview.editable = YES;
    self.rateview.maxRating = 5;
    self.rateview.delegate = self;
    
    
    self.Infoview.notselectedimage = [UIImage imageNamed:@"star_empty.png"];
    self.Infoview.halfselectedimage = [UIImage imageNamed:@"star_half_full.png"];
    self.Infoview.fullselectedimage = [UIImage imageNamed:@"star_full.png"];
    self.Infoview.rating = 0;
    self.Infoview.editable = YES;
    self.Infoview.maxRating = 5;
    self.Infoview.delegate = self;
    
    self.History.notselectedimage = [UIImage imageNamed:@"star_empty.png"];
    self.History.halfselectedimage = [UIImage imageNamed:@"star_half_full.png"];
    self.History.fullselectedimage = [UIImage imageNamed:@"star_full.png"];
    self.History.rating = 0;
    self.History.editable = YES;
    self.History.maxRating = 5;
    self.History.delegate = self;
    
    
    self.notification.notselectedimage = [UIImage imageNamed:@"star_empty.png"];
    self.notification.halfselectedimage = [UIImage imageNamed:@"star_half_full.png"];
    self.notification.fullselectedimage = [UIImage imageNamed:@"star_full.png"];
    self.notification.rating = 0;
    self.notification.editable = YES;
    self.notification.maxRating = 5;
    self.notification.delegate = self;
    
    
    
    self.perfomance.notselectedimage = [UIImage imageNamed:@"star_empty.png"];
    self.perfomance.halfselectedimage = [UIImage imageNamed:@"star_half_full.png"];
    self.perfomance.fullselectedimage = [UIImage imageNamed:@"star_full.png"];
    self.perfomance.rating = 0;
    self.perfomance.editable = YES;
    self.perfomance.maxRating = 5;
    self.perfomance.delegate = self;
    
    
    self.career.notselectedimage = [UIImage imageNamed:@"star_empty.png"];
    self.career.halfselectedimage = [UIImage imageNamed:@"star_half_full.png"];
    self.career.fullselectedimage = [UIImage imageNamed:@"star_full.png"];
    self.career.rating = 0;
    self.career.editable = YES;
    self.career.maxRating = 5;
    self.career.delegate = self;
    
    
    self.usability.notselectedimage = [UIImage imageNamed:@"star_empty.png"];
    self.usability.halfselectedimage = [UIImage imageNamed:@"star_half_full.png"];
    self.usability.fullselectedimage = [UIImage imageNamed:@"star_full.png"];
    self.usability.rating = 0;
    self.usability.editable = YES;
    self.usability.maxRating = 5;
    self.usability.delegate = self;
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"application Feedback Screen";
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)string

{
    
    if([string isEqualToString:@"\n"])
        
    {
        
        [textView resignFirstResponder];
        return NO;
        
    }
    
    return YES;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)getRatingCount:(float)rateCount{
    statusLabel.text = [NSString stringWithFormat:@"%f",rateCount];
    statusLabel1.text = [NSString stringWithFormat:@"%f",rateCount];
    statusLabel2.text = [NSString stringWithFormat:@"%f",rateCount];
    statusLabel3.text = [NSString stringWithFormat:@"%f",rateCount];
    statusLabel4.text = [NSString stringWithFormat:@"%f",rateCount];
    statusLabel5.text = [NSString stringWithFormat:@"%f",rateCount];
    statusLabel6.text = [NSString stringWithFormat:@"%f",rateCount];
}
-(IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)home:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
    /*
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        Home *login = [[Home alloc]initWithNibName:@"Home_iphone" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
    else
    {
        Home *login = [[Home alloc]initWithNibName:@"Home_iPad" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
     */
    
}

- (IBAction)btnback:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)dismissKeyboardOnTap:(id)sender
{
    [[self view] endEditing:YES];
}
-(IBAction)submit:(id)sender
{
    // lbuser.text=manage.commonuser;
    
    if (showbtn.on) {
        
        NSString *post =[[NSString alloc] initWithFormat:@"bill_enquiry_payment=%@&update_customer_info=%@&view_transaction_history=%@&notification_messages=%@&career_messages=%@&application_performance=%@&application_usability=%@&comments=%@&name=%@&mobile_number=%@&email=%@",statusLabel.text,statusLabel1.text,statusLabel2.text,statusLabel3.text,statusLabel4.text,statusLabel5.text,statusLabel6.text,comments.text,fileld1.text,field2.text,field3.text];
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSLog(@"postData.....%@", post);
        
        // NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
        NSString *URL = [NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/feedback_application.php"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
        [request setHTTPMethod:@"POST"];
        //[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        //[request setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        Login_Connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
        
        if(Login_Connection)
        {
            Login_ResponseData = [NSMutableData data];
        }
        else
        {
            NSLog(@"Connection could not be made");
        }

    }
    else
    {
        
        NSString *post =[[NSString alloc] initWithFormat:@"bill_enquiry_payment=%@&update_customer_info=%@&view_transaction_history=%@&notification_messages=%@&career_messages=%@&application_performance=%@&application_usability=%@&comments=%@&name=&mobile_number=&email=",statusLabel.text,statusLabel1.text,statusLabel2.text,statusLabel3.text,statusLabel4.text,statusLabel5.text,statusLabel6.text,comments.text];
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSLog(@"postData.....%@", post);
        
        // NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
        
        NSString *URL = [NSString stringWithFormat:@"http://mobileapp.certifytechnologies.com/jumeirah/feedback_application.php"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
        [request setHTTPMethod:@"POST"];
        //[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        //[request setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        Login_Connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
        
        if(Login_Connection)
        {
            Login_ResponseData = [NSMutableData data];
        }
        else
        {
            NSLog(@"Connection could not be made");
        }

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

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if (connection == Login_Connection)
    {
        id jsonObject = [NSJSONSerialization JSONObjectWithData:Login_ResponseData options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"Login_ResponseData...%@",jsonObject);
       newstring=jsonObject[@"error_message"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:newstring  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        alert.tag=40;
        [alert show];
        
        
        
        
        
        

    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==40) {
        if ([newstring isEqualToString:@"Feedback Submitted Sucessfully"]) {
            [self.navigationController popViewControllerAnimated:YES];
            
        }
    }
    
    
}

-(IBAction)dismiss:(id)sender
{
    [comments resignFirstResponder];
}
-(void)dismissKeyboard
{
    
    [comments resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
