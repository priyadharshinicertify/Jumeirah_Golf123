//
//  salesfeedback.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 23/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "salesfeedback.h"
#import "BackgroundLayer.h"
@interface salesfeedback ()
{
    UIToolbar* numberToolbar;
    UIToolbar *myToolbar;
    UIToolbar *myToolbar1;
    NSString *newstring;
    UIToolbar *myToolbar2;
    
}
//@property(strong,nonatomic)IBOutlet  UIActivityIndicatorView *spinner;
@end

@implementation salesfeedback

@synthesize ddMenu, ddText;
@synthesize ddMenuShowButton;
@synthesize sample, ddText1;
@synthesize ddMenuShowButton1,Details_product_ScrollView,topButton;
@synthesize name,mail,mobno,time,budget,no_bed,name1,sub,dater,distr,property,distselect,propertyselect,ddMenu1,dtText,arrAgeRanges,arrAgeRanges1,arrAgeRanges2,picker2,picker3;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;

- (void)viewDidLoad
{
 //   [topButton addTarget:self action:@selector(showPopover:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    //topButton.frame = CGRectMake(323,763, 300, 30);
    [topButton setTitle:@"button" forState:UIControlStateNormal];
    topButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;

    [dater addTarget:self action:@selector(showPopover1:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    [distr addTarget:self action:@selector(showPopover2:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    [property addTarget:self action:@selector(showPopover3:forEvent:) forControlEvents:UIControlEventTouchUpInside];
   
   // spinner.hidden=YES;
    manage=[singleton share];
    name1.text=manage.username;
    if ([name1.text length]==0 ) {
        //  name2.text=
    }
    
    numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]
                            ,[[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                            [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
    
    mobno.inputAccessoryView = numberToolbar;
    

    
    
    
    
    
    
    
    
    
    
    
    
     arrAgeRanges = [[NSArray alloc] initWithObjects:@"Whispering Pines",@"Flame Tree Ridge",@"Redwood",@"Wild Flower",@"Other", nil];
      arrAgeRanges1 = [[NSArray alloc] initWithObjects:@"Town House",@"Villa",@"Apartment", nil];
    
    myToolbar = [[UIToolbar alloc] initWithFrame:
                 CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
    UIBarButtonItem *doneButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                  target:self action:@selector(inputAccessoryViewDidFinish)];
    
    UIBarButtonItem *cancelbutton= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                 target:self action:@selector(inputAccessoryViewDidFinish0)];
    
    UIBarButtonItem *sp= [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                       target:self action:nil];
    

    
    
    [myToolbar setItems:[NSArray arrayWithObjects: doneButton,sp,cancelbutton,nil] animated:NO];
    time.inputAccessoryView = myToolbar;

    
    picker2 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 43, 320, 480)];
    
    
    
    picker2.delegate = self;
    
    picker2.dataSource = self;

    picker3 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 43, 320, 480)];
    
    
    
    picker3.delegate = self;
    
    picker3.dataSource = self;

    
    
    myToolbar1 = [[UIToolbar alloc] initWithFrame:
                 CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
    UIBarButtonItem *doneButton1 =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                  target:self action:@selector(inputAccessoryViewDidFinish12)];
    
    UIBarButtonItem *cancelbutton1= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                 target:self action:@selector(inputAccessoryViewDidFinish013)];
    
    UIBarButtonItem *sp1= [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                       target:self action:nil];
    
    
    
    
    [myToolbar1 setItems:[NSArray arrayWithObjects: doneButton1,sp1,cancelbutton1,nil] animated:NO];
    distselect.inputAccessoryView = myToolbar1;
    

    
    
    
    myToolbar2 = [[UIToolbar alloc] initWithFrame:
                  CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
    UIBarButtonItem *doneButton2 =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                  target:self action:@selector(inputAccessoryViewDidFinish2)];
    
    UIBarButtonItem *cancelbutton2= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                  target:self action:@selector(inputAccessoryViewDidFinish02)];
    
    UIBarButtonItem *sp2= [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                        target:self action:nil];
    
    
    
    
    [myToolbar2 setItems:[NSArray arrayWithObjects: doneButton2,sp2,cancelbutton2,nil] animated:NO];
    propertyselect.inputAccessoryView = myToolbar2;
    
    

    
    
    Details_product_ScrollView.contentSize=CGSizeMake(320,750);
  
//    [self.dtText addTarget:self action:@selector(showdistricts:forEvent:) forControlEvents:UIControlEventTouchUpInside];
//    dtText.inputAccessoryView=vv;
    
    
    ddMenu.hidden=YES;
    ddMenu1.hidden=YES;
    
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
  //  numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    
 //   numberToolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]
                           // ,[[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           // [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
    
    
    

    

    [super viewDidLoad];
    
}
-(void)inputAccessoryViewDidFinish
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];

    NSString *strDate = [dateFormatter stringFromDate:self.picker1.date];
    self.time.text = strDate;
    
    
    [self.time resignFirstResponder];
    
}

