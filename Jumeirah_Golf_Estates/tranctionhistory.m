//
//  tranctionhistory.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 16/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "tranctionhistory.h"
#import "BackgroundLayer.h"
#import "NSString+MD5.h"
@interface tranctionhistory ()
{
    UIToolbar *myToolbar;
    NSString *nDate1;
}
@end

@implementation tranctionhistory
@synthesize itemshowdetailsAr1,itemshowdetailsAr,itemshowdetailsAr2,view1,view2,view3,table1,table2,table3,lbl,itemshowdetailsAr3,itemshowdetailsAr4,propertycode,pickerView1,arrAgeRanges;
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
    itemshowdetailsAr=[[NSMutableArray alloc]init];
    itemshowdetailsAr1=[[NSMutableArray alloc]init];
    arrAgeRanges=[manage.log_property copy];
    
    itemshowdetailsAr2=[[NSMutableArray alloc]init];
    
    
    
    itemshowdetailsAr3=[[NSMutableArray alloc]init];
    
    itemshowdetailsAr4=[[NSMutableArray alloc]init];
    
    // Do any additional setup after loading the view from its nib.
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    view2.hidden=YES;
    view3.hidden=YES;
    propertycode.text=manage.cus_property;
    [self getdetails];
    
    CAGradientLayer *btnGradient3 = [BackgroundLayer blackWhiteGradient];
    btnGradient3.frame = self.btnall.bounds;
    btnGradient3.cornerRadius=5;
    btnGradient3.borderWidth=1.0;
    btnGradient3.borderColor=([UIColor whiteColor]).CGColor;
    [self.btnall.layer insertSublayer:btnGradient3 atIndex:0];
    
    
    
    
    CAGradientLayer *btnGradient4 = [BackgroundLayer blackWhiteGradient];
    btnGradient4.frame = self.btngeneral.bounds;
    btnGradient4.cornerRadius=5;
    btnGradient4.borderWidth=1.0;
    btnGradient4.borderColor=([UIColor whiteColor]).CGColor;
    [self.btngeneral.layer insertSublayer:btnGradient4 atIndex:0];
    
    
    
    
    CAGradientLayer *btnGradient5 = [BackgroundLayer blackWhiteGradient];
    btnGradient5.frame = self.btnreserve.bounds;
    btnGradient5.cornerRadius=5;
    btnGradient5.borderWidth=1.0;
    btnGradient5.borderColor=([UIColor whiteColor]).CGColor;
    [self.btnreserve.layer insertSublayer:btnGradient5 atIndex:0];
    
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
//    {
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
        
        
        
        
        
        
//    }
    
    
    
    
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
    
    
    NSString *str=@"FV150^766-552!";
    NSString *str2=@"GIL";
    NSString *str3=manage.cus_iid;
    
    NSLog(@"id..........%@",manage.cus_iid);
    
    
    
    
    NSLog(@"idval..........%@",manage.cus_property);
    NSString *str4=[str stringByAppendingString:str3];
    NSString *str5=[str4 stringByAppendingString:str2];
    
    NSString *aaa=manage.userlogin ;
    lbl.text=aaa;
    
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
        
        [itemshowdetails setValue:tmp[@"RevenuHead"] forKey:@"head"];
        //        [itemshowdetails setValue:tmp[@"DueDate"] forKey:@"DueDate"];
        //        [itemshowdetails setValue:tmp[@"DueDate"] forKey:@"DueDate"];
        //
        [itemshowdetailsAr addObject:itemshowdetails];
        //  NSLog(@"%@",itemshowdetails);
    }
    
    
    //   NSLog(@"%@",itemshowdetailsAr);
    
    NSString *post2 =[[NSString alloc] initWithFormat:@"SecureHash=%@&CustomerID=%@&PropertyCode=%@",credentials,str3,manage.cus_property];
    NSData *postData2 = [post2 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    
    
    NSString *URL2 = [NSString stringWithFormat:@"https://communitiesuat.jumeirahgolfestates.com/FvOAWebservice/CustomerInfo.asmx/getCustomerPaymentHistory"];
    NSMutableURLRequest *request2 = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL2] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
    [request2 setHTTPMethod:@"POST"];
    //[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    //[request setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
    [request2 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request2 setHTTPBody:postData2];
    
    NSError *err2;
    NSURLResponse *response2;
    NSData *responseData2 = [NSURLConnection sendSynchronousRequest:request2 returningResponse:&response2 error:&err2];
    
    NSDictionary *jsonArrayflame2 = [NSJSONSerialization JSONObjectWithData:responseData2 options: NSJSONReadingMutableContainers error: &err2];
    // NSLog(@"%@",jsonArray1);
    NSLog(@"%@",jsonArrayflame2);
    
    NSArray *jsonArray2=jsonArrayflame2[@"Transaction_History"];
    
    
    
    
    
    
    
    
    
    NSLog(@"l...%@",jsonArray2);
    
    
    NSString *ss=jsonArrayflame2[@"ErrorMessage"];
    
    // NSDictionary  *newjson=jsonArray2[@"InvoiceDetails"];
    
    //  NSDictionary *tmp=(NSDictionary*)[jsonArray object]
    if (jsonArray2.count!=0) {
        
        
        for (NSDictionary *tmp in jsonArray2)
        {
            NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
            
            [itemshowdetails setValue:tmp[@"InvoiceDetails"] forKey:@"InvoiceDetails"];
            
            NSArray *js=tmp[@"InvoiceDetails" ];
            for (NSDictionary *tmp1 in js)
            {
                NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
                
                [itemshowdetails setValue:tmp1[@"AdjustedAmt"] forKey:@"AdjustedAmt"];
                
                [itemshowdetails setValue:tmp1[@"InvoiceAmount"] forKey:@"InvoiceAmount"];
                [itemshowdetails setValue:tmp1[@"InvoiceDate"] forKey:@"InvoiceDate"];
                [itemshowdetails setValue:tmp1[@"InvoiceDetails"] forKey:@"InvoiceDetails"];
                [itemshowdetails setValue:tmp1[@"InvoiceNo"] forKey:@"InvoiceNo"];
                
                
                
                [itemshowdetails setValue:tmp[@"Customer_ID"] forKey:@"Customer_ID"];
                
                [itemshowdetails setValue:tmp[@"PaymentDate"] forKey:@"PaymentDate"];
                
                [itemshowdetails setValue:tmp[@"Property_Code"] forKey:@"Property_Code"];
                [itemshowdetails setValue:tmp[@"ReceiptAmt"] forKey:@"ReceiptAmt"];
                [itemshowdetails setValue:tmp[@"ReceiptDescription"] forKey:@"ReceiptDescription"];
                
                [itemshowdetails setValue:tmp[@"ReceiptNo"] forKey:@"ReceiptNo"];
                
                [itemshowdetailsAr1 addObject:itemshowdetails];
                
                
            }
            
            
            
            
            
            // [itemshowdetails setValue:tmp[@"InvoiceDetails"] forKey:@"InvoiceDetails"];
            
            
            //[[[[responseDict objectAtIndex:0] valueForKey:@"MusicData"] objectAtIndex:0] valueForKey:@"user_music_id"]];
            // [itemshowdetailsAr2 addObject:[[@"InvoiceDetails"] forkey:@"InvoiceDetails"]];
            
            
            
            
            //        NSString *strrr1=[[[itemshowdetails objectForKey:@"InvoiceDetails" ] valueForKey:@"AdjustedAmt"]objectAtIndex:0];
            //        NSLog(@"aaaa...%@",strrr1);
            //
            //        [itemshowdetails setValue:strrr1 forKey:@"AdjustedAmt"];
            //
            //
            //        NSString *strrr2=[[[itemshowdetails objectForKey:@"InvoiceDetails" ] valueForKey:@"AdjustedAmt"]objectAtIndex:1];
            //        NSLog(@"aaaa...%@",strrr2);
            //
            //         [itemshowdetails setValue:strrr2 forKey:@"AdjustedAmt1"];
            
            
            
            
            
            
            
            
            
            
            
            // itemshowdetailsAr1 = [[itemshowdetailsAr1 arrayByAddingObjectsFromArray:js] mutableCopy];
            
            
            
            /*   NSArray *jge= tmp[@"InvoiceDetails" ];
             
             for (NSDictionary *tmp1 in jge)
             {
             NSMutableDictionary   *itemshowdetails1=[[NSMutableDictionary alloc]init];
             
             [itemshowdetails1 setValue:tmp1[@"AdjustedAmt"] forKey:@"AdjustedAmt"];
             
             [itemshowdetails1 setValue:tmp1[@"InvoiceAmount"] forKey:@"InvoiceAmount"];
             [itemshowdetails1 setValue:tmp1[@"InvoiceDate"] forKey:@"InvoiceDate"];
             [itemshowdetails1 setValue:tmp1[@"InvoiceDetails"] forKey:@"InvoiceDetails"];
             [itemshowdetails1 setValue:tmp1[@"InvoiceNo"] forKey:@"InvoiceNo"];
             
             // [itemshowdetails setValue:tmp1[@"AdjustedAmt"] forKey:@"AdjustedAmt"];
             
             
             
             
             [itemshowdetailsAr2 addObject:itemshowdetails1];
             NSLog(@"loooooool.............%@",itemshowdetailsAr2);
             }*/
            //  [itemshowdetails setValue:tmp[@"Customer_ID"] forKey:@"Customer_ID"];
            
            /*  for (int i=0; i<=itemshowdetailsAr2.count; i++) {
             if ([(self.itemshowdetailsAr2)[i][@"InvoiceDetails"] containsObject:@"GENERAL FUND Bill For Unit :...." ]) {
             for (NSDictionary *tmp2 in itemshowdetailsAr2[i])
             {
             NSMutableDictionary   *itemshowdetails2=[[NSMutableDictionary alloc]init];
             
             [itemshowdetails2 setValue:tmp2[@"AdjustedAmt"] forKey:@"AdjustedAmt"];
             
             [itemshowdetails2 setValue:tmp2[@"InvoiceAmount"] forKey:@"InvoiceAmount"];
             [itemshowdetails2 setValue:tmp2[@"InvoiceDate"] forKey:@"InvoiceDate"];
             [itemshowdetails2 setValue:tmp2[@"InvoiceDetails"] forKey:@"InvoiceDetails"];
             [itemshowdetails2 setValue:tmp2[@"InvoiceNo"] forKey:@"InvoiceNo"];
             
             [itemshowdetailsAr3 addObject:itemshowdetails2];
             
             
             
             }
             
             
             }
             else
             {
             
             
             NSMutableDictionary   *itemshowdetails2=[[NSMutableDictionary alloc]init];
             
             [itemshowdetails2 setValue:tmp2[@"AdjustedAmt"] forKey:@"AdjustedAmt"];
             
             [itemshowdetails2 setValue:tmp2[@"InvoiceAmount"] forKey:@"InvoiceAmount"];
             [itemshowdetails2 setValue:tmp2[@"InvoiceDate"] forKey:@"InvoiceDate"];
             [itemshowdetails2 setValue:tmp2[@"InvoiceDetails"] forKey:@"InvoiceDetails"];
             [itemshowdetails2 setValue:tmp2[@"InvoiceNo"] forKey:@"InvoiceNo"];
             
             [itemshowdetailsAr4 addObject:itemshowdetails2];
             
             
             
             
             
             
             
             
             
             }
             }*/
            
            
            // [itemshowdetails setValue:tmp[@"AdjustedAmt"] forKey:@"AdjustedAmt"];
            // [itemshowdetails setValue:tmp[@"InvoiceAmount"] forKey:@"InvoiceAmount"];
            //        [itemshowdetails setValue:tmp[@"DueDate"] forKey:@"DueDate"];
            //
            
            // NSLog(@"%@",itemshowdetails);
            
            
            
            
            
        }
    }
    else
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:ss  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        
        
    }
    
    if ([itemshowdetailsAr1 count]==0) {
        itemshowdetailsAr2=[itemshowdetailsAr mutableCopy];
    }
    else if([itemshowdetailsAr count]==0)
    {
        itemshowdetailsAr2=[itemshowdetailsAr1 mutableCopy];
        
    }
    else
    {
        itemshowdetailsAr2=[[itemshowdetailsAr arrayByAddingObjectsFromArray:itemshowdetailsAr1]mutableCopy];
        
    }
    
    
    
    
    
    
    NSLog(@"%@",itemshowdetailsAr1);
    
    NSLog(@"2222....%@",itemshowdetailsAr2);
    
    
    
    NSLog(@"3333....%@",itemshowdetailsAr3);
    NSLog(@"44444....%@",itemshowdetailsAr4);
    
    
    /* NSArray *newjson=[[itemshowdetailsAr1 objectAtIndex:0]objectForKey:@"InvoiceDetails"];
     
     
     
     NSLog(@"ssss........%@",newjson);
     
     
     
     self.itemshowdetailsAr2 = [[itemshowdetailsAr arrayByAddingObjectsFromArray:itemshowdetailsAr1] mutableCopy];
     
     NSLog(@"ssss........%@",itemshowdetailsAr2);*/
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)all:(id)sender {
    view3.hidden=YES;
    
    view1.hidden=NO;
    view2.hidden=YES;
}

