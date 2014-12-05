//
//  car_register.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 23/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "car_register.h"
#import "BackgroundLayer.h"


@interface car_register ()
{
    NSString *myString;
    NSString *myString1;
    NSString *myString2;
    NSString *myString3;
    NSString *myString4;
     UIView *popview;
    UIToolbar *myToolbar;
     UIToolbar *myToolbar1;
    
    NSString *newstring;
    
    
    UIToolbar *mono;
    UIToolbar *sal;
    UIToolbar *exno;
    UIToolbar *lane;
    
    UIView *gen;
    
    
    
}
@end

@implementation car_register
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
@synthesize firstname,lan,lastname,username,password,country,mob_no,major,ddMenu,ddMenuShowButton,ddText,date_birth,nationality,add,driving_license,highest_qualification,quali_area,exp_sal,exp_years,summary,sub,Details_product_ScrollView1,imageView,imageView1,imageView2,imageView3,imageView4,show1,show2,address,gender,resumesummary,sample,arrAgeRanges,pickerAge;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            
        }
        else
        {
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:@"UIDeviceOrientationDidChangeNotification" object:nil];
        }

      
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     arrAgeRanges = [[NSArray alloc] initWithObjects:@"Male",@"Female", nil];
    self.picker1 = [[UIDatePicker alloc] init]; // My solution
    self.picker1  = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 43, 320, 480)];
    self.picker1.datePickerMode=UIDatePickerModeDate;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        
        myToolbar = [[UIToolbar alloc] initWithFrame:
                                CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
        UIBarButtonItem *doneButton =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                      target:self action:@selector(inputAccessoryViewDidFinish)];
        
        UIBarButtonItem *cancelbutton= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                     target:self action:@selector(inputAccessoryViewDidFinish0)];
        
        UIBarButtonItem *sp= [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                                     target:self action:nil];
        
        
        
        exno=[[UIToolbar alloc] initWithFrame:
              CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
        UIBarButtonItem *d =
        [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain

                                                      target:self action:@selector(inputAccessoryViewDidFinish123456)];
        
//        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
//                                                      target:self action:@selector(inputAccessoryViewDidFinish123456)];
        
         [exno setItems:[NSArray arrayWithObjects:d,nil] animated:NO];
        
        
        exp_years.inputAccessoryView=exno;
        
        
        
        
        sal=[[UIToolbar alloc] initWithFrame:
              CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
        UIBarButtonItem *s =
        [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain
         
                                        target:self action:@selector(inputAccessoryViewDidFinishs)];
        
        //        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
        //                                                      target:self action:@selector(inputAccessoryViewDidFinish123456)];
        
        [sal setItems:[NSArray arrayWithObjects:s,nil] animated:NO];
        
        
        exp_sal.inputAccessoryView=sal;

        
        mono=[[UIToolbar alloc] initWithFrame:
             CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
        UIBarButtonItem *m =
        [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain
         
                                        target:self action:@selector(inputAccessoryViewDidFinishm)];
        
        //        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
        //                                                      target:self action:@selector(inputAccessoryViewDidFinish123456)];
        
        [mono setItems:[NSArray arrayWithObjects:m,nil] animated:NO];
        
        
        mob_no.inputAccessoryView=mono;
        

        lane=[[UIToolbar alloc] initWithFrame:
              CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
        UIBarButtonItem *l =
        [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain
         
                                        target:self action:@selector(inputAccessoryViewDidFinishl)];
        
        //        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
        //                                                      target:self action:@selector(inputAccessoryViewDidFinish123456)];
        
        [lane setItems:[NSArray arrayWithObjects:l,nil] animated:NO];
        
        
        lan.inputAccessoryView=lane;
        
  
        
        
        
        
        
        
        
         pickerAge = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 43, 320, 480)];
        
        
        
        pickerAge.delegate = self;
        
        pickerAge.dataSource = self;

       
        //using default text field delegate method here, here you could call
        //myTextField.resignFirstResponder to dismiss the views
        [myToolbar setItems:[NSArray arrayWithObjects: doneButton,sp,cancelbutton,nil] animated:NO];
        date_birth.inputAccessoryView = myToolbar;
        
        
        gen=[[UIView alloc] init];
        
        myToolbar1 = [[UIToolbar alloc] initWithFrame:
                     CGRectMake(0,0, 320, 44)];
        
        [gen addSubview:myToolbar1];
        
        
        
        UIBarButtonItem *doneButton1 =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                      target:self action:@selector(inputAccessoryViewDidFinish1)];
        
        UIBarButtonItem *cancelbutton1= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                     target:self action:@selector(inputAccessoryViewDidFinish2)];
        
        UIBarButtonItem *sp1= [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target:self action:nil];
        

        [myToolbar1 setItems:[NSArray arrayWithObjects: doneButton1,sp1,cancelbutton1,nil] animated:NO];
        
        
        
        
        
        
        
        gender.inputAccessoryView=myToolbar1;
        
        
        
        
        
        
        // [gender addTarget:self action:@selector(showde:forEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        pickerView.delegate=self;
        
        
    }
    else
    {

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:@"UIDeviceOrientationDidChangeNotification" object:nil];
    }
 // Details_product_ScrollView1.contentSize=CGSizeMake(1000,3900);
    
    
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    
    
   [show1 addTarget:self action:@selector(showPopover:forEvent:) forControlEvents:UIControlEventTouchUpInside];
   [show2 addTarget:self action:@selector(showPopover1:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    //topButton.frame = CGRectMake(323,763, 300, 30);
    [show1 setTitle:@"" forState:UIControlStateNormal];
    [show2 setTitle:@"" forState:UIControlStateNormal];
    
    
    
    show1.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    show2.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    Details_product_ScrollView1.scrollEnabled=YES;
    self.ddMenu.hidden = YES;
    CAGradientLayer *btnGradient = [BackgroundLayer blackWhiteGradient];
    btnGradient.frame = self.sub.bounds;
    btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sub.layer insertSublayer:btnGradient atIndex:0];
 
    
    Details_product_ScrollView1.delegate = self;


    add.text = @"Enter Address";
    add.textColor = [UIColor blackColor];
    
    
   // txtview.delegate = self;
    summary.text = @"Your comment here";
    summary.textColor = [UIColor whiteColor];

 
/* CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
 btnGradient1.frame = self.sample.bounds;
 // btnGradient.cornerRadius=5;
 //btnGradient.borderWidth=1.0;
 // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
 [self.sample.layer insertSublayer:btnGradient1 atIndex:0];*/
 
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        Details_product_ScrollView1.scrollEnabled=YES;
        Details_product_ScrollView1.contentSize=CGSizeMake(319,2300);
        UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0,1050, 0.0);
        Details_product_ScrollView1.contentInset = contentInsets;
 
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
            Details_product_ScrollView1.scrollEnabled=YES;
            Details_product_ScrollView1.contentSize=CGSizeMake(768,2144);
            UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0,1050, 0.0);
            Details_product_ScrollView1.contentInset = contentInsets;
            [self portraitOrientation];
        }
    }else{
        // self.view = self.landscapeView;
        if(orientation ==UIInterfaceOrientationLandscapeLeft){
            NSLog(@"Changed Orientation To Landscape left");
            Details_product_ScrollView1.delegate = self;
            UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, 1200, 0.0);
            Details_product_ScrollView1.contentInset = contentInsets;
            Details_product_ScrollView1.contentSize=CGSizeMake(1024,1888);
            
            [self landscapeLeftOrientation];
        }else{
            NSLog(@"Changed Orientation To Landscape right");
            UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, 1200, 0.0);
            Details_product_ScrollView1.contentInset = contentInsets;

            Details_product_ScrollView1.contentSize=CGSizeMake(1024,1888);
            
            [self landscapeRightOrientation];
        }
        
    }
    }
    // Do any additional setup after loading the view from its nib.
}

