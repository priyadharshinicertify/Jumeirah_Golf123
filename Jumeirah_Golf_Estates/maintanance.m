//
//  maintanance.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 16/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "maintanance.h"
#import "BackgroundLayer.h"
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;

@interface maintanance ()
{
      UIToolbar *myToolbar;
    UIToolbar* numberToolbar;
    NSString *newstring;
}
@end

@implementation maintanance
@synthesize scroll,showing,districtstext,email,fullname,phonno,villano,issuesummary,viewdetails,submit,arrAgeRanges,picker2;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField==email) {
        [fullname becomeFirstResponder];
    }
    else if (textField==fullname)
    {
        [phonno becomeFirstResponder];
    }
    else if(textField==phonno)
    {
        [villano becomeFirstResponder];
    }
    else if (textField==villano)
    {
        [issuesummary becomeFirstResponder];
    }
    else if(textField==issuesummary)
    {
        [viewdetails becomeFirstResponder];
    }
    else if(textField==viewdetails)
        
    {
        [viewdetails resignFirstResponder];
    }
        
        
    return YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    CAGradientLayer *btnGradient5 = [BackgroundLayer blackWhiteGradient];
    btnGradient5.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient5 atIndex:0];
    
    
    
    arrAgeRanges = [[NSArray alloc] initWithObjects:@"RedWood",@"Flame Tree Ridge",@"Lime Tree Valley East",@"Lime Tree Valley West",@"Olive Point", @"Whispering Pines",@"Wild Flower",@"Sienna Lakes",@"Sanctuary Falls",@"Other", nil];

    myToolbar = [[UIToolbar alloc] initWithFrame:
                 CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
    
    picker2 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 43, 320, 480)];
    
    
    
    picker2.delegate = self;
    
    picker2.dataSource = self;
    
    
    scroll.scrollEnabled=YES;
    scroll.contentSize=CGSizeMake(318, 800);
    UIBarButtonItem *doneButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                  target:self action:@selector(inputAccessoryViewDidFinish)];
    
    UIBarButtonItem *cancelbutton= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                 target:self action:@selector(inputAccessoryViewDidFinish0)];
    
    UIBarButtonItem *sp= [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                       target:self action:nil];
    
    
    
    
    [myToolbar setItems:[NSArray arrayWithObjects: doneButton,sp,cancelbutton,nil] animated:NO];
    districtstext.inputAccessoryView = myToolbar;
    

   
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.submit.bounds;
     btnGradient1.cornerRadius=5;
    btnGradient1.borderWidth=1.0;
   btnGradient1.borderColor=([UIColor whiteColor]).CGColor;
    [self.submit.layer insertSublayer:btnGradient1 atIndex:0];
    [showing addTarget:self action:@selector(showPopover:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view from its nib.
    
    
    
    
    
    numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]
                            ,[[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                            [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
    
    phonno.inputAccessoryView = numberToolbar;
    
    villano.inputAccessoryView=numberToolbar;
    
    
    
    
    
    
}
-(void)doneWithNumberPad
{
    [phonno resignFirstResponder];
    [villano resignFirstResponder];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    //[self.view endEditing:YES];
    [email resignFirstResponder];
}


-(void)inputAccessoryViewDidFinish
{
    
    NSString *strDate = [arrAgeRanges objectAtIndex:[self.picker2 selectedRowInComponent:0]];
    self.districtstext.text = strDate;
    
    
    [self.districtstext resignFirstResponder];
    
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSUInteger i=0;
    if (self.picker2) {
        i= self.arrAgeRanges.count;
    }
        return i;
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    id i=0;
    if (self.picker2) {
        i= [self.arrAgeRanges objectAtIndex:row];
    }
       return i;
}

-(void)inputAccessoryViewDidFinish0
{
    
    
    [self.districtstext resignFirstResponder];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)showPopover:(id)sender forEvent:(UIEvent*)event
{
    [self.view endEditing:YES];
    maintancepopview *testViewController = [[maintancepopview alloc] initWithNibName:@"maintancepopview" bundle:nil];
    testViewController.delegate = self;
    
    self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
    //  _userDataPopover.frame = CGRectMake(0,0, 250, 200);
    self.userDataPopover.popoverContentSize = CGSizeMake(320, 226);
    
    [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
                                          inView:self.view
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
    
}








-(void)usedatastring:(NSString *)picker
{
    districtstext.text=picker;
    
    [self.userDataPopover dismissPopoverAnimated:YES];
    
}
-(void)usedatastring1
{
    [self.userDataPopover dismissPopoverAnimated:YES];
}
- (IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)sub_action:(id)sender {
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
   
    if  ([emailTest evaluateWithObject:email.text] == NO)
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Invalid Email Format!!" message:@"Ener the Correct Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrt show];
    }
    
    
        
        
       else  if ( email.text.length==0 || [email.text isEqualToString:@""] || fullname.text.length==0 || [fullname.text isEqualToString:@""] || villano.text.length==0 || [villano.text isEqualToString:@""]  )
        {
            
            UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Kindly fill all the details" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alrt show];
            
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
                
                
                
                
                NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/maintenance_request.php"]];
                // create the Method "GET" or "POST"
                
                [request setHTTPMethod:@"POST"];
                
                //Pass The String to server
                NSString *userUpdate =[NSString stringWithFormat:@"district=%@&email_address=%@&full_name=%@&phone_number=%@&villa_number=%@&issue_summary=%@&issue_details=%@",districtstext.text,email.text,fullname.text,phonno.text,villano.text,issuesummary.text,viewdetails.text,nil];
                
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
                    newstring= jsonArray1[@"error_message"] ;
                    
                    NSLog(@"the err=%@",newstring);
                    dispatch_async(dispatch_get_main_queue(), ^{
                       
                    
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:newstring  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        alert.tag=10;
                        [alert show];
                        
                        [spinner stopAnimating];
                    });

                    
                    
                }
                else
                {
                    NSLog(@"faield to connect");
                         dispatch_async(dispatch_get_main_queue(), ^{
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Network Failed!"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert show];
                             
                             [spinner stopAnimating];
                         });
                    

                }
                            });
            
            
            
            
        }

    
    
    
    
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==10) {
        if ([newstring isEqualToString:@"Your request has been successfully registered"]) {
            [self.navigationController popViewControllerAnimated:YES];
            
        }
    }
    
    
}



- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField==self.districtstext)
    {
        if(self.picker2 == nil) {
            
            [districtstext resignFirstResponder];
            self.picker2 = [[UIPickerView alloc] init];
            self.picker2.tag =42;
            [self.view addSubview:self.picker2];
            
        }
        self.districtstext.inputView=self.picker2;
    }

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
    
    [self.ball setFrame:viewFrame];
    
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField

{
    CGRect viewFrame = self.ball.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.ball setFrame:viewFrame];
    
    [UIView commitAnimations];
}
-(void)textViewDidEndEditing:(UITextView *)textView

{
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.ball setFrame:viewFrame];
    
    [UIView commitAnimations];
    
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    CGRect textFieldRect =
    [self.view.window convertRect:textView.bounds fromView:textView];
    CGRect viewRect =
    [self.ball.window convertRect:self.view.bounds fromView:self.ball];
    
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
    
    CGRect viewFrame = self.ball.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.ball setFrame:viewFrame];
    
    [UIView commitAnimations];
}

@end
