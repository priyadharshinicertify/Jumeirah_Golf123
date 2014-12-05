//
//  vacancy.m
//  Jumeirah
//
//  Created by Veeramani on 17/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "vacancy.h"
#import "vacancycell.h"

#import "brifejob.h"

@interface vacancy ()
@property(strong,nonatomic)IBOutlet  UIActivityIndicatorView *spinner;
@end

@implementation vacancy
@synthesize tblvie,lbl,spinner;
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
    

    
    
    CAGradientLayer *btnGradient2 = [BackgroundLayer blackWhiteGradient];
    btnGradient2.frame = self.lbl.bounds;
    //btnGradient1.cornerRadius=5;
    //btnGradient1.borderWidth=1.0;
    //btnGradient1.borderColor=([UIColor whiteColor]).CGColor;
    [self.lbl.layer insertSublayer:btnGradient2 atIndex:0];
    
      manage=[singleton share];
    
    
    
    [self.itemshowdetailsAr removeAllObjects];
    self.itemshowdetailsAr=[[NSMutableArray alloc] init];
    [self getcontactdetails];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)getcontactdetails
{
    [spinner startAnimating];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/show_vacancies.php"]] ];
    
    [request setHTTPMethod:@"GET"];
    
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (con) {
        NSLog(@"data sent ");
    } else
    {
        NSLog(@"Not sent");
    }
    [con start];
    

    
    
    
    
    
    
    
  //  NSString *post = @"start_index=&per_page=&sort=&user_type=";
   /* NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSLog(@"postData.....%@", post);
    
    // NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSString *URL = [NSString stringWithFormat:@"http://mobileapp.certifytechnologies.com/jumeirah/show_vacancies.php"];
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
    
    
   NSArray *jsonArray=[jsonArray1 objectForKey:@"vacancies"];
    
    //  NSDictionary *tmp=(NSDictionary*)[jsonArray object]
    for (NSDictionary *tmp in jsonArray)
    {
        NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
        
        [itemshowdetails setValue:[tmp objectForKey:@"date_of_job_posting"] forKey:@"date_of_job_posting"];
        [itemshowdetails setValue:[tmp objectForKey:@"job_description"] forKey:@"job_description"];
         [itemshowdetails setValue:[tmp objectForKey:@"job_title"] forKey:@"job_title"];
        [itemshowdetails setValue:[tmp objectForKey:@"job_reference_number"] forKey:@"job_reference_number"];
       [itemshowdetails setValue:[tmp objectForKey:@"last_date_for_application"] forKey:@"last_date_for_application"];
        [itemshowdetails setValue:[tmp objectForKey:@"minimum_educational_qualification"] forKey:@"minimum_educational_qualification"];
        [itemshowdetails setValue:[tmp objectForKey:@"number_of_years_experience"] forKey:@"number_of_years_experience"];
        [itemshowdetails setValue:[tmp objectForKey:@"show_vacancies_id"] forKey:@"show_vacancies_id"];
        [itemshowdetails setValue:[tmp objectForKey:@"who_can_apply"] forKey:@"who_can_apply"];

        [self.itemshowdetailsAr addObject:itemshowdetails];
        NSLog(@"%@",itemshowdetails);
    }
    [self.tblvie reloadData];*/
    
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
    NSLog(@"th eres %@",jsonArray1);
    if (jsonArray1)
    {
        
        NSArray *jsonArray=jsonArray1[@"vacancies"];
        
        //  NSDictionary *tmp=(NSDictionary*)[jsonArray object]
        for (NSDictionary *tmp in jsonArray)
        {
            NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
            
            [itemshowdetails setValue:tmp[@"date_of_job_posting"] forKey:@"date_of_job_posting"];
            [itemshowdetails setValue:tmp[@"job_description"] forKey:@"job_description"];
            [itemshowdetails setValue:tmp[@"job_title"] forKey:@"job_title"];
            [itemshowdetails setValue:tmp[@"job_reference_number"] forKey:@"job_reference_number"];
            [itemshowdetails setValue:tmp[@"last_date_for_application"] forKey:@"last_date_for_application"];
            [itemshowdetails setValue:tmp[@"minimum_educational_qualification"] forKey:@"minimum_educational_qualification"];
            [itemshowdetails setValue:tmp[@"number_of_years_experience"] forKey:@"number_of_years_experience"];
            [itemshowdetails setValue:tmp[@"show_vacancies_id"] forKey:@"show_vacancies_id"];
            [itemshowdetails setValue:tmp[@"who_can_apply"] forKey:@"who_can_apply"];
            
            [self.itemshowdetailsAr addObject:itemshowdetails];
            NSLog(@"%@",itemshowdetails);
        }
        [self.tblvie reloadData];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"no network"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
   // [self.tblvie reloadData];
    [spinner stopAnimating];
    [spinner hidesWhenStopped];
    spinner.hidden=YES;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.itemshowdetailsAr count];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
    return 44;
    }
    else
    {
        return 136;
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor whiteColor];
    
    //  cell.textLabel.textColor=[UIColor whiteColor];
    cell.backgroundView.backgroundColor = [UIColor clearColor];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str=@"cell";
    
    vacancycell *cell=[self.tblvie dequeueReusableCellWithIdentifier:str];
    if (cell==nil)
    {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            

        NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"vacancycell" owner:nil options:nil ];
        for(UIView *vie in arr1)
        {
            if([vie isKindOfClass:[UITableViewCell class]])
            {
                cell=(vacancycell*)vie;
            }
        }
        }
        else
        {
            NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"vacancycell_ipad" owner:nil options:nil ];
            for(UIView *vie in arr1)
            {
                if([vie isKindOfClass:[UITableViewCell class]])
                {
                    cell=(vacancycell*)vie;
                }
            }

        }
    }
    
    [cell setBackgroundColor:[UIColor clearColor]];
      cell.backgroundColor = [UIColor clearColor];
    cell.tit.text = (self.itemshowdetailsAr)[indexPath.row][@"job_title"];
      cell.date.text = (self.itemshowdetailsAr)[indexPath.row][@"last_date_for_application"];
    cell.txt.text=(self.itemshowdetailsAr)[indexPath.row][@"job_description"];
    
    
      return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        brifejob *login = [[brifejob alloc]initWithNibName:@"brifejob_iphone" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
    else
    {
        brifejob *login = [[brifejob alloc]initWithNibName:@"brifejob_ipad" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }

   
    manage.job_title=(self.itemshowdetailsAr)[indexPath.row][@"job_title"];
    manage.job_reference_number=(self.itemshowdetailsAr)[indexPath.row][@"job_reference_number"];
    manage.job_last_date=(self.itemshowdetailsAr)[indexPath.row][@"last_date_for_application"];
   
    manage.job_who_can_apply=(self.itemshowdetailsAr)[indexPath.row][@"who_can_apply"];
     manage.job_postdate=(self.itemshowdetailsAr)[indexPath.row][@"date_of_job_posting"];
       manage.job_experience=(self.itemshowdetailsAr)[indexPath.row][@"number_of_years_experience"];
       manage.job_description=(self.itemshowdetailsAr)[indexPath.row][@"job_description"];
       manage.job__educational_qualification=(self.itemshowdetailsAr)[indexPath.row][@"minimum_educational_qualification"];
    
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return  [UIView new];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Vacancy Screen";
}

-(IBAction)home:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
