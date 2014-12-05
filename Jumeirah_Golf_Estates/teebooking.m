//
//  teebooking.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 25/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "teebooking.h"
#import "BackgroundLayer.h"
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;

@interface teebooking ()
{
UIToolbar* numberToolbar;
    UIToolbar *myToolbar;
    UIToolbar *myToolbar1;
    NSString *jsonArray;
    UIToolbar *myToolbar2;
    
    UIToolbar *visitor;
    UIToolbar *playersa;

}

//@property(strong,nonatomic)IBOutlet  UIActivityIndicatorView *spinner;

@end

@implementation teebooking

@synthesize ddText1,memberid,mobilno,firstname,lastname,date,ddMenu,ddMenu1,ddMenu2,ddMenuShowButton,ddMenuShowButton1,ddMenuShowButton2,ddText,ddText2,email,Details_product_ScrollView,sub,topButton,course,member,player,coursebutton,playerbutton,memberbutton,dataArray,pickerView123,dataArray1,dataArray2,pickerView1,pickerView2,sample,picker2,picker3,picker4,picker1,arrAgeRanges1,arrAgeRanges2,arrAgeRanges3,ball,playerno;
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"teebooking Screen";
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        
    }
    else
    {

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:@"UIDeviceOrientationDidChangeNotification" object:nil];

    }
    
}

- (IBAction)dismissKeyboard:(id)sender
{
    [activeField resignFirstResponder];
}

/*- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
   activeField = nil;
}
*/
- (void) keyboardWillHide:(NSNotification *)notification {
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
   Details_product_ScrollView.contentInset = contentInsets;
   Details_product_ScrollView.scrollIndicatorInsets = contentInsets;
}