- (IBAction)bill:(id)sender {
    view1.hidden=YES;
    view2.hidden=NO;
    view3.hidden=YES;
}

- (IBAction)invoice:(id)sender {
    view1.hidden=YES;
    view2.hidden=YES;
    view3.hidden=NO;
}
#pragma mark- tableviews
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // NSLog(@"aaaaa....%lu",(unsigned long)[self.itemshowdetailsAr count]);
    NSInteger count;
    if (tableView==table1)
    {
       count= [itemshowdetailsAr2 count];
    }
    else if (tableView==table2)
    {
       count= [itemshowdetailsAr count];
        
    }
    else
    {
        if ([itemshowdetailsAr1 count]!=0) {
           count= [itemshowdetailsAr1 count];
        }
        else
        {
            count =1;
        }
        
    }
  int  count1=(NSInteger)count;
    return count1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
       {
    
             return 75;
       }
       else
       {
    return 92;
       }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return  [UIView new];
}
- (IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *str=@"cell";
    
    celltransaction *cell=[tableView dequeueReusableCellWithIdentifier:str];
    
    if (cell==nil)
    {
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            
            
            NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"celltransaction" owner:nil options:nil ];
            for(UIView *vie in arr1)
            {
                if([vie isKindOfClass:[UITableViewCell class]])
                {
                    cell=(celltransaction*)vie;
                }
                
            }
        }
        else
        {
            // cell = [[paybillcell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"celltransaction_ipad" owner:nil options:nil ];
            for(UIView *vie in arr1)
            {
                if([vie isKindOfClass:[UITableViewCell class]])
                {
                    cell=(celltransaction*)vie;
                }
                
            }
            
            
        }
    }
     [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if (tableView==table1) {
        
        
        NSString *actDate1 = (self.itemshowdetailsAr2)[indexPath.row][@"InvoiceDate"];
       nDate1 = [[[[actDate1 componentsSeparatedByString:@"("] objectAtIndex:1] componentsSeparatedByString:@")"] objectAtIndex:0];
        NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:([nDate1 doubleValue] / 1000)];
        NSDateFormatter *dtfrm1 = [[NSDateFormatter alloc] init];
        [dtfrm1 setDateFormat:@"MM/dd/yyyy"];
        nDate1 = [dtfrm1 stringFromDate:date1];
        cell.tdate.text=[NSString stringWithFormat:@"%@",date1];
        
        
        // =(self.itemshowdetailsAr2)[indexPath.row][@"InvoiceDate"];
        NSString *ss=(self.itemshowdetailsAr2)[indexPath.row][@"InvoiceAmount"];
        NSLog(@"dueamt...%@",ss);
        cell.tamount.text=[NSString stringWithFormat:@"%@",ss];
        cell.tinvoice.text=(self.itemshowdetailsAr2)[indexPath.row][@"InvoiceNo"];
        
        
        // cell.tmonth=(self.itemshowdetailsAr2)[indexPath.row][@"head"];
        
       // [cell.tview addTarget:self
                     //  action:@selector(aMethod:) forControlEvents:UIControlEventTouchDown];
        if ([(self.itemshowdetailsAr2)[indexPath.row][@"head"] isEqualToString:@"Service Charge - General Fund"] || [(self.itemshowdetailsAr2)[indexPath.row][@"head"]isEqualToString:@"Service Charge Reserve Fund"]) {
            cell.bluelbl.hidden=NO;
            cell.greenlbl.hidden=YES;
        }
        else
        {
            cell.bluelbl.hidden=YES;
            cell.greenlbl.hidden=NO;
            
        }
        
    }
    if(tableView==table2)
    {
        NSString *actDate1 = (self.itemshowdetailsAr)[indexPath.row][@"InvoiceDate"];
        nDate1 = [[[[actDate1 componentsSeparatedByString:@"("] objectAtIndex:1] componentsSeparatedByString:@")"] objectAtIndex:0];
        NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:([nDate1 doubleValue] / 1000)];
        NSDateFormatter *dtfrm1 = [[NSDateFormatter alloc] init];
        [dtfrm1 setDateFormat:@"MM/dd/yyyy"];
        nDate1 = [dtfrm1 stringFromDate:date1];
        cell.tdate.text=[NSString stringWithFormat:@"%@",date1];
        
        
        
        // cell.tdate.text=(self.itemshowdetailsAr)[indexPath.row][@"head"];
        NSString *ss=(self.itemshowdetailsAr)[indexPath.row][@"DueAmount"];
        NSLog(@"dueamt...%@",ss);
        cell.tamount.text=[NSString stringWithFormat:@"%@",ss];
        cell.tinvoice.text=(self.itemshowdetailsAr)[indexPath.row][@"InvoiceNo"];
        
        cell.bluelbl.hidden=NO;
        cell.greenlbl.hidden=YES;
        
        
        
        
    }
    
     if(tableView ==table3)
    {
        if (itemshowdetailsAr1.count!=0) {
               NSString *actDate1 = (self.itemshowdetailsAr1                                                                                                                                                                  )[indexPath.row][@"InvoiceDate"];
        nDate1 = [[[[actDate1 componentsSeparatedByString:@"("] objectAtIndex:1] componentsSeparatedByString:@")"] objectAtIndex:0];
        NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:([nDate1 doubleValue] / 1000)];
        NSDateFormatter *dtfrm1 = [[NSDateFormatter alloc] init];
        [dtfrm1 setDateFormat:@"MM/dd/yyyy"];
        nDate1 = [dtfrm1 stringFromDate:date1];
        cell.tdate.text=[NSString stringWithFormat:@"%@",date1];
        
        
        NSString *ss=(self.itemshowdetailsAr1)[indexPath.row][@"InvoiceAmount"];
        NSLog(@"dueamt...%@",ss);
        cell.tamount.text=[NSString stringWithFormat:@"%@",ss];
        cell.tinvoice.text=(self.itemshowdetailsAr1)[indexPath.row][@"InvoiceNo"];
        cell.bluelbl.hidden=YES;
        cell.greenlbl.hidden=NO;
        
        }
    else
               {
                   table3.hidden=YES;
                   
                   
               }
    }
    
    // [ cell.tview addTarget:self action:@selector(showInfo:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     if (tableView==table1) {
        }
   
    
   else if (tableView==table2) {
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
    else
    {
        manage.t_receiptdet=(self.itemshowdetailsAr1)[indexPath.row][@"ReceiptDescription"];
        manage.t_receiptamt=(self.itemshowdetailsAr1)[indexPath.row][@"ReceiptAmt"];
        manage.t_receiptno=(self.itemshowdetailsAr1)[indexPath.row][@"ReceiptNo"];
        manage.t_propertycode=(self.itemshowdetailsAr1)[indexPath.row][@"Property_Code"];
        
        manage.t_receiptdate=(self.itemshowdetailsAr1)[indexPath.row][@"PaymentDate"];
        manage.t_invoicedetail=(self.itemshowdetailsAr1)[indexPath.row][@"InvoiceDetails"];
        manage.t_adjustamt=(self.itemshowdetailsAr1)[indexPath.row][@"AdjustedAmt"];
        manage.t_ivoiceamt=(self.itemshowdetailsAr1)[indexPath.row][@"InvoiceAmount"];
        
        manage.t_invoiceno=(self.itemshowdetailsAr1)[indexPath.row][@"InvoiceNo"];
        manage.t_invoicedate=(self.itemshowdetailsAr1)[indexPath.row][@"InvoiceDate"];
        
        
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            viewtransaction *login = [[viewtransaction alloc]initWithNibName:@"viewtransaction" bundle:nil];
            [self.navigationController pushViewController:login animated:YES];
        }
        else
        {
            viewtransaction *login = [[viewtransaction alloc]initWithNibName:@"viewtransaction_ipad" bundle:nil];
            [self.navigationController pushViewController:login animated:YES];
        }
        
        
        
        
 
        
        
        
    }
}

-(IBAction) segmentedControlIndexChanged
{
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            view3.hidden=YES;
            
            view1.hidden=NO;
            view2.hidden=YES;
            break;
        case 1:
            view1.hidden=YES;
            view2.hidden=NO;
            view3.hidden=YES;
            break;
        case 2:
            view1.hidden=YES;
            view2.hidden=YES;
            view3.hidden=NO;
            break;
            
            
            
        default:
            break;
    }
    
}
@end
