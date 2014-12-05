//
//  billenquiry.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 13/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "billenquiry.h"
#import "BackgroundLayer.h"
#import "NSString+MD5.h"
#import "paybillcell.h"
@interface billenquiry ()
{
    NSMutableData *receivedData;
     UIToolbar *myToolbar;
}
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@end

@implementation billenquiry
@synthesize logbtn,message,customerid,customername,tablebill,propertycode,showview,itemshowdetailsAr,pickerView1,arrAgeRanges;
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
  
   // arrAgeRanges=[[NSArray alloc]init];
     // arrAgeRanges=[[NSArray alloc] initWithArray:manage.log_property];
  
    // Do any additional setup after loading the view from its nib.
    manage=[singleton share];
    customername.text=manage.userlogin;
    customerid.text=manage.cus_iid;
    propertycode.text=manage.cus_property;
    NSLog(@"array values...%@",manage.log_property);
  arrAgeRanges=[manage.log_property copy];
    NSLog(@"array values...%@",arrAgeRanges);
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    
    
    CAGradientLayer *btnGradient2 = [BackgroundLayer blackWhiteGradient];
    btnGradient2.frame = self.logbtn.bounds;
  btnGradient2.cornerRadius=5;
  btnGradient2.borderWidth=1.0;
    btnGradient2.borderColor=([UIColor whiteColor]).CGColor;
    [self.logbtn.layer insertSublayer:btnGradient2 atIndex:0];

    
    [self getdetails];
    
    
   
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        pickerView1 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 43, 320, 480)];
        
        
        
        pickerView1.delegate = self;
        
        pickerView1.dataSource = self;
        
        
        
        myToolbar = [[UIToolbar alloc] initWithFrame:
                      CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
        UIBarButtonItem *doneButton1 =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                      target:self action:@selector(inputAccessoryViewDidFinish1)];
        
        UIBarButtonItem *cancelbutton1= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                      target:self action:@selector(inputAccessoryViewDidFinish0)];
        
        UIBarButtonItem *sp1= [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                            target:self action:nil];
        
        
        
        
        [myToolbar setItems:[NSArray arrayWithObjects: doneButton1,sp1,cancelbutton1,nil] animated:NO];
        propertycode.inputAccessoryView = myToolbar;
        

        
        
        
        
    }

   
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
   
    
          return [arrAgeRanges count];
    
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
   
      return [[arrAgeRanges objectAtIndex:row] valueForKey:@"Property_Code" ] ;
    
}


-(void)inputAccessoryViewDidFinish1
{
    
    NSString *strDate = [[arrAgeRanges objectAtIndex:[pickerView1 selectedRowInComponent:0]] valueForKey:@"Property_Code"] ;
    propertycode.text = strDate;
    
    [self getdetails];
    [propertycode resignFirstResponder];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
        if (textField==propertycode)
    {
        if(pickerView1 == nil) {
            
            [propertycode resignFirstResponder];
            pickerView1 = [[UIPickerView alloc] init];
           pickerView1.tag =42;
            [self.view addSubview:pickerView1];
            
        }
               propertycode.inputView=pickerView1;
    }
    return YES;

}
-(void)inputAccessoryViewDidFinish0
{
    
    
    [self.propertycode resignFirstResponder];
    
}