-(void)viewDidUnload{
   // [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     self.arrAgeRanges1 = [[NSArray alloc] initWithObjects:@"Earth", @"Fire", nil];
    
      self.visitorarray = [[NSArray alloc] initWithObjects:@"Member", @"Visitor", nil];
    self.playerarray= [[NSArray alloc] initWithObjects:@"1", @"2",@"3",@"4", nil];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        picker2 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 43, 320, 480)];

        picker2.delegate = self;
        
        picker2.dataSource = self;
        
        
        
        
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
        date.inputAccessoryView = myToolbar;
        

        
        
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
        course.inputAccessoryView = myToolbar1;

        
        /*******************/
        
        
        self.membervisitor = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 43, 320, 480)];
        
        self.membervisitor .delegate = self;
        
        self.membervisitor .dataSource = self;
        
        
        visitor = [[UIToolbar alloc] initWithFrame:
                      CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
        UIBarButtonItem *d =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                      target:self action:@selector(inputAccessoryViewDidFinishd)];
        
        UIBarButtonItem *c= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                      target:self action:@selector(inputAccessoryViewDidFinishc)];
        
        UIBarButtonItem *s= [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace   target:self action:nil];
        
        
        
        
        [visitor  setItems:[NSArray arrayWithObjects: d,s,c,nil] animated:NO];
        member.inputAccessoryView = visitor;

        /************************************************************************/
        
        
        self.playerno = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 43, 320, 480)];
        
        self.playerno .delegate = self;
        
        self.playerno .dataSource = self;
        
        
       playersa = [[UIToolbar alloc] initWithFrame:
                   CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
        UIBarButtonItem *p =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                      target:self action:@selector(inputAccessoryViewDidFinishp)];
        
        UIBarButtonItem *pc= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                          target:self action:@selector(inputAccessoryViewDidFinishpc)];
        
        UIBarButtonItem *ps= [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace   target:self action:nil];
        
        
        
        
        [playersa  setItems:[NSArray arrayWithObjects: p,ps,pc,nil] animated:NO];
        player.inputAccessoryView = playersa;

        
        
    }
    else
    {

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:@"UIDeviceOrientationDidChangeNotification" object:nil];
    }
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    
    ddMenu1.hidden=YES;
    ddMenu2.hidden=YES;
    ddMenu.hidden=YES;
    dataArray = [[NSMutableArray alloc] init];
     //spinner.hidden=YES;
    // Add some data for demo purposes.
    [dataArray addObject:@"Earth"];
    [dataArray addObject:@"Fire"];
    
    
    dataArray1 = [[NSMutableArray alloc] init];
    
    // Add some data for demo purposes.
    [dataArray1 addObject:@"Member"];
    [dataArray1 addObject:@"Not a Member"];

    
    dataArray2 = [[NSMutableArray alloc] init];
    
    // Add some data for demo purposes.
    [dataArray2 addObject:@"1"];
    [dataArray2 addObject:@"2"];
    [dataArray2 addObject:@"3"];
    [dataArray2 addObject:@"4"];
    
    
   // UIButton *topButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [topButton addTarget:self action:@selector(showPopover:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    [coursebutton addTarget:self action:@selector(showPopover1:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    [memberbutton addTarget:self action:@selector(showPopover2:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    [playerbutton addTarget:self action:@selector(showPopover3:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    //topButton.frame = CGRectMake(323,763, 300, 30);
    [topButton setTitle:@"" forState:UIControlStateNormal];
    [coursebutton setTitle:@"" forState:UIControlStateNormal];
    [memberbutton setTitle:@"" forState:UIControlStateNormal];
    [playerbutton setTitle:@"" forState:UIControlStateNormal];
    
    
    
    topButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
     coursebutton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
     memberbutton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
     playerbutton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    //[self.view addSubview:topButton];
    
    //self.date.keyboardAppearance=NO;
    
  //  [date setEnabled:NO];
    
    
    

    self.Details_product_ScrollView.delegate=self;
      Details_product_ScrollView.scrollEnabled=YES;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, 100, 0.0);
    Details_product_ScrollView.contentInset = contentInsets;
    
    
  /* [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];*/
    
    
    if ([member.text isEqualToString:@"Visitor"]) {
        memberid.hidden=YES;
        memberid.enabled=NO;
    }
    else
    {
        memberid.hidden=NO;
         memberid.enabled=YES;
    }
    

    
     numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]
                           ,[[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
    
 mobilno.inputAccessoryView = numberToolbar;
    
    CAGradientLayer *btnGradient = [BackgroundLayer blackWhiteGradient];
    btnGradient.frame = self.sub.bounds;
    btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sub.layer insertSublayer:btnGradient atIndex:0];
    
    
    
    
    
    CAGradientLayer *btnGradient5 = [BackgroundLayer blackWhiteGradient];
    btnGradient5.frame = self.sample.bounds;
   // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
   // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient5 atIndex:0];
    /******************************device orentation**************************/
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
         Details_product_ScrollView.scrollEnabled=YES;
        Details_product_ScrollView.contentSize=CGSizeMake(320,850);
 
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
             Details_product_ScrollView.scrollEnabled=NO;
            [self portraitOrientation];
        }
    }else{
        // self.view = self.landscapeView;
        if(orientation ==UIInterfaceOrientationLandscapeLeft){
            NSLog(@"Changed Orientation To Landscape left");
            Details_product_ScrollView.contentSize=CGSizeMake(1024,850);

            [self landscapeLeftOrientation];
        }else{
            NSLog(@"Changed Orientation To Landscape right");
            Details_product_ScrollView.contentSize=CGSizeMake(1024,850);

            [self landscapeRightOrientation];
        }
        
    }
    }
    
    }



//-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
//    return 1;
//}



-(void)inputAccessoryViewDidFinish
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd "];
    
    NSString *strDate = [dateFormatter stringFromDate:self.picker1.date];
    self.date.text = strDate;
    
    
    [self.date resignFirstResponder];
    
}

-(void)inputAccessoryViewDidFinish0
{
    
    
    [self.date resignFirstResponder];
    
}



-(void)inputAccessoryViewDidFinish1
{
    
    NSString *strDate = [arrAgeRanges1 objectAtIndex:[self.picker2 selectedRowInComponent:0]];
    self.course.text = strDate;
    
    
    [self.course resignFirstResponder];
    
}
-(void)inputAccessoryViewDidFinishd
{
    NSString *strDate = [self.visitorarray objectAtIndex:[self.membervisitor selectedRowInComponent:0]];
    self.member.text = strDate;
     [self hidelabel];
    
    [self.member resignFirstResponder];
 
}
-(void)inputAccessoryViewDidFinishp
{
    NSString *strDate = [self.playerarray objectAtIndex:[self.playerno selectedRowInComponent:0]];
    self.player.text = strDate;
    
    
    [self.player resignFirstResponder];
}
-(void)inputAccessoryViewDidFinishpc
{
 [self.player resignFirstResponder];
}
-(void)inputAccessoryViewDidFinishc
{
  [self.member resignFirstResponder];
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSUInteger i=0;
    if (pickerView==self.picker2) {
        i= self.arrAgeRanges1.count;
    }
    if (pickerView==self.picker3) {
        i= self.arrAgeRanges1.count;
    }
    if (pickerView==self.membervisitor) {
        i=self.visitorarray.count;
    }
    if (pickerView==self.playerno) {
        i=self.playerarray.count;
    }
    return i;
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    id i;
    if (pickerView == picker2) {
        i= [self.arrAgeRanges1 objectAtIndex:row];
    }
    if (pickerView== self.picker3) {
        i= [self.arrAgeRanges1 objectAtIndex:row];
    }
     if (pickerView == self.membervisitor) {
       i= [self.visitorarray objectAtIndex:row];
         
     }
    if (pickerView==self.playerno) {
        i=[self.playerarray objectAtIndex:row];
    }
    
    return i;
}