-(void)inputAccessoryViewDidFinish123456
{
    [exp_years resignFirstResponder];
    [exp_sal becomeFirstResponder];
    
}
-(void)inputAccessoryViewDidFinishl
{
    [mob_no becomeFirstResponder];
}
-(void)inputAccessoryViewDidFinishm
{
    [driving_license becomeFirstResponder];
}
-(void)inputAccessoryViewDidFinishs
{
    //[exp_sal resignFirstResponder];
    [resumesummary becomeFirstResponder];
}
-(void)inputAccessoryViewDidFinish1
{
    gender.text=[arrAgeRanges objectAtIndex:[self.pickerAge selectedRowInComponent:0]];
    [gender resignFirstResponder];
    
}
-(void)inputAccessoryViewDidFinish2
{
    [gender resignFirstResponder];
}

#pragma mark - UIPickerView method implementation

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.arrAgeRanges.count;
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
       return [self.arrAgeRanges objectAtIndex:row];
}





-(void)showPopover1:(id)sender forEvent:(UIEvent*)event
{
     [self.view endEditing:YES];
    calender *testViewController = [[calender alloc] initWithNibName:@"calender" bundle:nil];
    testViewController.delegate = self;
    
   
       
        
        [UIView animateWithDuration:0.3 animations:^{
        popview=[[UIView alloc] initWithFrame: CGRectMake(0, 60,319,200)];
        }];
        [popview addSubview:testViewController.view];
        [self.Details_product_ScrollView1 addSubview:popview];
        
   
        self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
        //  _userDataPopover.frame = CGRectMake(0,0, 250, 200);
        self.userDataPopover.popoverContentSize = CGSizeMake(320, 226);
        
        [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
                                              inView:self.Details_product_ScrollView1
                            permittedArrowDirections:UIPopoverArrowDirectionAny
                                            animated:YES];
  
    
    
}
-(void)calenderpro:(NSString *)picker
{
    date_birth.text=picker;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        
    }
    else
    {
    [self.userDataPopover dismissPopoverAnimated:YES];
    }
    
}
-(void)calenderpro1
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        
    }
    else
    {
    [self.userDataPopover dismissPopoverAnimated:YES];
    }
}

