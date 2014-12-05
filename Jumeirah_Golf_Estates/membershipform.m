//
//  membershipform.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 11/10/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "membershipform.h"
#import "BackgroundLayer.h"
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;

@interface membershipform ()
{
    int intergerno;
    int membershipno;
    int cash;
    int spouse;
    int junior;
    int juvenile;
    NSString *url;
    UIToolbar *myToolbar;
    UIToolbar *myToolbar1;
    UIToolbar *myToolbar2;
    UIToolbar *myToolbar3;
    UIToolbar *myToolbar4;
    
    UIToolbar *myToolbar5;
    
    UIToolbar *myToolbar6;
    UIToolbar *myToolbar7;
    
    
}
@end

@implementation membershipform
@synthesize view1,view2,view3,v1_next,v1_pre,v2_next,v2_pre,v3_next,v3_pre,view4,btn_Addjunr,btn_Addjuven,btn_Annualmem,btn_Cash,btn_Cheque,btn_Corpgold,btn_Corpsilver,btn_Credit,btn_Debenmem,btn_Electroinc,btn_Exist,btn_Familmem,btn_Founf_mem,btn_ManualCred,btn_Mem_new,btn_Midmem,btn_Oversea,btn_Ownermem,btn_Submit,txt_Address,txt_Company,txt_Company1,txt_Date,txt_DOB,txt_DOB1,txt_DOB2,txt_DOB3,txt_Email,txt_Family,txt_Given,txt_Given1,txt_Junior,txt_Juvenile,txt_Mobile,txt_National,txt_Playing,txt_Playing1,txt_Playing2,txt_Playing3,txt_Sign,txt_SpouceN,Inter_1,inter_2,inter_3,lbl_Addjun,lbl_Addjuven,lbl_Exist,mem_no,Menu_Tab,mmembtno,userDataPopover,spouseck,junenileck,junior2,junior2text,junior_dob_lbl,junior_dob_txt,junior_han_lbl,junior_han_txt,juniorck,btn2_spouse,scroll,juneliplaying,juniledob,juniledobtxt,junilename,junileplayingtxt,juniletext,jr1,jr2,jr3,ju1,ju2,ju3;
- (void)viewDidLoad {
    [super viewDidLoad];
    view1.hidden=NO;
    view3.hidden=YES;
    view2.hidden=YES;
    
    view4.hidden=YES;
    lbl_Exist.hidden=YES;
    mem_no.hidden=YES;
    intergerno=0;
    membershipno=0;
    Inter_1.hidden=YES;
    cash=0;
    inter_2.hidden=YES;
    inter_3.hidden=YES;
    
    manage=[singleton share];
    
    manage.familycal=FALSE;
    manage.spousecal=FALSE;
    
    
    
    
    self.picker1 = [[UIDatePicker alloc] init]; // My solution
    self.picker1  = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 43, 320, 480)];
    
    _picker1.datePickerMode = UIDatePickerModeDate;
    
    
    
    
    
  //  self.picker2 = [[UIDatePicker alloc] init]; // My solution
    _picker2  = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 43, 320, 480)];
    
    _picker2.datePickerMode = UIDatePickerModeDate;
    
    
    
    
    
    
    CAGradientLayer *btnGradient = [BackgroundLayer blackWhiteGradient];
    btnGradient.frame = self.btn_Submit.bounds;
    btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.btn_Submit.layer insertSublayer:btnGradient atIndex:0];
    
    
    
    CAGradientLayer *btnGradient2 = [BackgroundLayer blackWhiteGradient];
    btnGradient2.frame = self.v1_next.bounds;
    btnGradient2.cornerRadius=5;
    btnGradient2.borderWidth=1.0;
    btnGradient2.borderColor=([UIColor whiteColor]).CGColor;
    [self.v1_next.layer insertSublayer:btnGradient2 atIndex:0];
    
    
    CAGradientLayer *btnGradient3 = [BackgroundLayer blackWhiteGradient];
    btnGradient3.frame = self.v2_next.bounds;
    btnGradient3.cornerRadius=5;
    btnGradient3.borderWidth=1.0;
    btnGradient3.borderColor=([UIColor whiteColor]).CGColor;
    [self.v2_next.layer insertSublayer:btnGradient3 atIndex:0];
    
    
    CAGradientLayer *btnGradient4 = [BackgroundLayer blackWhiteGradient];
    btnGradient4.frame = self.v2_pre.bounds;
    btnGradient4.cornerRadius=5;
    btnGradient4.borderWidth=1.0;
    btnGradient4.borderColor=([UIColor whiteColor]).CGColor;
    [self.v2_pre.layer insertSublayer:btnGradient4 atIndex:0];
    
    
    
    CAGradientLayer *btnGradient5 = [BackgroundLayer blackWhiteGradient];
    btnGradient5.frame = self.v3_pre.bounds;
    btnGradient5.cornerRadius=5;
    btnGradient5.borderWidth=1.0;
    btnGradient5.borderColor=([UIColor whiteColor]).CGColor;
    [self.v3_pre.layer insertSublayer:btnGradient5 atIndex:0];
    
    
    CAGradientLayer *btnGradient6 = [BackgroundLayer blackWhiteGradient];
    btnGradient6.frame = self.v3_next.bounds;
    btnGradient6.cornerRadius=5;
    btnGradient6.borderWidth=1.0;
    btnGradient6.borderColor=([UIColor whiteColor]).CGColor;
    [self.v3_next.layer insertSublayer:btnGradient6 atIndex:0];
    
    
    CAGradientLayer *btnGradient7 = [BackgroundLayer blackWhiteGradient];
    btnGradient7.frame = self.v4_pre.bounds;
    btnGradient7.cornerRadius=5;
    btnGradient7.borderWidth=1.0;
    btnGradient7.borderColor=([UIColor whiteColor]).CGColor;
    [self.v4_pre.layer insertSublayer:btnGradient7 atIndex:0];
    
    
    
    
    
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    scroll.delegate=self;
    scroll.scrollEnabled=YES;
    scroll.contentSize=CGSizeMake(320,950);
    
    
    
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
        [myToolbar setItems:[NSArray arrayWithObjects: doneButton,sp,cancelbutton,nil] animated:NO];
        txt_DOB.inputAccessoryView = myToolbar;
        
        
        
        myToolbar1 = [[UIToolbar alloc] initWithFrame:
                      CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
        UIBarButtonItem *doneButton1 =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                      target:self action:@selector(inputAccessoryViewDidFinish1)];
        
        UIBarButtonItem *cancelbutton1= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                      target:self action:@selector(inputAccessoryViewDidFinish01)];
        
        UIBarButtonItem *sp1= [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                            target:self action:nil];
        [myToolbar1 setItems:[NSArray arrayWithObjects: doneButton1,sp1,cancelbutton1,nil] animated:NO];
        
        
        txt_DOB1.inputAccessoryView = myToolbar1;
        
        
        myToolbar2 = [[UIToolbar alloc] initWithFrame:
                      CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
        UIBarButtonItem *doneButton2 =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                      target:self action:@selector(inputAccessoryViewDidFinish12)];
        
        UIBarButtonItem *cancelbutton2= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                      target:self action:@selector(inputAccessoryViewDidFinish012)];
        
        UIBarButtonItem *sp2= [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                            target:self action:nil];
        [myToolbar2 setItems:[NSArray arrayWithObjects: doneButton2,sp2,cancelbutton2,nil] animated:NO];
        
        
        junior_dob_txt.inputAccessoryView = myToolbar2;
        
        
        
        
        myToolbar3 = [[UIToolbar alloc] initWithFrame:
                      CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
        UIBarButtonItem *doneButton21 =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                      target:self action:@selector(inputAccessoryViewDidFinish121)];
        
        UIBarButtonItem *cancelbutton21= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                       target:self action:@selector(inputAccessoryViewDidFinish0121)];
        
        UIBarButtonItem *sp21= [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                             target:self action:nil];
        [myToolbar3 setItems:[NSArray arrayWithObjects: doneButton21,sp21,cancelbutton21,nil] animated:NO];
        
        
        txt_DOB2.inputAccessoryView = myToolbar3;
        
        
        
        myToolbar4 = [[UIToolbar alloc] initWithFrame:
                      CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
        UIBarButtonItem *doneButton4 =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                      target:self action:@selector(inputAccessoryViewDidFinish4)];
        
        UIBarButtonItem *cancelbutton4= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                      target:self action:@selector(inputAccessoryViewDidFinish04)];
        
        UIBarButtonItem *sp4= [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                            target:self action:nil];
        [myToolbar4 setItems:[NSArray arrayWithObjects: doneButton4,sp4,cancelbutton4,nil] animated:NO];
        
        
        txt_DOB3.inputAccessoryView = myToolbar4;
        
        
        myToolbar5 = [[UIToolbar alloc] initWithFrame:
                      CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
        UIBarButtonItem *doneButton41 =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                      target:self action:@selector(inputAccessoryViewDidFinish41)];
        
        UIBarButtonItem *cancelbutton41= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                       target:self action:@selector(inputAccessoryViewDidFinish041)];
        
        UIBarButtonItem *sp41= [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                             target:self action:nil];
        [myToolbar5 setItems:[NSArray arrayWithObjects: doneButton41,sp41,cancelbutton41,nil] animated:NO];
        
        
        juniledobtxt.inputAccessoryView = myToolbar5;
        
        
        
        myToolbar6 = [[UIToolbar alloc] initWithFrame:
                      CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
        
        
        UIBarButtonItem *cancelbutton48= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                       target:self action:@selector(inputAccessoryViewDidFinish589)];
        [myToolbar6 setItems:[NSArray arrayWithObjects:cancelbutton48,nil] animated:NO];
        
        
        txt_Mobile.inputAccessoryView = myToolbar6;
        
        
        
        
        
        
        myToolbar7 = [[UIToolbar alloc] initWithFrame:
                      CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
        
        
        UIBarButtonItem *cancelbutton50= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                       target:self action:@selector(inputAccessoryViewDidFinish50)];
        [myToolbar7 setItems:[NSArray arrayWithObjects:cancelbutton50,nil] animated:NO];
        
        
        txt_Address.inputAccessoryView = myToolbar7;
        
       }
    else
    {
        
        [mmembtno addTarget:self action:@selector(showPopover:forEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        [jr1 addTarget:self action:@selector(showPopovera:forEvent:) forControlEvents:UIControlEventTouchUpInside];
        [jr2 addTarget:self action:@selector(showPopoverb:forEvent:) forControlEvents:UIControlEventTouchUpInside];
        [ju1 addTarget:self action:@selector(showPopoverc:forEvent:) forControlEvents:UIControlEventTouchUpInside];
        [ju2 addTarget:self action:@selector(showPopoverd:forEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        [btn2_spouse addTarget:self action:@selector(showPopover1:forEvent:) forControlEvents:UIControlEventTouchUpInside];
        
        
        //  show1.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
    }
    [btn_Exist setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    [btn_Mem_new setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    [btn_Founf_mem setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    
    [btn_Ownermem setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    
    [btn_Debenmem setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    [btn_Annualmem setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    
    [btn_Familmem setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    
    [btn_Midmem setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    
    [btn_Corpgold setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    [btn_Addjunr setBackgroundImage:[UIImage imageNamed:@"newplus.png"] forState:UIControlStateNormal];
    [btn_Corpsilver setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    [btn_Oversea setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    
    
    
    [btn_Cash setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    [btn_Cheque setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    [btn_Electroinc setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    [btn_Credit setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    [btn_ManualCred setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    
    
    [spouseck setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    [juniorck setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    [junenileck setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    
    
    [self getcontactdetails];
    
    //  [btn_Ownermem setBackgroundImage:[UIImage imageNamed:@"c_box.png"] forState:UIControlStateNormal];
    // [btn_Corpgold setBackgroundImage:[UIImage imageNamed:@"c_box.png"] forState:UIControlStateNormal];
    // Do any additional setup after loading the view from its nib.
}
-(void)getcontactdetails
{
    
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/golf_membership_registration_form.php"]] ];
    
    [request setHTTPMethod:@"GET"];
    
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (con) {
        NSLog(@"data sent ");
    } else
    {
        NSLog(@"Not sent");
    }
    [con start];
    
    
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if (receivedData == NULL) {
        receivedData = [[NSMutableData alloc] init];
    }
    [receivedData setLength:0];}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [error userInfo][NSURLErrorFailingURLStringErrorKey]);
    UIAlertView *customAlert = [[UIAlertView alloc]initWithTitle:@"No NetWork" message:@"Interet Connection is Lost" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [customAlert show];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    
    NSError *e = nil;
    
    NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:receivedData options: NSJSONReadingMutableContainers error: &e];
    NSLog(@"%@",jsonArray1);
    
    
    
    
    if (jsonArray1) {
        
        NSArray *jsonArray2 =jsonArray1[@"Golf Membership Registration Form"];
        
        url=jsonArray2[0][@"url_path"];
        NSLog(@"%@",url);
        for (NSDictionary *tmp in jsonArray2)
        {
            NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
            
            [itemshowdetails setValue:tmp[@"title"] forKey:@"title"];
            [itemshowdetails setValue:tmp[@"url_path"] forKey:@"url_path"];
            
            
            //title
            
            [self.itemshowdetailsAr addObject:itemshowdetails];
            
        }
        
    }    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"no network"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if (textField==txt_DOB) {
        
        if(self.picker1 == nil) {
            
            [txt_DOB resignFirstResponder];
            self.picker1 = [[UIDatePicker alloc] init];
            self.picker1.tag =42;
            
            [self.view addSubview:self.picker1];
            
        }
        txt_DOB.inputView = _picker1;
        // [self.picker1 addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
        
        //  [self.picker1 addTarget:self action:@selector(inputAccessoryViewDidFinish:) forControlEvents:UIControlEventValueChanged];
        
        // [txt_DOB removeFromSuperview];
        //[txt_DOB becomeFirstResponder];
        
    }
    
    if (textField==txt_DOB1) {
        
        [txt_DOB1 resignFirstResponder];
        self.picker2 = [[UIDatePicker alloc] init];
        self.picker2.datePickerMode=UIDatePickerModeDate;
        
        self.picker2.tag =42;
        
        [self.Inter_1 addSubview:self.picker2];
        txt_DOB1.inputView = _picker2;
        
    }
    if (textField==txt_DOB2) {
        
        [txt_DOB1 resignFirstResponder];
        self.picker2 = [[UIDatePicker alloc] init];
        self.picker2.datePickerMode=UIDatePickerModeDate;
        self.picker2.tag =42;
        
        [self.Inter_1 addSubview:self.picker2];
        txt_DOB2.inputView = _picker2;
        
    }
    
    
    if (textField==junior_dob_txt) {
        
        [junior_dob_txt resignFirstResponder];
        self.picker2 = [[UIDatePicker alloc] init];
        self.picker2.datePickerMode=UIDatePickerModeDate;
        self.picker2.tag =42;
        
        [self.Inter_1 addSubview:self.picker2];
        junior_dob_txt.inputView = _picker2;
        
    }
    
    
    
    
    if (textField==txt_DOB3) {
        
        [txt_DOB1 resignFirstResponder];
        self.picker2 = [[UIDatePicker alloc] init];
        self.picker2.datePickerMode=UIDatePickerModeDate;
        self.picker2.tag =42;
        
        [self.Inter_1 addSubview:self.picker2];
        txt_DOB3.inputView = _picker2;
        
    }
    
    
    if (textField==juniledobtxt) {
        
        [junior_dob_txt resignFirstResponder];
        self.picker2 = [[UIDatePicker alloc] init];
        self.picker2.datePickerMode=UIDatePickerModeDate;
        self.picker2.tag =42;
        
        [self.Inter_1 addSubview:self.picker2];
        juniledobtxt.inputView = _picker2;
        
    }
    
    return YES;
}
- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:datePicker.date];
    self.txt_DOB.text = strDate;
}
-(void)inputAccessoryViewDidFinish
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //  _picker1.datePickerMode = UIDatePickerModeDateAndTime;
    _picker1.datePickerMode = UIDatePickerModeDate;
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:self.picker1.date];
    txt_DOB.text = strDate;
    
    
    [txt_DOB resignFirstResponder];
    
    
    
}
-(BOOL) textFieldShouldReturn: (UITextField *) textField
{
    if (textField==mem_no) {
        [mem_no resignFirstResponder];
    }
    
    if (textField==txt_Family) {
        [txt_Given becomeFirstResponder];
    }
    
    if (textField==txt_Given) {
        [txt_Given resignFirstResponder];
    }
    if (textField==txt_Playing) {
        [txt_Company becomeFirstResponder];
    }
    if (textField==txt_Company) {
        [txt_Mobile becomeFirstResponder];
    }
    if (textField==txt_Mobile) {
        [txt_Email becomeFirstResponder];
    }
    if (textField==txt_Email) {
        [txt_National becomeFirstResponder];
    }
    
    if (textField==txt_National) {
        [txt_Address becomeFirstResponder];
    }
    if (textField==txt_Company1) {
        [txt_Company1 resignFirstResponder];
    }
    if (textField==txt_DOB1) {
        [txt_Company1 resignFirstResponder];
    }
    if (textField==txt_DOB2) {
        [txt_DOB2 resignFirstResponder];
    }
    if (textField==txt_DOB3) {
        [txt_DOB3 resignFirstResponder];
    }
    
    if (textField==txt_Given1) {
        [txt_Given1 resignFirstResponder];
    }
    if (textField==juniledobtxt) {
        [juniledobtxt resignFirstResponder];
    }
    if (textField==junileplayingtxt) {
        [junileplayingtxt resignFirstResponder];
    }
    if (textField==juniletext) {
        [juniletext resignFirstResponder];
    }
    if (textField==junior2text) {
        [junior2text resignFirstResponder];
    }
    if (textField==junior_han_txt) {
        [junior_han_txt resignFirstResponder];
    }
    if (textField==txt_Playing2) {
        [txt_Playing2 resignFirstResponder];
    }
    if (textField==txt_Playing3) {
        [txt_Playing3 resignFirstResponder];
    }
    if (textField==txt_Sign) {
        [txt_Sign resignFirstResponder];
    }
    if (textField==txt_Date) {
        [txt_Date resignFirstResponder];
    }
    if (textField==txt_SpouceN) {
        [txt_SpouceN resignFirstResponder];
    }
    if (textField==txt_Playing1) {
        [txt_Playing1 resignFirstResponder];
    }
    if (textField==txt_Junior) {
        [txt_Junior resignFirstResponder];
    }
    if (textField==txt_Juvenile) {
        [txt_Juvenile resignFirstResponder];
    }
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
    [view2 endEditing:YES];
}

-(void)inputAccessoryViewDidFinish0
{
    
    
    [txt_DOB resignFirstResponder];
    
}
-(void)inputAccessoryViewDidFinish1
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //  _picker1.datePickerMode = UIDatePickerModeDateAndTime;
    _picker2.datePickerMode = UIDatePickerModeDate;
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:self.picker2.date];
    
    txt_DOB1.text = strDate;
    
    
    [txt_DOB1 resignFirstResponder];
    
    
}

-(void)inputAccessoryViewDidFinish01
{
    
    
    [txt_DOB1 resignFirstResponder];
    
}
-(void)inputAccessoryViewDidFinish12
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //  _picker1.datePickerMode = UIDatePickerModeDateAndTime;
    _picker2.datePickerMode = UIDatePickerModeDate;
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:self.picker2.date];
    
    junior_dob_txt.text = strDate;
    
    
    [junior_dob_txt resignFirstResponder];
    
    
}

-(void)inputAccessoryViewDidFinish012
{
    
    
    [junior_dob_txt resignFirstResponder];
    
}
-(void)inputAccessoryViewDidFinish121
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //  _picker1.datePickerMode = UIDatePickerModeDateAndTime;
    _picker2.datePickerMode = UIDatePickerModeDate;
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:self.picker2.date];
    
    txt_DOB2.text = strDate;
    
    
    [txt_DOB2 resignFirstResponder];
    
    
}

-(void)inputAccessoryViewDidFinish0121
{
    
    
    [txt_DOB2 resignFirstResponder];
    
}
-(void)inputAccessoryViewDidFinish4
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //  _picker1.datePickerMode = UIDatePickerModeDateAndTime;
    _picker2.datePickerMode = UIDatePickerModeDate;
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:self.picker2.date];
    
    txt_DOB3.text = strDate;
    
    
    [txt_DOB3 resignFirstResponder];
    
    
}

-(void)inputAccessoryViewDidFinish04
{
    
    
    [txt_DOB3 resignFirstResponder];
    
}
-(void)inputAccessoryViewDidFinish41
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //  _picker1.datePickerMode = UIDatePickerModeDateAndTime;
    _picker2.datePickerMode = UIDatePickerModeDate;
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:self.picker2.date];
    
    juniledobtxt.text = strDate;
    
    
    [juniledobtxt resignFirstResponder];
    
    
}

-(void)inputAccessoryViewDidFinish041
{
    
    
    [juniledobtxt resignFirstResponder];
    
}
-(void)inputAccessoryViewDidFinish589
{
    
    
    [txt_Mobile resignFirstResponder];
    
}
-(void)inputAccessoryViewDidFinish50
{
    
    
    [txt_Address resignFirstResponder];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)showPopover:(id)sender forEvent:(UIEvent*)event
{
    [self.view endEditing:YES];
    calender *testViewController = [[calender alloc] initWithNibName:@"calender" bundle:nil];
    testViewController.delegate = self;
    
    
    
    
    [UIView animateWithDuration:0.3 animations:^{
        popview=[[UIView alloc] initWithFrame: CGRectMake(0, 60,319,200)];
    }];
    [popview addSubview:testViewController.view];
    [self.view2 addSubview:popview];
    
    
    self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
    //  _userDataPopover.frame = CGRectMake(0,0, 250, 200);
    self.userDataPopover.popoverContentSize = CGSizeMake(320, 226);
    
    [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
                                          inView:self.view2
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
    
    
    
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
    [self.Inter_1 addSubview:popview];
    
    
    self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
    //  _userDataPopover.frame = CGRectMake(0,0, 250, 200);
    self.userDataPopover.popoverContentSize = CGSizeMake(320, 226);
    
    [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
                                          inView:self.Inter_1
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
    
    
    
}

-(void)showPopovera:(id)sender forEvent:(UIEvent*)event
{
    manage.juniorcal=FALSE;
    manage.juniorcaladd=TRUE;
    [self.view endEditing:YES];
    calender *testViewController = [[calender alloc] initWithNibName:@"calender" bundle:nil];
    testViewController.delegate = self;
    [UIView animateWithDuration:0.3 animations:^{
        popview=[[UIView alloc] initWithFrame: CGRectMake(0, 60,319,200)];
    }];
    [popview addSubview:testViewController.view];
    [self.inter_2 addSubview:popview];
    
    
    self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
    //  _userDataPopover.frame = CGRectMake(0,0, 250, 200);
    self.userDataPopover.popoverContentSize = CGSizeMake(320, 226);
    
    [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
                                          inView:self.inter_2
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
    
    
    
}
-(void)showPopoverb:(id)sender forEvent:(UIEvent*)event
{
    manage.juniorcaladd=FALSE;
    [self.view endEditing:YES];
    calender *testViewController = [[calender alloc] initWithNibName:@"calender" bundle:nil];
    testViewController.delegate = self;
    [UIView animateWithDuration:0.3 animations:^{
        popview=[[UIView alloc] initWithFrame: CGRectMake(0, 60,319,200)];
    }];
    [popview addSubview:testViewController.view];
    [self.inter_2 addSubview:popview];
    
    
    self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
    //  _userDataPopover.frame = CGRectMake(0,0, 250, 200);
    self.userDataPopover.popoverContentSize = CGSizeMake(320, 226);
    
    [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
                                          inView:self.inter_2
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
    
    
    
}
-(void)showPopoverc:(id)sender forEvent:(UIEvent*)event
{
    manage.juvcal=FALSE;
    manage.juvcaladd=TRUE;
    [self.view endEditing:YES];
    calender *testViewController = [[calender alloc] initWithNibName:@"calender" bundle:nil];
    testViewController.delegate = self;
    [UIView animateWithDuration:0.3 animations:^{
        popview=[[UIView alloc] initWithFrame: CGRectMake(0, 60,319,200)];
    }];
    [popview addSubview:testViewController.view];
    [self.inter_3 addSubview:popview];
    
    
    self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
    //  _userDataPopover.frame = CGRectMake(0,0, 250, 200);
    self.userDataPopover.popoverContentSize = CGSizeMake(320, 226);
    
    [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
                                          inView:self.inter_3
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
    
    
    
}
-(void)showPopoverd:(id)sender forEvent:(UIEvent*)event
{
    manage.juvcaladd=FALSE;
    [self.view endEditing:YES];
    calender *testViewController = [[calender alloc] initWithNibName:@"calender" bundle:nil];
    testViewController.delegate = self;
    [UIView animateWithDuration:0.3 animations:^{
        popview=[[UIView alloc] initWithFrame: CGRectMake(0, 60,319,200)];
    }];
    [popview addSubview:testViewController.view];
    [self.inter_3 addSubview:popview];
    
    
    self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
    //  _userDataPopover.frame = CGRectMake(0,0, 250, 200);
    self.userDataPopover.popoverContentSize = CGSizeMake(320, 226);
    
    [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
                                          inView:self.inter_3
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
    
    
    
}






-(void)calenderpro:(NSString *)picker
{
    if ((manage.familycal==FALSE)) {
        
        txt_DOB.text=picker;
        manage.familycal=TRUE;
    }
    if ([[spouseck backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"ckbx.png"]] && manage.spousecal==FALSE)  {
        txt_DOB1.text=picker;
        manage.spousecal=TRUE;
    }
    
    NSLog(@"%hhd",manage.juniorcaladd);
    if ([[juniorck backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"ckbx.png"]]&& manage.juniorcal==FALSE)  {
        txt_DOB2.text=picker;
        manage.juniorcal=TRUE;
        
    }
    if ([[juniorck backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"ckbx.png"]]&&manage.juniorcaladd==FALSE)  {
        junior_dob_txt.text=picker;
        manage.juniorcaladd=TRUE;
    }
    if ([[junenileck backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"ckbx.png"]] && manage.juvcal==FALSE)  {
        txt_DOB3.text=picker;
        manage.juvcal=TRUE;
    }
    //juniledobtxt
    if ([[junenileck backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"ckbx.png"]]&&manage.juvcaladd==FALSE && manage.juvcal==TRUE)  {
        juniledobtxt.text=picker;
        manage.juvcaladd=TRUE;
    }
    
    
    
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

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
-(IBAction)View1action_Prev:(id)sender
{
    //nil
}
-(IBAction)View1action_Next:(id)sender
{
    NSLog(@"intergerno %d",intergerno);
    
    NSLog(@"intergerno %d",membershipno);
    
    //membershipno=membershipno-1;
    if (membershipno<=0) {
        
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"" message:@"Choose any one of membership type" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrt show];
    }
    else  if ([[btn_Exist backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"ckbx.png"]]) {
        if(mem_no.text.length==0 )
        {
            UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"" message:@"Fill member number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alrt show];
            
        }
        else if(intergerno<=0)
        {
            
            UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"" message:@"Choose any one from membership preferrence " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alrt show];
            
        }
        else
        {
            view1.hidden=YES;
            view3.hidden=YES;
            
            view4.hidden=YES;
            view2.hidden=NO;
        }
        
        
    }
    else
    { view1.hidden=YES;
        view3.hidden=YES;
        
        view4.hidden=YES;
        view2.hidden=NO;
        
    }
}
-(IBAction)View2action_Prev:(id)sender
{
    view1.hidden=NO;
    view3.hidden=YES;
    view2.hidden=YES;
    view4.hidden=YES;
    
}
-(IBAction)View2action_Next:(id)sender

{
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    //  NSLog(@"%@",ddText1);
    // if
    if (txt_Family.text.length==0 || [txt_Family.text isEqualToString:@""]||txt_DOB.text.length==0||[txt_DOB.text isEqualToString:@""] ||txt_Mobile.text.length==0||[txt_Mobile.text isEqualToString:@""]||txt_Email.text.length==0||[txt_Email.text isEqualToString:@""]) {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Kindly fill all details!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrt show];
        
    }
    else if  ([emailTest evaluateWithObject:txt_Email.text] == NO)
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Invalid Email Format!!" message:@"Ener the Correct Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrt show];
    }
    else
    {
        
        view1.hidden=YES;
        view3.hidden=NO;
        view2.hidden=YES;
        view4.hidden=YES;
    }
}
-(IBAction)View3action_Prev:(id)sender
{
    view1.hidden=YES;
    view3.hidden=YES;
    view2.hidden=NO;
    view4.hidden=YES;
}
-(IBAction)View3action_Next:(id)sender
{
    //nil
    
    if ([[spouseck backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"ckbx.png"]])
    {
        if (txt_SpouceN.text.length==0 || [txt_SpouceN.text isEqualToString:@""]||txt_DOB.text.length==0||[txt_DOB.text isEqualToString:@""] ) {
            self.Menu_Tab.selectedSegmentIndex=0;
            Inter_1.hidden=NO;
            
            inter_2.hidden=YES;
            inter_3.hidden=YES;
            UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Kindly fill all details!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alrt show];
            
        }
        else
        {
            view1.hidden=YES;
            view3.hidden=YES;
            view2.hidden=YES;
            view4.hidden=NO;
            
            
        }
    }
    else
        
    {
        
        
        view1.hidden=YES;
        view3.hidden=YES;
        view2.hidden=YES;
        view4.hidden=NO;
        
    }
    
}
-(IBAction)View4action_Prev:(id)sender
{
    view1.hidden=YES;
    view3.hidden=NO;
    view2.hidden=YES;
    view4.hidden=YES;
}
- (IBAction)btn_Exist_action:(id)sender {
    
    if ([[btn_Exist backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        // Button has a background image named 'myImage.png'
        
        
        [btn_Exist setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        lbl_Exist.hidden=NO;
        mem_no.hidden=NO;
        
        exist_mem=TRUE;
        membershipno=membershipno+1;
        
        if ([[btn_Mem_new backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"ckbx.png"]]) {
            [btn_Mem_new setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
            membershipno=membershipno-1;
        }
        
        
    }else{
        [btn_Exist setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
        lbl_Exist.hidden=YES;
        mem_no.hidden=YES;
        exist_mem=FALSE;
        
        membershipno=membershipno-1;
        
        // Button has not a background image named 'myImage.png'
    }
    NSLog(@"%hhd",exist_mem);
    
    
}


# pragma mark-new member


- (IBAction)btn_Mem_new_action:(id)sender {
    
    if ([[btn_Mem_new backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        // Button has a background image named 'myImage.png'
        
        new_mem=TRUE;
        [btn_Mem_new setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        membershipno=membershipno+1;
        if ([[btn_Exist backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"ckbx.png"]]) {
            [btn_Exist setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
            lbl_Exist.hidden=YES;
            mem_no.hidden=YES;
            membershipno=membershipno-1;
            exist_mem=FALSE;
        }
        
        
    }else{
        [btn_Mem_new setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
        membershipno=membershipno-1;
        new_mem=FALSE;
        
        // Button has not a background image named 'myImage.png'
    }
    
    NSLog(@"%hhd",new_mem);
    NSLog(@"%hhd",exist_mem);
    
    
}





- (IBAction)btn_Founf_mem_action:(id)sender {
    
    
    if ([[btn_Founf_mem backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        // Button has a background image named 'myImage.png'
        
        
        [btn_Founf_mem setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno+1;
        
        founder=TRUE;
        
        
        
    }else{
        [btn_Founf_mem setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno-1;
        founder=FALSE;
        
        // Button has not a background image named 'myImage.png'
    }
    
    
    
    
    
    
    
}
- (IBAction)btn_Ownermem_action:(id)sender {
    
    
    if ([[btn_Ownermem backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {        // Button has a background image named 'myImage.png'
        
        
        [btn_Ownermem setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno+1;
        home_own=TRUE;
        
        
    }else{
        [btn_Ownermem setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno-1;
        home_own=FALSE;
        // Button has not a background image named 'myImage.png'
    }
    
    
    
    
    
    
}
- (IBAction)btn_Debenmem_action:(id)sender {
    if ([[btn_Debenmem backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        // Button has a background image named 'myImage.png'
        
        
        [btn_Debenmem setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno+1;
        debenture=TRUE;
        
        
    }else{
        [btn_Debenmem setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno-1;
        debenture=FALSE;
        // Button has not a background image named 'myImage.png'
    }
    
}
- (IBAction)btn_Annualmem_action:(id)sender {
    if ([[btn_Annualmem backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        // Button has a background image named 'myImage.png'
        
        
        [btn_Annualmem setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno+1;
        annual=TRUE;
        
        
        
    }else{
        [btn_Annualmem setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno-1;
        annual=FALSE;
        // Button has not a background image named 'myImage.png'
    }
    
    
}
- (IBAction)btn_Familmem_action:(id)sender {
    
    if ([[btn_Familmem backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        // Button has a background image named 'myImage.png'
        
        
        [btn_Familmem setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno+1;
        family=TRUE;
        
        
    }else{
        [btn_Familmem setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno-1;
        family=FALSE;
        // Button has not a background image named 'myImage.png'
    }
    
    
    
}
- (IBAction)btn_Midmem_action:(id)sender {
    
    if ([[btn_Midmem backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        // Button has a background image named 'myImage.png'
        
        
        [btn_Midmem setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno+1;
        mid_week=TRUE;
        
        
    }else{
        [btn_Midmem setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno-1;
        mid_week=FALSE;
        // Button has not a background image named 'myImage.png'
    }
    
    
    
}
- (IBAction)btn_Corpgold_action:(id)sender {
    if ([[btn_Corpgold backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        // Button has a background image named 'myImage.png'
        
        
        [btn_Corpgold setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno+1;
        gold=TRUE;
        
        
    }else{
        [btn_Corpgold setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno-1;
        gold=FALSE;
        // Button has not a background image named 'myImage.png'
    }
    
    
}
- (IBAction)btn_Corpsilver_action:(id)sender {
    if ([[btn_Corpsilver backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        // Button has a background image named 'myImage.png'
        
        
        [btn_Corpsilver setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno+1;
        silver=TRUE;
        
        
    }else{
        [btn_Corpsilver setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno-1;
        silver=FALSE;
        // Button has not a background image named 'myImage.png'
    }
    
    
    
}
- (IBAction)btn_Oversea_action:(id)sender {
    if ([[btn_Oversea backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        // Button has a background image named 'myImage.png'
        
        
        [btn_Oversea setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno+1;
        over=TRUE;
        
        
    }else{
        [btn_Oversea setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
        intergerno=intergerno-1;
        over=FALSE;
        
        // Button has not a background image named 'myImage.png'
    }
    
    
    
}
- (IBAction)Menu_Tab_action:(id)sender {
    // switch (self.Menu_Tab.selectedSegmentIndex) {
    if (self.Menu_Tab.selectedSegmentIndex==0) {
        
        //
        //            if (txt_SpouceN.text.length==0 || [txt_SpouceN.text isEqualToString:@""]||txt_Given1.text.length==0||[txt_Given1.text isEqualToString:@""]||txt_Given.text.length==0 || [txt_Given.text isEqualToString:@""]||txt_DOB.text.length==0||[txt_DOB.text isEqualToString:@""] ||txt_DOB1.text.length==0||[txt_DOB1.text isEqualToString:@""]||txt_Playing1.text.length==0||[txt_Playing1.text isEqualToString:@""]||txt_Company1.text.length==0||[txt_Company1.text isEqualToString:@""]) {
        //                UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Kindly fill all details!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //                [alrt show];
        //
        //
        //            }
        //
        //            else
        //            {
        Inter_1.hidden=NO;
        
        inter_2.hidden=YES;
        inter_3.hidden=YES;
        //            }
    }
    else if(self.Menu_Tab.selectedSegmentIndex==1)
    {
        //          if (txt_SpouceN.text.length==0 || [txt_SpouceN.text isEqualToString:@""]||txt_Given1.text.length==0||[txt_Given1.text isEqualToString:@""]||txt_Given.text.length==0 || [txt_Given.text isEqualToString:@""]||txt_DOB.text.length==0||[txt_DOB.text isEqualToString:@""] ||txt_DOB1.text.length==0||[txt_DOB1.text isEqualToString:@""]||txt_Playing1.text.length==0||[txt_Playing1.text isEqualToString:@""]||txt_Company1.text.length==0||[txt_Company1.text isEqualToString:@""]) {
        //              self.Menu_Tab.selectedSegmentIndex=0;
        //              Inter_1.hidden=NO;
        //
        //              inter_2.hidden=YES;
        //              inter_3.hidden=YES;
        //              UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Kindly fill all details!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //              [alrt show];
        //
        //          }
        //
        //          else
        //          {
        //
        Inter_1.hidden=YES;
        
        inter_2.hidden=NO;
        inter_3.hidden=YES;
        //          }
        
    }
    else if(self.Menu_Tab.selectedSegmentIndex==2)
    {
        Inter_1.hidden=YES;
        
        inter_2.hidden=YES;
        inter_3.hidden=NO;
    }
    
    
    
    
    
    
}
- (IBAction)btn_Addjunr_action:(id)sender {
    
    if([[btn_Addjunr backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"newplus.png"]]) {
        [btn_Addjunr setBackgroundImage:[UIImage imageNamed:@"minus.png"] forState:UIControlStateNormal];
        
        junior2.hidden=NO;
        junior2text.hidden=NO;
        junior_dob_lbl.hidden=NO;
        junior_dob_txt.hidden=NO;
        junior_han_lbl.hidden=NO;
        junior_han_txt.hidden=NO;
        
        
    }
    else
    {
        [btn_Addjunr setBackgroundImage:[UIImage imageNamed:@"newplus.png"] forState:UIControlStateNormal];
        
        junior2.hidden=YES;
        junior2text.hidden=YES;
        junior_dob_lbl.hidden=YES;
        junior_dob_txt.hidden=YES;
        junior_han_lbl.hidden=YES;
        junior_han_txt.hidden=YES;
        
        
    }
    
    
    
    
    
}
- (IBAction)btn_Addjuven_action:(id)sender {
    if([[btn_Addjuven backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"newplus.png"]]) {
        [btn_Addjuven setBackgroundImage:[UIImage imageNamed:@"minus.png"] forState:UIControlStateNormal];
        
        juniledobtxt.hidden=NO;
        juneliplaying.hidden=NO;
        juniledob.hidden=NO;
        junileplayingtxt.hidden=NO;
        juniletext.hidden=NO;
        junilename.hidden=NO;
        
    }
    else
    {
        [btn_Addjuven setBackgroundImage:[UIImage imageNamed:@"newplus.png"] forState:UIControlStateNormal];
        
        juniledobtxt.hidden=YES;
        juneliplaying.hidden=YES;
        juniledob.hidden=YES;
        junileplayingtxt.hidden=YES;
        juniletext.hidden=YES;
        junilename.hidden=YES;
        
        
        
    }
    
    
}
- (IBAction)btn_Cash_action:(id)sender {
    
    
    if ([[btn_Cash backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        // Button has a background image named 'myImage.png'
        
        
        [btn_Cash setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        cash=cash+1;
        
        
    }else{
        [btn_Cash setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
        cash=cash-1;
        
        // Button has not a background image named 'myImage.png'
    }
    
    
    
    
    
    
    
    
    
}
- (IBAction)btn_Cheque_action:(id)sender {
    if ([[btn_Cheque backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        // Button has a background image named 'myImage.png'
        
        
        [btn_Cheque setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        cash=cash+1;
        
        
    }else{
        [btn_Cheque setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
        cash=cash-1;
        
        // Button has not a background image named 'myImage.png'
    }
    
    
    
    
}
- (IBAction)btn_Electroinc_action:(id)sender {
    if ([[btn_Electroinc backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        // Button has a background image named 'myImage.png'
        
        
        [btn_Electroinc setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        cash=cash+1;
        
        
    }else{
        [btn_Electroinc setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
        cash=cash-1;
        
        // Button has not a background image named 'myImage.png'
    }
    
    
    
}
- (IBAction)btn_Credit_action:(id)sender {
    if ([[btn_Credit backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        // Button has a background image named 'myImage.png'
        
        
        [btn_Credit setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        cash=cash+1;
        
        
    }else{
        [btn_Credit setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
        cash=cash-1;
        
        // Button has not a background image named 'myImage.png'
    }
    
    
}
- (IBAction)btn_ManualCred_action:(id)sender {
    if ([[btn_ManualCred backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        // Button has a background image named 'myImage.png'
        
        
        [btn_ManualCred setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        cash=cash+1;
        
        
    }else{
        [btn_ManualCred setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
        cash=cash-1;
        
        // Button has not a background image named 'myImage.png'
    }
    
    
    
}
- (IBAction)btn_Submit_action:(id)sender {
    
    
    if ([[spouseck backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"ckbx.png"]])
    {
        if (txt_SpouceN.text.length==0 || [txt_SpouceN.text isEqualToString:@""]||txt_DOB.text.length==0||[txt_DOB.text isEqualToString:@""] ) {
            self.Menu_Tab.selectedSegmentIndex=0;
            Inter_1.hidden=NO;
            
            inter_2.hidden=YES;
            inter_3.hidden=YES;
            UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Kindly fill all details!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alrt show];
            
        }
    }
  if ([[junenileck backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"ckbx.png"]])
    {
        if (txt_Juvenile.text.length==0 || [txt_Juvenile.text isEqualToString:@""]||txt_DOB3.text.length==0||[txt_DOB3.text isEqualToString:@""]) {
            self.Menu_Tab.selectedSegmentIndex=3;
            Inter_1.hidden=YES;
            
            inter_2.hidden=YES;
            inter_3.hidden=NO;
            UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Kindly fill all details!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alrt show];
            
            
        }

    
    }
   if ([[juniorck backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"ckbx.png"]])
   {
       if (txt_Junior.text.length==0 || [txt_Junior.text isEqualToString:@""]||txt_DOB2.text.length==0||[txt_DOB2.text isEqualToString:@""]) {
           self.Menu_Tab.selectedSegmentIndex=3;
           Inter_1.hidden=YES;
           
           inter_2.hidden=NO;
           inter_3.hidden=YES;
           UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Kindly fill all details!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
           [alrt show];
           
       }


   }
    
    
    
//     else
//    {
    
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        spinner.center=self.view.center;
        spinner.color=[UIColor blackColor];
        [self.view3 addSubview:spinner];
        // self.view.center=spinner;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            
            //back to the main thread for the UI call
            dispatch_async(dispatch_get_main_queue(), ^{
                [spinner startAnimating];
            });
            
            
            

        
        
        
        
        
        NSString *s1;
       
        NSString *s3;
        NSString *s4;
        NSString *s5;
        NSString *s6;
        NSString *s7; NSString *s8; NSString *s9;
        NSString *s10;
        NSString *s11;
        
        //web service
        if (exist_mem==TRUE) {
            s1=@"TRUE";
        }
        else if(new_mem==TRUE)
        {
            s1=@"TRUE";
        }
        else
        {
            s1=@"FALSE";
        }
        
        if (founder==TRUE) {
            s3=@"TRUE";
        }
        else
        {
            s3=@"FALSE";
        }
        
        
        
        if (home_own==TRUE) {
            s4=@"TRUE";
        }
        else
        {
            s4=@"FALSE";
        }
        
        if (debenture==TRUE) {
            s5=@"TRUE";
        }
        else
        {
            s5=@"FALSE";
        }
        
        if (annual==TRUE) {
            s6=@"TRUE";
        }
        else
        {
            s6=@"FALSE";
        }
        
        if (family==TRUE) {
            s7=@"TRUE";
        }
        else
        {
            s7=@"FALSE";
        }
        if (mid_week==TRUE) {
            s8=@"TRUE";
        }
        else
        {
            s8=@"FALSE";
        }
        
        if (gold==TRUE) {
            s9=@"TRUE";
        }
        else
        {
            s9=@"FALSE";
        }
        if (silver==TRUE) {
            s10=@"TRUE";
        }
        else
        {
            s10=@"FALSE";
        }
        
        if (over==TRUE) {
            s11=@"TRUE";
        }
        else
        {
            s11=@"FALSE";
        }
        
        
        NSString *jr=txt_Junior.text;
        
        jr=[jr stringByAppendingString:@","];
        jr=[jr stringByAppendingString:junior2text.text];
        
        //junior_date_of_birth
        NSString *jr5=txt_DOB2.text;
        
        jr5=[jr5 stringByAppendingString:@","];
        jr5=[jr5 stringByAppendingString:junior_dob_txt.text];
        
        
        
        //junior_playing_handicap
        
        NSString *jr6=txt_Playing2.text;
        
        jr6=[jr6 stringByAppendingString:@","];
        jr6=[jr6 stringByAppendingString:junior_han_txt.text];
        
        
        
        NSString *jut=txt_Juvenile.text;
        jut=[jut stringByAppendingString:@","];
        jut=[jut stringByAppendingString:juniletext.text];
        

        NSString *jut1=txt_Playing3.text;
        jut1=[jut1 stringByAppendingString:@","];
        jut1=[jut1 stringByAppendingString:junileplayingtxt.text];

        
        NSString *jut2=txt_DOB3.text;
        jut2=[jut2 stringByAppendingString:@","];
        jut2=[jut2 stringByAppendingString:juniledobtxt.text];
        

        
        
        
        
        
        
        
        
        
        
        
        
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/golf_membership_registration.php"]];
        // create the Method "GET" or "POST"
        
        [request setHTTPMethod:@"POST"];
        
        //Pass The String to server
        NSString *userUpdate =[NSString stringWithFormat:@"member=%@&member_number=%@&founder_membership=%@&home_owners_debenture_membership=%@&debenture_membership=%@&annual_membership=%@&family_membership=%@&mid_week_membership=%@&corporate_gold=%@&corporate_silver=%@&overseas=%@&family_name=%@&family_given_name=%@&family_date_of_birth=%@&family_playing_handicap=%@&family_company_name=%@&residential_address=%@&mobile=%@&nationality=%@&email=%@&spouse_family_name=%@&spouse_given_name=%@&spouse_date_of_birth=%@&spouse_playing_handicap=%@&spouse_company_name=%@&junior_name=%@&junior_date_of_birth=%@&junior_playing_handicap=%@&juvenile_name=%@&juvenile_date_of_birth=%@&juvenile_playing_handicap=%@",s1,mem_no.text,s3,s4,s5,s6,s7,s8,s9,s10,s11,txt_Family.text,txt_Given.text,txt_DOB.text,txt_Playing.text,txt_Company.text,txt_Address.text,txt_Mobile.text,txt_National.text,txt_Email.text,txt_SpouceN.text,txt_Given1.text,txt_DOB1.text,txt_Playing1.text,txt_Company1.text,jr,jr5,jr6,jut,jut1,jut2];
        
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
            NSError *err;
            NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error: &err];
            jsonArray= jsonArray1[@"error_message"] ;
            
            NSLog(@"the err=%@",jsonArray);
            
            //                if ([jsonArray isEqualToString:@"Tee Time Booking Done sucessfully"]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Golf Membership registration has been done sucessfully"
                                                               delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                alert.tag=10;
                [alert show];

                [spinner stopAnimating];
                [spinner hidesWhenStopped];

                
            });
            
        }
            
  });
        
   // }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==10) {
        
        [self.navigationController popViewControllerAnimated:YES];
        
        
    }
    
    
    
}

-(IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)membtn:(id)sender
{
    
}
- (IBAction)spouseck_action:(id)sender
{
    if ([[spouseck backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        // Button has a background image named 'myImage.png'
        
        
        [spouseck setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        spouse=spouse+1;
        Inter_1.hidden=NO;
        
        inter_2.hidden=YES;
        inter_3.hidden=YES;
        
        
        
    }else{
        [spouseck setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
        spouse=spouse-1;
        Inter_1.hidden=YES;
        
        inter_2.hidden=YES;
        inter_3.hidden=YES;
        
        
        // Button has not a background image named 'myImage.png'
    }
    
    
    
    
    
}
- (IBAction)juniorck_action:(id)sender {
    
    if ([[juniorck backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        if ([[spouseck backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"ckbx.png"]])
        {
            if (txt_SpouceN.text.length==0 || [txt_SpouceN.text isEqualToString:@""]||txt_DOB.text.length==0||[txt_DOB.text isEqualToString:@""] ) {
                self.Menu_Tab.selectedSegmentIndex=0;
                Inter_1.hidden=NO;
                
                inter_2.hidden=YES;
                inter_3.hidden=YES;
                UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Kindly fill all details!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alrt show];
                
            }
        }
       if ([[junenileck backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"ckbx.png"]])
        {
            if (txt_Juvenile.text.length==0 || [txt_Juvenile.text isEqualToString:@""]||txt_DOB3.text.length==0||[txt_DOB3.text isEqualToString:@""]) {
                self.Menu_Tab.selectedSegmentIndex=3;
                Inter_1.hidden=YES;
                
                inter_2.hidden=YES;
                inter_3.hidden=NO;
                UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Kindly fill all details!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alrt show];
                
                
            }
            else
            {
                
                [juniorck setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
                self.Menu_Tab.selectedSegmentIndex=1;
                Inter_1.hidden=YES;
                
                inter_2.hidden=NO;
                inter_3.hidden=YES;
            }

        }
       else
       {
           
           [juniorck setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
           self.Menu_Tab.selectedSegmentIndex=1;
           Inter_1.hidden=YES;
           
           inter_2.hidden=NO;
           inter_3.hidden=YES;
       }

           }
    
    
    
    else
    {
        //Inter_1.hidden=YES;
        
        inter_2.hidden=YES;
        // inter_3.hidden=YES;
        
        [juniorck setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    }
    
    
    
}
- (IBAction)junenileck_action:(id)sender {
    if ([[junenileck backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"unckbx.png"]])
    {
        
        //   [junenileck setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
        
        
        
        if ([[spouseck backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"ckbx.png"]])
        {
            if (txt_SpouceN.text.length==0 || [txt_SpouceN.text isEqualToString:@""]||txt_DOB.text.length==0||[txt_DOB.text isEqualToString:@""] ) {
                self.Menu_Tab.selectedSegmentIndex=0;
                Inter_1.hidden=NO;
                
                inter_2.hidden=YES;
                inter_3.hidden=YES;
                UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Kindly fill all details!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alrt show];
                
            }
            
            else
            {
                [junenileck setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
                Inter_1.hidden=YES;
                self.Menu_Tab.selectedSegmentIndex=2;
                
                inter_2.hidden=YES;
                inter_3.hidden=NO;
            }
        }
        else if ([[juniorck backgroundImageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"ckbx.png"]])
        {
            if (txt_Junior.text.length==0 || [txt_Junior.text isEqualToString:@""]||txt_DOB2.text.length==0||[txt_DOB2.text isEqualToString:@""]) {
                self.Menu_Tab.selectedSegmentIndex=3;
                Inter_1.hidden=YES;
                
                inter_2.hidden=NO;
                inter_3.hidden=YES;
                UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Kindly fill all details!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alrt show];
                
            }
            
            else
            {
                [junenileck setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
                Inter_1.hidden=YES;
                self.Menu_Tab.selectedSegmentIndex=2;
                inter_2.hidden=YES;
                inter_3.hidden=NO;
            }
        }
        else
        {
            Inter_1.hidden=YES;
            self.Menu_Tab.selectedSegmentIndex=2;
            inter_2.hidden=YES;
            inter_3.hidden=NO;
            [junenileck setBackgroundImage:[UIImage imageNamed:@"ckbx.png"] forState:UIControlStateNormal];
            
            
            
        }
    }else{
        inter_3.hidden=YES;
        self.Menu_Tab.selectedSegmentIndex=2;
        [junenileck setBackgroundImage:[UIImage imageNamed:@"unckbx.png"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)btn_pdf_action:(id)sender
{
    
    
    
    manage.letter_url=url;
    
    
    manage.newsletter_tit=@"Membership Registration";
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        web_letter *login = [[web_letter alloc]initWithNibName:@"webletter_iphone" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
    else
    {
        web_letter *login = [[web_letter alloc]initWithNibName:@"webletter_ipad" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
    
    
    
    
    
    
}

# pragma mark-textfield delegate

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
    
    CGRect viewFrame = self.view2.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view2 setFrame:viewFrame];
    
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField

{
    CGRect viewFrame = self.view2.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view2 setFrame:viewFrame];
    
    [UIView commitAnimations];
}
-(void)textViewDidEndEditing:(UITextView *)textView

{
    CGRect viewFrame = self.view2.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view2 setFrame:viewFrame];
    
    [UIView commitAnimations];
    
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    CGRect textFieldRect =
    [self.view.window convertRect:textView.bounds fromView:textView];
    CGRect viewRect =
    [self.view2.window convertRect:self.view.bounds fromView:self.view2];
    
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
    
    CGRect viewFrame = self.view2.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view2 setFrame:viewFrame];
    
    [UIView commitAnimations];
}


@end