-(void)getdetails
{
    
    if ([manage.userlogin length]==0) {
        showview.hidden=YES;
    }
    else
    {
        showview.hidden=NO;
        
        
        tablebill.dataSource=self;
        tablebill.delegate=self;
        itemshowdetailsAr=[[NSMutableArray alloc]init];
        /*
         @property (strong, nonatomic) IBOutlet UITextField *customername;
         @property (strong, nonatomic) IBOutlet UITextField *customerid;
         @property (strong, nonatomic) IBOutlet UITextField *propertycode;
         @property (strong, nonatomic) IBOutlet UITableView *tablebill;
         @property (strong, nonatomic) IBOutlet UILabel *message;
         @property (strong, nonatomic) IBOutlet UILabel *logbtn;
         
         
         
         */
        
        NSString *str=@"FV150^766-552!";
        NSString *str2=@"GIL";
        NSString *str3=manage.cus_iid;
        
        NSLog(@"id..........%@",manage.cus_iid);
        NSLog(@"idval..........%@",manage.cus_property);
        NSString *str4=[str stringByAppendingString:str3];
        NSString *str5=[str4 stringByAppendingString:str2];
        
        NSString *credentials = [str5 MD5];
        
        NSString *post1 =[[NSString alloc] initWithFormat:@"SecureHash=%@&CustomerID=%@&PropertyCode=%@",credentials,str3,propertycode.text];
        NSData *postData1 = [post1 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSLog(@"postData.....%@", post1);
        NSString *URL1 = [NSString stringWithFormat:@"https://communitiesuat.jumeirahgolfestates.com/FvOAWebservice/CustomerInfo.asmx/getCustomerDueSpecific"];
        NSMutableURLRequest *request1 = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL1] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
        [request1 setHTTPMethod:@"POST"];
        //[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        //[request setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
        [request1 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request1 setHTTPBody:postData1];
        
        NSError *err1;
        NSURLResponse *response1;
        NSData *responseData1 = [NSURLConnection sendSynchronousRequest:request1 returningResponse:&response1 error:&err1];
        
        NSDictionary *jsonArrayflame1 = [NSJSONSerialization JSONObjectWithData:responseData1 options: NSJSONReadingMutableContainers error: &err1];
        // NSLog(@"%@",jsonArray1);
        NSLog(@"%@",jsonArrayflame1);
        
        NSArray *jsonArray=jsonArrayflame1[@"CustomerDueInvoices"];
        
        //  NSDictionary *tmp=(NSDictionary*)[jsonArray object]
        for (NSDictionary *tmp in jsonArray)
        {
            NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
            
            [itemshowdetails setValue:tmp[@"Customer_ID"] forKey:@"Customer_ID"];
            [itemshowdetails setValue:tmp[@"Details"] forKey:@"Details"];
            //  [itemshowdetails setValue:[tmp objectForKey:@"id"] forKey:@"id"];
            [itemshowdetails setValue:tmp[@"DueAmount"] forKey:@"DueAmount"];
            // [itemshowdetails setValue:[tmp objectForKey:@"content"] forKey:@"content"];
            [itemshowdetails setValue:tmp[@"DueDate"] forKey:@"DueDate"];
            [itemshowdetails setValue:tmp[@"InvoiceAmount"] forKey:@"InvoiceAmount"];
            [itemshowdetails setValue:tmp[@"InvoiceDate"] forKey:@"InvoiceDate"];
            
            [itemshowdetails setValue:tmp[@"InvoiceNo"] forKey:@"InvoiceNo"];
            
            [itemshowdetails setValue:tmp[@"Property_Code"] forKey:@"Property_Code"];
            
            [itemshowdetails setValue:tmp[@"RevenuHead"] forKey:@"RevenuHead"];
            //        [itemshowdetails setValue:tmp[@"DueDate"] forKey:@"DueDate"];
            //        [itemshowdetails setValue:tmp[@"DueDate"] forKey:@"DueDate"];
            //
            [itemshowdetailsAr addObject:itemshowdetails];
            NSLog(@"%@",itemshowdetails);
        }
        
        
        NSLog(@"%@",itemshowdetailsAr);
        [self.tablebill reloadData];
        manage.payarray=itemshowdetailsAr;
        
        
        
    }
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   // NSLog(@"aaaaa....%lu",(unsigned long)[self.itemshowdetailsAr count]);
    return [itemshowdetailsAr count];
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
//    {
//        
//        
//        return 95;
//    }
//    else
//    {
        return 126;
//    }
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *str=@"cell";
    
    paybillcell *cell=[self.tablebill dequeueReusableCellWithIdentifier:str];
    if (cell==nil)
    {
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
        
            
            NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"paybillcell_iphone" owner:nil options:nil ];
            for(UIView *vie in arr1)
            {
                if([vie isKindOfClass:[UITableViewCell class]])
                {
                    cell=(paybillcell*)vie;
                }
                
            }
        }
        else
        {
            // cell = [[paybillcell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"paybillcell" owner:nil options:nil ];
            for(UIView *vie in arr1)
            {
                if([vie isKindOfClass:[UITableViewCell class]])
                {
                    cell=(paybillcell*)vie;
                }
                
            }
            
            
        }
    }
    
    
   // cell.servicecharge.text=@"hellllo";
     cell.servicecharge.text=(self.itemshowdetailsAr)[indexPath.row][@"RevenuHead"];
    NSString *ss=(self.itemshowdetailsAr)[indexPath.row][@"DueAmount"];
    NSLog(@"dueamt...%@",ss);
    cell.s1.text=[NSString stringWithFormat:@"%@",ss];
     cell.invoice.text=(self.itemshowdetailsAr)[indexPath.row][@"InvoiceNo"];
    
    NSString *actDate1 = (self.itemshowdetailsAr)[indexPath.row][@"InvoiceDate"];;
    NSString *nDate1 = [[[[actDate1 componentsSeparatedByString:@"("] objectAtIndex:1] componentsSeparatedByString:@")"] objectAtIndex:0];
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:([nDate1 doubleValue] / 1000)];
    NSDateFormatter *dtfrm1 = [[NSDateFormatter alloc] init];
    [dtfrm1 setDateFormat:@"MM/dd/yyyy"];
    nDate1 = [dtfrm1 stringFromDate:date1];
  cell.dt.text=[NSString stringWithFormat:@"%@",date1];

    if ([cell.servicecharge.text isEqualToString:@"Service Charge - General Fund"]) {
        
        UIColor *barColour = [UIColor colorWithRed:(216/255.0) green:(243/255.0) blue:(235/255.0) alpha:1];

        cell.backgroundColor= barColour;
    }
    else
    {
        UIColor *barColour = [UIColor colorWithRed:(229/255.0) green:(241/255.0) blue:(254/255.0) alpha:1];
        
        cell.backgroundColor= barColour;
        
    }
     [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
     self.tablebill.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
   /* NSError *err;
    // NSURLResponse *response;
    // NSData *responseData = [NSURLConnection sendSynchronousRequest:receivedData returningResponse:&response error:&err];
    
    NSDictionary *jsonArrayflame = [NSJSONSerialization JSONObjectWithData:receivedData options: NSJSONReadingMutableContainers error: &err];    // NSLog(@"%@",jsonArray1);
    NSLog(@"%@",jsonArrayflame);
    
   if (jsonArrayflame) {
        
        NSArray *headlines=jsonArrayflame[@"picture_gallery"];
        
        for (int i=0;i<[headlines count]; i++)
        {
            NSString *ss=headlines[i][@"image_url"];
            
            [self.itemshowdetailsAr addObject:ss];
            NSLog(@"%@",_itemshowdetailsAr);
            
        }
        
        
        
    }*/
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    manage.b_id=(self.itemshowdetailsAr)[indexPath.row][@"Customer_ID"];
    manage.b_details=(self.itemshowdetailsAr)[indexPath.row][@"Details"];
     manage.b_dueamt=(self.itemshowdetailsAr)[indexPath.row][@"DueAmount"];
     manage.b_duedate=(self.itemshowdetailsAr)[indexPath.row][@"DueDate"];
     manage.b_invocedt=(self.itemshowdetailsAr)[indexPath.row][@"InvoiceDate"];
     manage.b_invoiceamt=(self.itemshowdetailsAr)[indexPath.row][@"InvoiceAmount"];
     manage.b_invoiceno=(self.itemshowdetailsAr)[indexPath.row][@"InvoiceNo"];
     manage.b_propertycode=(self.itemshowdetailsAr)[indexPath.row][@"Property_Code"];
     manage.b_revenuhead=(self.itemshowdetailsAr)[indexPath.row][@"RevenuHead"];

    
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        viewbill *login = [[viewbill alloc]initWithNibName:@"viewbill_iphone" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
    else
    {
        viewbill *login = [[viewbill alloc]initWithNibName:@"viewbill" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return  [UIView new];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)login:(id)sender

{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        LoginViewController *login = [[LoginViewController alloc]initWithNibName:@"LoginViewController_iPhone" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
    else
    {
        LoginViewController *login = [[LoginViewController alloc]initWithNibName:@"LoginViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
    
 
}
@end