-(void)showPopover:(id)sender forEvent:(UIEvent*)event
{
    [self.view endEditing:YES];
     genderview *testViewController = [[genderview alloc] initWithNibName:@"genderview" bundle:nil];
    testViewController.delegate = self;
    
    
    self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
    //  _userDataPopover.frame = CGRectMake(0,0, 250, 200);
    self.userDataPopover.popoverContentSize = CGSizeMake(320, 226);
    
    [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
                                          inView:self.Details_product_ScrollView1
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
    
}

-(void)showde:(id)sender forEvent:(UIEvent*)event
{
    [self.view endEditing:YES];
    [gender resignFirstResponder];
   
 
}




-(void)genderviewpro:(NSString *)picker
{
    gender.text=picker;
    
    [self.userDataPopover dismissPopoverAnimated:YES];
    
}
-(void)genderviewpro1
{
    [self.userDataPopover dismissPopoverAnimated:YES];
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
    Details_product_ScrollView1.scrollEnabled=YES;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, 1200, 0.0);
    Details_product_ScrollView1.contentInset = contentInsets;

    Details_product_ScrollView1.contentSize=CGSizeMake(1024,1888);
   }
-(void)landscapeRightOrientation{
    
    // Rotates the view.
    Details_product_ScrollView1.scrollEnabled=YES;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, 1200, 0.0);
    Details_product_ScrollView1.contentInset = contentInsets;

    Details_product_ScrollView1.contentSize=CGSizeMake(1024,1888);
   }
-(void)portraitOrientation{
    
    // Rotates the view.
    Details_product_ScrollView1.scrollEnabled=YES;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0,1050, 0.0);
    Details_product_ScrollView1.contentInset = contentInsets;
    Details_product_ScrollView1.contentSize=CGSizeMake(768,2144);
   // Details_product_ScrollView1.scrollEnabled=YES;
  
}
-(void)portraitUpsideDownOrientation{
    
    
   }


