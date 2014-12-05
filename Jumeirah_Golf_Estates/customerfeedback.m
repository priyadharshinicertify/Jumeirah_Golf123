//
//  customerfeedback.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 19/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "customerfeedback.h"
#import "BackgroundLayer.h"

@interface customerfeedback ()

@end

@implementation customerfeedback
@synthesize txtview,name,mobno,email,placeholderlabel;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;

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
   txtview.delegate = self;
    txtview.text = @"Your comment here";
    txtview.textColor = [UIColor whiteColor];
    
    txtview.layer.borderWidth = 1.0f;
    txtview.layer.borderColor = [[UIColor whiteColor] CGColor];
    txtview.layer.cornerRadius = 5;
    
    txtview.clipsToBounds = YES;
    
    
    
    name.layer.borderWidth = 1.0f;
    name.layer.borderColor = [[UIColor whiteColor] CGColor];
    name.layer.cornerRadius = 5;
    
    name.clipsToBounds = YES;
    
    
    
    
    
    
    email.layer.borderWidth = 1.0f;
    email.layer.borderColor = [[UIColor whiteColor] CGColor];
    email.layer.cornerRadius = 5;
    
    email.clipsToBounds = YES;
    
    mobno.layer.borderWidth = 1.0f;
    mobno.layer.borderColor = [[UIColor whiteColor] CGColor];
    mobno.layer.cornerRadius = 5;
    
    mobno.clipsToBounds = YES;
    
    
    CAGradientLayer *btnGradient = [BackgroundLayer blackWhiteGradient];
    btnGradient.frame = self.sub.bounds;
    btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sub.layer insertSublayer:btnGradient atIndex:0];

    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]
                           ,[[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
    
    mobno.inputAccessoryView = numberToolbar;
    

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


 
-(void)doneWithNumberPad{
    
    [mobno resignFirstResponder];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Customerfeedback Screen";
}

-(IBAction)submit:(id)sender
{
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    
    if ([email.text isEqualToString:@""] || email.text.length==0 || [name.text isEqualToString:@""] || name.text.length==0 || [mobno.text isEqualToString:@""] || mobno.text.length==0 || [txtview.text isEqualToString:@""] || txtview.text.length==0 ) {
        
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Fill The All Details" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrt show];
        
    }
   
    //Valid email address
   else if  ([emailTest evaluateWithObject:email.text] == NO)
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"InValid Email Format!!" message:@"Ener the Correct Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrt show];
    }
    else
    {
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/feedback_customer.php"]];
        // create the Method "GET" or "POST"
        
        [request setHTTPMethod:@"POST"];
        
        //Pass The String to server
        NSString *userUpdate =[NSString stringWithFormat:@"customer_name=%@&email=%@&mobile_no=%@&comment=%@",name.text,email.text,mobno.text,txtview.text,nil];
        
        //Check The Value what we passed
        NSLog(@"the data Details is =%@", userUpdate);
        
        //Convert the String to Data
        NSData *data1 = [userUpdate dataUsingEncoding:NSUTF8StringEncoding];
        
        //Apply the data to the body
        [request setHTTPBody:data1];
        
        //Create the response and Error
        
        NSError *err;
        NSURLResponse *response;
        
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request      returningResponse:&response error:&err];
        
        NSString *resSrt = [[NSString alloc]initWithData:responseData encoding:NSASCIIStringEncoding];
        
        //This is for Response 
        NSLog(@"got response==%@", resSrt);
        
        if(resSrt.length>0)
        {
              NSLog(@"got response");
            
            NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error: &err];
            NSString *jsonArray= jsonArray1[@"error_message"] ;
            
            NSLog(@"the err=%@",jsonArray);
            
            if ([jsonArray isEqualToString:@"Feedback Submitted Sucessfully"]) {
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:jsonArray  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                alert.tag=10;
                [alert show];
            }
            else
            {
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:jsonArray  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                
            }
            
            
            
        }
        else
        {
            NSLog(@"faield to connect");
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Network Failed!"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        
        
        
        
        
        
    }
    /*
    NSString *post =[[NSString alloc] initWithFormat:@"customer_name=%@&email=%@&mobile_no=%@&comment=%@",name.text,email.text,mobno.text,txtview.text];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSLog(@"postData.....%@", post);
    
    
    NSString *URL = [NSString stringWithFormat:@"http://mobileapp.certifytechnologies.com/jumeirah/feedback_customer.php"];
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
        
        NSString *jsonArray=[jsonArray1 objectForKey:@"error_message"];
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag==10)
    {
        email.text=@"";
        txtview.text=@"";
        name.text=@"";
        mobno.text=@"";
        txtview.text = @"Your comment here";
        txtview.textColor = [UIColor whiteColor];

    
    }
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [email resignFirstResponder];
    [txtview resignFirstResponder];
    [name resignFirstResponder];
    [mobno resignFirstResponder];
    [self.view endEditing:YES];
}

-(IBAction)home:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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

-(IBAction)finish:(id)sender
{
    [name resignFirstResponder];
    [email resignFirstResponder];
    [mobno resignFirstResponder];
    [txtview resignFirstResponder];
    
    
}
-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect textFieldRect =
    [self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect =
    [self.view.window convertRect:self.view.bounds fromView:self.view];
    
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
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
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
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
-(void)textViewDidEndEditing:(UITextView *)textView

{
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];

}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    CGRect textFieldRect =
    [self.view.window convertRect:textView.bounds fromView:textView];
    CGRect viewRect =
    [self.view.window convertRect:self.view.bounds fromView:self.view];
    
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
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
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    txtview.text = @"";
    txtview.textColor = [UIColor whiteColor];
    return YES;
   

}
-(void) textViewDidChange:(UITextView *)textView
{
    
    if(txtview.text.length == 0){
       txtview.textColor = [UIColor whiteColor];
        txtview.text = @"Your comment here";
        [textView resignFirstResponder];
    }
}
@end