-(void)inputAccessoryViewDidFinish0
{
    
    
    [self.time resignFirstResponder];
    
}

-(void)inputAccessoryViewDidFinish12
{
    
    NSString *strDate = [arrAgeRanges objectAtIndex:[self.picker2 selectedRowInComponent:0]];
    self.distselect.text = strDate;
    
    
    [self.distselect resignFirstResponder];
    
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSUInteger i;
    if (pickerView== self.picker2) {
         i= self.arrAgeRanges.count;
    }
     else  {
         i= self.arrAgeRanges1.count;
    }
    return i;
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    id i;
     if (pickerView==  self.picker2) {
       i= [self.arrAgeRanges objectAtIndex:row];
     }
   else {
         i= [self.arrAgeRanges1 objectAtIndex:row];
    }
    return i;
}

-(void)inputAccessoryViewDidFinish02
{
    
    
    [self.propertyselect resignFirstResponder];
    
}

-(void)inputAccessoryViewDidFinish2
{
    
    NSString *strDate = [arrAgeRanges1 objectAtIndex:[self.picker3 selectedRowInComponent:0]];
    self.propertyselect.text = strDate;
    
    
    [self.propertyselect resignFirstResponder];
    
}


-(void)inputAccessoryViewDidFinish013
{
    
    
    [self.distselect resignFirstResponder];
    
}






-(void)doneWithNumberPad
{
    [time resignFirstResponder];
    [budget resignFirstResponder];
    [no_bed resignFirstResponder];
    [mobno resignFirstResponder];
    
}

-(void)showPopover1:(id)sender forEvent:(UIEvent*)event
{
    timeview *testViewController = [[timeview alloc] initWithNibName:@"timeview" bundle:nil];
    testViewController.delegate = self;
    
    self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
    //  _userDataPopover.frame = CGRectMake(0,0, 250, 200);
    self.userDataPopover.popoverContentSize = CGSizeMake(320, 226);
    
    [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
                                          inView:self.view
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
    
}

-(void)showPopover2:(id)sender forEvent:(UIEvent*)event
{
    
    distrsview *testViewController = [[distrsview alloc] initWithNibName:@"distrsview" bundle:nil];
    testViewController.delegate = self;
    
    self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
    //  _userDataPopover.frame = CGRectMake(0,0, 250, 200);
    self.userDataPopover.popoverContentSize = CGSizeMake(320, 226);
    
    [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
                                          inView:self.view
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
    
    

    
}

-(void)distrsviewpro:(NSString *)picker
{
    distselect.text=picker;
      [self.userDataPopover dismissPopoverAnimated:YES];
}

-(void)distrsviewpro1
{
    [self.userDataPopover dismissPopoverAnimated:YES];
}
-(void)datepro:(NSString *)picker
{
    time.text=picker;
    
    [self.userDataPopover dismissPopoverAnimated:YES];
    
}
-(void)datepro1
{
    [self.userDataPopover dismissPopoverAnimated:YES];
}

    


-(void)showPopover3:(id)sender forEvent:(UIEvent*)event
{
    propertytype *testViewController = [[propertytype alloc] initWithNibName:@"propertytype" bundle:nil];
    testViewController.delegate = self;
    
    self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
    //  _userDataPopover.frame = CGRectMake(0,0, 250, 200);
    self.userDataPopover.popoverContentSize = CGSizeMake(320, 226);
    
    [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
                                          inView:self.view
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];

}
-(void)propertytypepro:(NSString *)picker
{
    propertyselect.text=picker;
     [self.userDataPopover dismissPopoverAnimated:YES];
    
}
-(void)propertytypepro1
{
     [self.userDataPopover dismissPopoverAnimated:YES];
}
-(void)showPopover:(id)sender forEvent:(UIEvent*)event
{
    
    
}
-(void)updateTextField:(id)sender
{
//    UIDatePicker *picker = (UIDatePicker*)self.time.inputView;
//    self.time.text = [NSString stringWithFormat:@"%@",picker.date];
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
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
-(IBAction)submit:(id)sender
{
    
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    if ([name.text isEqualToString:@""] || name.text.length==0 || [mail.text isEqualToString:@""] || mail.text.length==0 || [mobno.text isEqualToString:@""] || mobno.text.length==0 || [time.text isEqualToString:@""] || time.text.length==0|| [no_bed.text isEqualToString:@""] || no_bed.text.length==0 || [budget.text isEqualToString:@""] || budget.text.length==0  ) {
        
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Kindly fill all the details" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrt show];
        
    }
    
    //Valid email address
    else if  ([emailTest evaluateWithObject:mail.text] == NO)
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Invalid Email Format!!" message:@"Enter the Correct Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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
            
        
        
        //[self.view addSubview:activityView];
    NSString *post =[[NSString alloc] initWithFormat:@"customer=no&name=%@&email=%@&mobile_number=%@&best_time_to_contact=%@&district_intrested=%@&property_type=%@& number_of_bedrooms=%@& your_budjet=%@",name.text,mail.text,mobno.text,time.text,self.distselect.text,propertyselect.text,no_bed.text,budget.text];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSLog(@"postData.....%@", post);
    
    // NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSString *URL = [NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/feedback_sales_enquiry.php"];
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
       newstring=jsonArray1[@"error_message"];
             dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirmation" message:newstring
                                                       delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
           [alert show];
        alert.tag=10;
             //  spinner.hidden=YES;
           
                [spinner stopAnimating];
            });
        });
        

    }
    
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==10) {
        if ([newstring isEqualToString:@"Your enquiry submitted  successfully"]) {
            [self.navigationController popViewControllerAnimated:YES];
            
        }
    }
    
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
  
}
-(IBAction)sback:(id)sender
{
    //  resignFirstResponder;
    [self.navigationController popViewControllerAnimated:YES];
    
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

- (IBAction)ddMenuShow1:(UIButton *)sender
{ if (sender.tag == 0) {
    sender.tag = 1;
    self.ddMenu1.hidden = NO;
    [sender setTitle:@"▲" forState:UIControlStateNormal];
} else {
    sender.tag = 0;
    self.ddMenu1.hidden = YES;
    [sender setTitle:@"▼" forState:UIControlStateNormal];
}

   }
- (IBAction)ddMenuSelectionMade1:(UIButton *)sender
{ self.ddText1.text = sender.titleLabel.text;
    [self.ddMenuShowButton1 setTitle:@"▼" forState:UIControlStateNormal];
    self.ddMenuShowButton1.tag = 0;
    self.ddMenu1.hidden = YES;

    }


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if (textField==time) {
       
        if(self.picker1 == nil) {
            
            [time resignFirstResponder];
           self.picker1 = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 43, 320, 480)];
           self.picker1.tag =42;
            
            // [self.picker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
         [self.view addSubview:self.picker1];
            
        }
      self.time.inputView = self.picker1;

    }
    
    if (textField==self.distselect)
    { 
        if(self.picker2 == nil) {
            
            [distselect resignFirstResponder];
            self.picker2 = [[UIPickerView alloc] init];
            self.picker2.tag =42;
            [self.view addSubview:self.picker2];
            
        }
        picker3.hidden=YES;
        self.distselect.inputView=self.picker2;
    }
     if (textField==self.propertyselect)
    {
        picker3.hidden=NO;
        if(self.picker3 == nil) {
            
            [propertyselect resignFirstResponder];
            self.picker3 = [[UIPickerView alloc] init];
            self.picker3.tag =42;
            [self.view addSubview:self.picker3];
            
        }
        self.propertyselect.inputView=self.picker3;
        
    }
    
    
    return YES;
}