- (void) keyboardWillHide:(NSNotification *)notification {
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    Details_product_ScrollView1.contentInset = contentInsets;
    Details_product_ScrollView1.scrollIndicatorInsets = contentInsets;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)submit:(id)sender
{
     NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    
    if ([firstname.text isEqualToString:@""] || lastname.text.length==0 || [username.text isEqualToString:@""] || password.text.length==0 || [gender.text isEqualToString:@""] || date_birth.text.length==0 || [nationality.text isEqualToString:@""] || country.text.length==0|| address.text.length==0|| lan.text.length==0 || mob_no.text.length==0|| driving_license.text.length==0 ||highest_qualification.text.length==0 || major.text.length==0 || quali_area.text.length==0 || exp_years.text.length==0 || exp_sal.text.length==0 || resumesummary.text.length==0) {
        
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Kindly fill all details" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrt show];
        
    }
    
    //Valid email address
    else if  ([emailTest evaluateWithObject:username.text] == NO)
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
     
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            
            //back to the main thread for the UI call
            dispatch_async(dispatch_get_main_queue(), ^{
                [spinner startAnimating];
            });
        
        
        
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/career_registration.php"]];
        // create the Method "GET" or "POST"
        
        [request setHTTPMethod:@"POST"];
        
        //Pass The String to server
    //Pass The String to server
    NSString *userUpdate =[NSString stringWithFormat:@"first_name=%@&last_name=%@&email=%@&password=%@&gender=%@&date_of_birth=%@&nationality=%@&current_country=%@&current_address=%@&telephone=%@&mobile_number=%@&driving_licence=%@&highest_qualification=%@&major=%@&functional_area=%@&years_of_experience=%@&expected_salary=%@&resume_summary=%@resume_url1=%@&resume_url2=%@&resume_url3=%@&resume_url4=%@&resume_url5=%@",firstname.text,lastname.text,username.text,password.text,gender.text,date_birth.text,nationality.text,country.text,address.text,lan.text,mob_no.text,driving_license.text,highest_qualification.text,major.text,quali_area.text,exp_years.text,exp_sal.text,resumesummary.text,myString,myString1,myString2,myString3,myString4,nil];
    

    
        //Check The Value what we passed
        NSLog(@"the data Details is =%@", userUpdate);
        
        //Convert the String to Data
        NSData *data1 = [userUpdate dataUsingEncoding:NSUTF8StringEncoding];
        
        //Apply the data to the body
        [request setHTTPBody:data1];
        
        //Create the response and Error
        
        NSError *err;
        NSURLResponse *response;
        
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
        
        NSString *resSrt = [[NSString alloc]initWithData:responseData encoding:NSASCIIStringEncoding];
        
        //This is for Response
        NSLog(@"got response==%@", resSrt);
        
        if(resSrt.length>0)
        {
            NSLog(@"got response");
            
            NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error: &err];
           newstring= jsonArray1[@"error_message"] ;
            
            NSLog(@"the err=%@",newstring);
            
//            if ([jsonArray isEqualToString:@"Registered Sucessfully"]) {
//                
//                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:jsonArray  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                [alert show];
//            }
//            else
//            {
            
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:newstring  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            alert.tag=10;
                [alert show];
                
//            }
            
            
            
        }
        else
        {
            NSLog(@"faield to connect");
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Network Failed!"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        
        
            dispatch_async(dispatch_get_main_queue(), ^{
                [spinner stopAnimating];
            });
        });
        
        
        
   }
    

}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==40) {
        if ([newstring isEqualToString:@"Registered Sucessfully"]) {
            [self.navigationController popViewControllerAnimated:YES];
            
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
-(IBAction)back:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    
    if (textField==firstname)
    {
        [lastname becomeFirstResponder];
    }
    if (textField==lastname)
    {
        [username becomeFirstResponder];
    }
    if (textField==username)
    {
        [password becomeFirstResponder];
    }
    if (textField==password)
    {
        [gender becomeFirstResponder];
    }
   if (textField==gender)
    {
        [date_birth becomeFirstResponder];
    }
    if (textField==date_birth)
    {
        [nationality becomeFirstResponder];
    }
    if (textField==nationality)
    {
        [country becomeFirstResponder];
    }
    if (textField==country)
    {
        [address becomeFirstResponder];
    }
    if (textField==address)
    {
        [lan becomeFirstResponder];
    }
    
    if (textField==lan)
    {
        [mob_no becomeFirstResponder];
    }
    if (textField==mob_no)
    {
        [driving_license becomeFirstResponder];
    }
    if (textField==driving_license)
    {
        [highest_qualification becomeFirstResponder];
    }
    
    if (textField==highest_qualification)
    {
        [major becomeFirstResponder];
    }
    if (textField==major)
    {
        [quali_area becomeFirstResponder];
    }
    if (textField==quali_area)
    {
        [exp_years becomeFirstResponder];
    }
    if (textField==exp_years)
    {
        [exp_sal becomeFirstResponder];
    }
    if (textField==resumesummary)
    {
        [resumesummary resignFirstResponder];
    }


   /// [textField resignFirstResponder];
//    firstname.layer.borderWidth = 1.0f;
//    firstname.layer.borderColor = [[UIColor whiteColor] CGColor];
//    firstname.layer.cornerRadius = 5;
//
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // firstname.layer.borderColor = [[UIColor blueColor] CGColor];
    [firstname resignFirstResponder];
    [lastname resignFirstResponder];
    [username resignFirstResponder];
    [mob_no resignFirstResponder];
    [driving_license resignFirstResponder];
    [nationality resignFirstResponder];
    [country resignFirstResponder];
    [highest_qualification resignFirstResponder];
    [exp_sal resignFirstResponder];
    [major resignFirstResponder];
    [exp_years resignFirstResponder];
    [summary resignFirstResponder];
    [lan resignFirstResponder];
    [date_birth resignFirstResponder];
    [password resignFirstResponder];

    
    
    
    [self.view endEditing:YES];
}



- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if (textField==date_birth) {
        
        if(self.picker1 == nil) {
            
            [date_birth resignFirstResponder];
            self.picker1 = [[UIDatePicker alloc] init];
            self.picker1.tag =42;
            
           // [self.picker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
           [self.view addSubview:self.picker1];
            
        }
        self.date_birth.inputView = self.picker1;
        
         }
    if (textField== gender) {
        
        if(self.pickerAge == nil) {
            
            [gender resignFirstResponder];
            self.pickerAge = [[UIPickerView alloc] init];
            self.picker1.tag =42;
             [self.view addSubview:self.pickerAge];

        }
        self.gender.inputView=self.pickerAge;
    }

    return YES;
}