-(void)inputAccessoryViewDidFinish01
{
    
    
    [self.course resignFirstResponder];
    
}




// Total rows in our component.
/*-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
   
    if (pickerView2) {
       return [dataArray2 count];
    }
    else if (pickerView1) {
       return [dataArray1 count];
    }
    else
    {
       return [dataArray count];
    }

        
    return [dataArray count];
}

// Display each row's data.
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
  //  NSInteger num;
    if (pickerView2) {
       return [dataArray2 objectAtIndex: row];
    }
    else if (pickerView1) {
        return [dataArray1 objectAtIndex: row];
    }
    else
    {
       return [dataArray objectAtIndex: row];
    }
    
    
    return [dataArray objectAtIndex: row];


    return [dataArray objectAtIndex: row];
}

// Do something with the selected row.
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
   // course.text=[dataArray objectAtIndex: row];

    if (pickerView1) {
        member.text=[dataArray1 objectAtIndex:row];
    }
    //NSLog(@"You selected this: %@", [dataArray objectAtIndex: row]);
   else if(pickerView2)
   {
    player.text=[dataArray2 objectAtIndex:row];
   }
   else
   {
       course.text=[dataArray objectAtIndex:row];
   }
    
    
}
*/

-(void)showPopover:(id)sender forEvent:(UIEvent*)event
{
    [self.view endEditing:YES];
 datepickerview *testViewController = [[datepickerview alloc] initWithNibName:@"datepickerview" bundle:nil];
 testViewController.delegate = self;
 
 self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
 //  _userDataPopover.frame = CGRectMake(0,0, 250, 200);
 self.userDataPopover.popoverContentSize = CGSizeMake(320, 226);
 
 [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
 inView:self.Details_product_ScrollView
 permittedArrowDirections:UIPopoverArrowDirectionAny
 animated:YES];
    
}
-(void)datepro:(NSString *)picker
{
    date.text=picker;
    
    [self.userDataPopover dismissPopoverAnimated:YES];
    
}
-(void)datepro1
{
   [self.userDataPopover dismissPopoverAnimated:YES];
}
-(void)showPopover1:(id)sender forEvent:(UIEvent*)event
{
    [self.view endEditing:YES];
    TestViewController *testViewController = [[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil];
    testViewController.delegate = self;
    
    self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
   //  _userDataPopover.frame = CGRectMake(0,0, 250, 200);
    self.userDataPopover.popoverContentSize = CGSizeMake(320, 226);
    
    [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
                                          inView:self.Details_product_ScrollView
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
   
    
}
-(void)usedatastring:(NSString*)picker
{
    course.text=picker;
    
     [self.userDataPopover dismissPopoverAnimated:YES];
    
}
-(void)usedatastring1
{
     [self.userDataPopover dismissPopoverAnimated:YES];
    
}
-(void)showPopover2:(id)sender forEvent:(UIEvent*)event
{
    [self.view endEditing:YES];
    memberViewController *testViewController = [[memberViewController alloc] initWithNibName:@"memberViewController" bundle:nil];
    testViewController.delegate = self;
    
    self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
    //  _userDataPopover.frame = CGRectMake(0,0, 250, 200);
    self.userDataPopover.popoverContentSize = CGSizeMake(320, 226);
    
    [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
                                          inView:self.Details_product_ScrollView
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
    
   
  

    
   //memberViewController
}
-(void)memberpro:(NSString *)picker
{
    member.text=picker;
    
    if ([member.text isEqualToString:@"Visitor"]) {
        memberid.enabled=NO;
        // UIColor *colorOne = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
        
        memberid.backgroundColor=[UIColor blackColor];
        
    }
    else
    {
        memberid.enabled=YES;
        UIColor *colorOne = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
        
        memberid.backgroundColor=colorOne;    }
      // [self hidelabel];
    [self.userDataPopover dismissPopoverAnimated:YES];
  
}
-(void)memberpro1
{
    [self.userDataPopover dismissPopoverAnimated:YES]; 
}





-(void)showPopover3:(id)sender forEvent:(UIEvent*)event
{
    [self.view endEditing:YES];
    players *testViewController = [[players alloc] initWithNibName:@"players" bundle:nil];
    testViewController.delegate = self;
    
    self.userDataPopover = [[UIPopoverController alloc] initWithContentViewController:testViewController];
    //  _userDataPopover.frame = CGRectMake(0,0, 250, 200);
    self.userDataPopover.popoverContentSize = CGSizeMake(320, 226);
    
    [self.userDataPopover presentPopoverFromRect:[(UIButton *)sender frame]
                                          inView:self.Details_product_ScrollView
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];

    
    
}
-(void)playerpro:(NSString *)picker
{
    player.text=picker;
    
    [self.userDataPopover dismissPopoverAnimated:YES];
    
}
-(void)playerpro1
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
    Details_product_ScrollView.scrollEnabled=YES;
     Details_product_ScrollView.contentSize=CGSizeMake(1024,850);
//    CGAffineTransform transform = CGAffineTransformMakeRotation(-(3.14159/2));
//    self.view.transform = transform;
//    // Repositions and resizes the view.
//    CGRect contentRect = CGRectMake(0, 0, 480, 320);
//    self.view.bounds = contentRect;
}
-(void)landscapeRightOrientation{
    
    // Rotates the view.
    Details_product_ScrollView.scrollEnabled=YES;
    Details_product_ScrollView.contentSize=CGSizeMake(1024,850);
//    CGAffineTransform transform = CGAffineTransformMakeRotation(3.14159/2);
//    self.view.transform = transform;
//    // Repositions and resizes the view.
//    CGRect contentRect = CGRectMake(0, 0, 480, 320);
//    self.view.bounds = contentRect;
}
-(void)portraitOrientation{
    
    // Rotates the view.
    Details_product_ScrollView.scrollEnabled=NO;
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


-(void)doneWithNumberPad{
    
    [mobilno resignFirstResponder];
     //[datePicker removeFromSuperview];
    
    [self.date resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ddMenuShow:(UIButton *)sender
{
    if (sender.tag == 0) {
        sender.tag = 1;
        self.ddMenu2.hidden=YES;
        //self.ddMenu1.hidden=YES;
        // ddMenuShowButton.enabled=NO;
        self.ddMenu.hidden = NO;
        self.ddMenu1.hidden = YES;
         self.ddMenu2.hidden = YES;
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        sender.tag = 0;
        self.ddMenu1.hidden = YES;
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
}

- (IBAction)ddMenuSelectionMade:(UIButton *)sender
{
   
    self.ddText.text = sender.titleLabel.text;
    //[self hidelabel];
    [self.ddMenuShowButton1 setTitle:@"" forState:UIControlStateNormal];
    self.ddMenuShowButton1.tag = 0;
    self.ddMenu.hidden = YES;
    
    
}
-(IBAction)submit:(id)sender
{
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
           NSLog(@"%@",ddText1);
 if  ([emailTest evaluateWithObject:email.text] == NO)
    {
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Invalid Email Format!!" message:@"Ener the Correct Email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrt show];
    }
   
 else if([member.text isEqualToString:@"Visitor"])
    {
       // memberid.text=@"nil";
        
        
        if ( firstname.text.length==0 || [lastname.text isEqualToString:@""] || email.text.length==0 || [mobilno.text isEqualToString:@""] || course.text.length==0 || [player.text isEqualToString:@""] || member.text.length==0|| date.text.length==0  )
        {
            
            UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Fill The All Details" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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
                

            
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/t_booking.php"]];
            // create the Method "GET" or "POST"
            
            [request setHTTPMethod:@"POST"];
            
            //Pass The String to server
            NSString *userUpdate =[NSString stringWithFormat:@"member_id=nil&first_name=%@&last_name=%@&email=%@&mobile_number=%@&course=%@&number_of_players=%@&user_type=%@&date=%@",firstname.text,lastname.text,email.text,mobilno.text,course.text,player.text,member.text,date.text,nil];
            
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

                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Conformation" message:@"Tee Time Booking Done sucessfully"
                                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    alert.tag=10;
                    [alert show];
                        
                    });
                     [spinner stopAnimating];
//                }
//                else
//                {
//                      dispatch_async(dispatch_get_main_queue(), ^{
//                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:jsonArray  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                    [alert show];
//                  
//                        [spinner stopAnimating];
//                    });
//                    
//                }
//                
                
                
            }
            else
            {
                NSLog(@"faield to connect");
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Network Failed!"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
                
            });
            
 
            
  
        }
        
 
    }
    else if ([member.text isEqualToString:@"Member"])
    {
        
        if ( [memberid.text isEqualToString:@""]|| firstname.text.length==0 || [lastname.text isEqualToString:@""] || email.text.length==0 || [mobilno.text isEqualToString:@""] || course.text.length==0 || [member.text isEqualToString:@""] || player.text.length==0|| date.text.length==0  )
        {
            
            UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Empty Fields!!" message:@"Fill The All Details" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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
                
                

            
            
            
            
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://mobileapp.certifytechnologies.com/jumeirah/t_booking.php"]];
            // create the Method "GET" or "POST"
            
            [request setHTTPMethod:@"POST"];
            
            //Pass The String to server
            NSString *userUpdate =[NSString stringWithFormat:@"member_id=%@&first_name=%@&last_name=%@&email=%@&mobile_number=%@&course=%@&number_of_players=%@&user_type=%@&date=%@",memberid.text,firstname.text,lastname.text,email.text,mobilno.text,course.text,player.text,member.text,date.text,nil];
            
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
              jsonArray= jsonArray1[@"error_message"] ;
                
                NSLog(@"the err=%@",jsonArray);
                
               // if ([jsonArray isEqualToString:@"Tee Time Booking Done sucessfully"]) {
                     dispatch_async(dispatch_get_main_queue(), ^{
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Conformation" message:jsonArray
                                                                   delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    alert.tag=10;
                    [alert show];
                    
                   
                        [spinner stopAnimating];
                    });
               // }
//                else
//                {
//                    
//                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:jsonArray  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                    [alert show];
//                    
//                }
                
                
                
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

    
        
    
 
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==10) {
        if ([jsonArray isEqualToString:@"Tee Time Booking Done successfully"]) {
            [self.navigationController popViewControllerAnimated:YES];
            
        }
    }
    
    
    
    if(alertView.tag==10)
    {
        email.text=@"";
        memberid.text=@"";
        firstname.text=@"";
        lastname.text=@"";
        mobilno.text = @"";
        date.text = @"";
        
        
    }
    
}

-(void)hidelabel
{
    if ([member.text isEqualToString:@"Visitor"]) {
        memberid.enabled=NO;
      // UIColor *colorOne = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
        
        memberid.backgroundColor=[UIColor blackColor];
        
    }
    else
    {
        memberid.enabled=YES;
        UIColor *colorOne = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
        
        memberid.backgroundColor=colorOne;    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  //  [self.Details_product_ScrollView endEditing:YES];
    ddMenu.hidden=YES;
    ddMenu1.hidden=YES;
    ddMenu2.hidden=YES;
    [email resignFirstResponder];
    [firstname resignFirstResponder];
    [lastname resignFirstResponder];
    [mobilno resignFirstResponder];
    [date resignFirstResponder];
    [memberid resignFirstResponder];
     // [self hidelabel];
  // [datePicker removeFromSuperview];
// datePicker.hidden=YES;
        
}

- (IBAction)ddMenuShow1:(UIButton *)sender
{
    if (sender.tag == 0) {
        sender.tag = 1;
    self.ddMenu2.hidden=YES;
        //self.ddMenu1.hidden=YES;
       // ddMenuShowButton.enabled=NO;
        self.ddMenu.hidden = YES;
        self.ddMenu1.hidden = NO;
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        sender.tag = 0;
        self.ddMenu1.hidden = YES;
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
}
- (IBAction)ddMenuSelectionMade1:(UIButton *)sender
{
   // self.ddMenuShowButton2.enabled
    self.ddText1.text = sender.titleLabel.text;
    [self hidelabel];
    [self.ddMenuShowButton1 setTitle:@"" forState:UIControlStateNormal];
    self.ddMenuShowButton1.tag = 0;
    self.ddMenu1.hidden = YES;
}

- (IBAction)ddMenuShow2:(UIButton *)sender
{
    if (sender.tag == 0) {
        sender.tag = 1;
        
        
        //self.ddMenu2.hidden=YES;
        self.ddMenu1.hidden=YES;
        self.ddMenu.hidden = YES;
        self.ddMenu2.hidden = NO;
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        sender.tag = 0;
        self.ddMenu2.hidden = YES;
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
}
- (IBAction)ddMenuSelectionMade2:(UIButton *)sender
{
    self.ddText2.text = sender.titleLabel.text;
    [self.ddMenuShowButton2 setTitle:@"" forState:UIControlStateNormal];
    self.ddMenuShowButton2.tag = 0;
    self.ddMenu2.hidden = YES;
}

-(IBAction)datepic:(id)sender
{
   
//	datePicker.date = [NSDate date];
    

  //NSDateFormatter *df = [[NSDateFormatter alloc] init];
  // [datePicker setDate:[NSDate date]];
   // [datePicker addTarget:self action:@selector(Pick:) forControlEvents:UIControlEventValueChanged];
   // [self.date setInputView:datePicker];
   //  datePicker.hidden = NO;
   
    
    
    
 /*datePicker.frame=CGRectMake(420, 320, 300, 500);

    [datePicker addTarget:self action:@selector(Pick:) forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:datePicker];*/
}

-(void)Pick:(id)sender
{
    ddMenu.hidden=YES;
    ddMenu1.hidden=YES;
    ddMenu2.hidden=YES;
//   UIDatePicker *picker = (UIDatePicker*)self.date.inputView;
  //  self.date.text =[NSString stringWithFormat:@"%@",picker.date];
    
   //datePicker.hidden=YES;
   // datePicker=nil;
}
-(void)pickcourse:(id)sender  forEvent:(UIEvent*)event
{
  course.text= [dataArray objectAtIndex:0];
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

- (IBAction)buttonBackMethod:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)updateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.date.inputView;
    self.date.text = [NSString stringWithFormat:@"%@",picker.date];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



/******************************textfield**********************************************/


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
   /* ddMenu.hidden=YES;
    ddMenu1.hidden=YES;
    ddMenu2.hidden=YES;
    if (textField.tag==50) {
        [self.Details_product_ScrollView endEditing:YES];
        [email resignFirstResponder];
        [firstname resignFirstResponder];
        [lastname resignFirstResponder];
        [mobilno resignFirstResponder];
        [memberid resignFirstResponder];
        
        [self performSelector:@selector(datepic:) withObject:nil];
        
        
            }
    else  if (textField ==self.date1)
    {
         [textField resignFirstResponder];
        [self.Details_product_ScrollView endEditing:YES];
        [email resignFirstResponder];
        [firstname resignFirstResponder];
        [lastname resignFirstResponder];
        [mobilno resignFirstResponder];
        [memberid resignFirstResponder];
        [self.date1 resignFirstResponder];
       
        
        
        
        UIDatePicker *myPicker = [[UIDatePicker alloc] init];
        [myPicker setDatePickerMode:UIDatePickerModeDate];
        [myPicker addTarget:self action:@selector(pickerChanged:)               forControlEvents:UIControlEventValueChanged];
        self.date1.inputView =  myPicker;
        
         self.date1.inputAccessoryView = numberToolbar;
        
    }*/
    if (textField== self.date) {
        
        if(self.picker1 == nil) {
            
            [ self.date resignFirstResponder];
            self.picker1 = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 43, 320, 480)];
            self.picker1.tag =42;
            
            // [self.picker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
            [self.view addSubview:self.picker1];
            
        }
        self.date.inputView = self.picker1;
        
    }
    

    if (textField==course) {
        if(self.picker2 == nil) {
            
            [course resignFirstResponder];
            self.picker2 = [[UIPickerView alloc] init];
            self.picker2.tag =42;
            [self.view addSubview:self.picker2];
            
        }
        self.course.inputView=self.picker2;

    }
    
    if (textField==member) {
        if(self.membervisitor == nil) {
            
            [member resignFirstResponder];
            self.membervisitor = [[UIPickerView alloc] init];
            self.membervisitor.tag =42;
            [self.view addSubview:self.membervisitor];
            
        }
        self.member.inputView=self.membervisitor;
        
        
    }
    
    
    if (textField==player) {
        if(self.playerno == nil) {
            
            [player resignFirstResponder];
            self.playerno = [[UIPickerView alloc] init];
            self.playerno.tag =42;
            [self.view addSubview:self.playerno];
            
        }
        self.player.inputView=self.playerno;
        
    }
    

    
    
    return YES;
}


/*- (void)pickerChanged:(UIDatePicker *)datePickere
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:datePickere.date];
    self.date.text = strDate;
    
    self.date.text=strDate;
    
    
    
    
    
}*/

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
/*- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
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
*/
@end