-(void)showdistricts:(id)sender forEvent:(UIEvent*)event
{
    timeview *testViewController = [[timeview alloc] initWithNibName:@"timeview" bundle:nil];
    testViewController.delegate = self;
    
 /*   self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
    //  _userDataPopover.frame = CGRectMake(0,0, 250, 200);
    self.userDataPopover.popoverContentSize = CGSizeMake(320, 226);
    
    [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
                                          inView:self.view
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
    */
    vv=[[UIView alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height-vv.frame.size.height-50, 320,50)];
    
    [vv addSubview:testViewController.view];

    
}


-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    if (textField==name) {
       [ mail becomeFirstResponder];
    }
    else if(textField==mail)
    {
        [mobno becomeFirstResponder];
    }
    else if(textField==mobno)
    {
        [mobno resignFirstResponder];
    }
    if (textField==no_bed) {
        [budget becomeFirstResponder];
    }
    if (textField==budget) {
        [budget resignFirstResponder];
    }
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField==mobno) {
        [self.dtText resignFirstResponder];
            [self.ddText1 resignFirstResponder];
        
          mobno.inputAccessoryView = numberToolbar;
    }
   else if (textField==no_bed) {
        [self.dtText resignFirstResponder];
            [self.ddText1 resignFirstResponder];
        
        no_bed.inputAccessoryView = numberToolbar;
    }
  else  if (textField==time) {
        [self.dtText resignFirstResponder];
            [self.ddText1 resignFirstResponder];
        
       // time.inputAccessoryView = numberToolbar;
    }
    
  else  if (textField==budget) {
        [self.dtText resignFirstResponder];
            [self.ddText1 resignFirstResponder];
        
        budget.inputAccessoryView = numberToolbar;
    }
    
    else
    {
        
    }
    
   
    
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


   /* CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.Details_product_ScrollView setFrame:viewFrame];
    
    [UIView commitAnimations];*/
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
}



@end