-(void)inputAccessoryViewDidFinish
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //  _picker1.datePickerMode = UIDatePickerModeDateAndTime;
    _picker1.datePickerMode = UIDatePickerModeDate;
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:self.picker1.date];
    self.date_birth.text = strDate;
    

    [self.date_birth resignFirstResponder];
    
}

-(void)inputAccessoryViewDidFinish0
{
    
    
    [self.date_birth resignFirstResponder];
    
}


- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //  _picker1.datePickerMode = UIDatePickerModeDateAndTime;
    _picker1.datePickerMode = UIDatePickerModeDate;
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:self.picker1.date];

    self.date_birth.text = strDate;
    
  
    
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
   
  /*  CGRect textFieldRect =
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
    
    [UIView commitAnimations];*/
}

- (void)textFieldDidEndEditing:(UITextField *)textField

{
   /* CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];*/
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

-(void) textViewDidChange:(UITextView *)textView
{
   /*
    if(add.text.length == 0){
        add.textColor = [UIColor whiteColor];
        add.text = @"Enter Address";
        [textView resignFirstResponder];
     
    }
    if(summary.text.length == 0){
        summary.textColor = [UIColor whiteColor];
        summary.text = @"Enter Address";
        [textView resignFirstResponder];
        
    }*/
}
-(IBAction)selectimg:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.view.tag=100;
    [self presentViewController:picker animated:YES completion:nil];
}

-(IBAction)selectimg1:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
     picker.view.tag=200;
    [self presentViewController:picker animated:YES completion:nil];

}

-(IBAction)selectimg2:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.view.tag=300;
    [self presentViewController:picker animated:YES completion:nil];

 
}

-(IBAction)selectimg3:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.view.tag=400;
    [self presentViewController:picker animated:YES completion:nil];
 
}

-(IBAction)selectimg4:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.view.tag=500;
    [self presentViewController:picker animated:YES completion:nil];

}




- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    if(picker.view.tag==100) {
            
     
            imageView.image = image;
            
            NSData *imageData = UIImagePNGRepresentation(imageView.image);
            
            
            myString = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    }

   if(picker.view.tag==200) {
        
        
        imageView1.image = image;
        
        NSData *imageData = UIImagePNGRepresentation(imageView1.image);
        
        
        myString1 = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    }
    

   if(picker.view.tag==300) {
        
        
        imageView2.image = image;
        
        NSData *imageData = UIImagePNGRepresentation(imageView2.image);
        
        
        myString2 = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    }
    
  if(picker.view.tag==400) {
        
        
        imageView3.image = image;
        
        NSData *imageData = UIImagePNGRepresentation(imageView3.image);
        
        
        myString3 = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    }
    
    if(picker.view.tag==500) {
        
        
        imageView4.image = image;
        
        NSData *imageData = UIImagePNGRepresentation(imageView3.image);
        
        
        myString4 = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    }
    


    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
