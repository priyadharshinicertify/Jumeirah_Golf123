//
//  Eservices.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 23/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "Eservices.h"
#import "servicecell.h"
#import "BackgroundLayer.h"
@interface Eservices ()
{
    NSMutableData *receivedData;
    
   

    
    
    
    
}
@end

@implementation Eservices
@synthesize tblvie,spinner;
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
    manage=[singleton share];
    [self.itemshowdetailsAr removeAllObjects];
    self.itemshowdetailsAr=[[NSMutableArray alloc] init];
    [self getcontactdetails];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getcontactdetails
{
   // spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
  // spinner.center=CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height/2);
    spinner.color=[UIColor blackColor];
    [self.view addSubview:spinner];
     self.view.center=spinner.center;
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
    
        //back to the main thread for the UI call
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner startAnimating];
        });

    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/e_services.php"]] ];
    
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
        
        NSArray *jsonArray =jsonArray1[@"e_services"];
        
        
        for (NSDictionary *tmp in jsonArray)
        {
            NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
            
           [itemshowdetails setValue:tmp[@"date"] forKey:@"date"];
            [itemshowdetails setValue:tmp[@"description"] forKey:@"description"];
            [itemshowdetails setValue:tmp[@"url_path"] forKey:@"url_path"];
            [itemshowdetails setValue:tmp[@"title"] forKey:@"title"];
            [self.itemshowdetailsAr addObject:itemshowdetails];
            
        }
        [self.tblvie reloadData];
    }    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"no network"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    [self.tblvie reloadData];
    dispatch_async(dispatch_get_main_queue(), ^{
        [spinner stopAnimating];
    });
    

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.itemshowdetailsAr count];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {

    return 120;
    }
    else
    {
        return  126;
    }
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.tblvie reloadRowsAtIndexPaths:[self.tblvie indexPathsForVisibleRows]
                       withRowAnimation:UITableViewRowAnimationNone];
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor whiteColor];
    
    //  cell.textLabel.textColor=[UIColor whiteColor];
    cell.backgroundView.backgroundColor = [UIColor clearColor];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return  [UIView new];
}
/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 static NSString *CellIdentifier = @"cell";
 
 
 cellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 
 
 if (cell == nil) {
 cell = [[cellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
 
 
 }
 
 
 
 cell.lblId.text = [[self.itemshowdetailsAr objectAtIndex:indexPath.row ] objectForKey:@"id"];
 cell.lblfor.text = [[self.itemshowdetailsAr objectAtIndex:indexPath.row ] objectForKey:@"for"];
 cell.lblpersname.text = [[self.itemshowdetailsAr objectAtIndex:indexPath.row ] objectForKey:@"contact_person_name"];
 cell.lbldesignation.text = [[self.itemshowdetailsAr objectAtIndex:indexPath.row ] objectForKey:@"designation"];
 cell.lblcontent.text = [[self.itemshowdetailsAr objectAtIndex:indexPath.row ] objectForKey:@"content"];
 cell.lblmailid.text = [[self.itemshowdetailsAr objectAtIndex:indexPath.row ] objectForKey:@"mail_id"];
 cell.lblcontact.text = [[self.itemshowdetailsAr objectAtIndex:indexPath.row ] objectForKey:@"contact_number"];
 cell.lblAddress.text = [[self.itemshowdetailsAr objectAtIndex:indexPath.row ] objectForKey:@"address"];
 
 return cell;
 
 
 
 
 }
 */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str=@"cell";
    
    servicecell *cell=[self.tblvie dequeueReusableCellWithIdentifier:str];
    if (cell==nil)
    {
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            
        NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"servicecell" owner:nil options:nil ];
        for(UIView *vie in arr1)
        {
            if([vie isKindOfClass:[UITableViewCell class]])
            {
                cell=(servicecell*)vie;
            }
        }
        }
        else
        {
            NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"servicecell_ipad" owner:nil options:nil ];
            for(UIView *vie in arr1)
            {
                if([vie isKindOfClass:[UITableViewCell class]])
                {
                    cell=(servicecell*)vie;
                }
            }
  
        }
    }
    
  [cell setBackgroundColor:[UIColor whiteColor]];
    cell.des.textColor=[UIColor blackColor];
    cell.date1.textColor=[UIColor blackColor];
     cell.txt.textColor=[UIColor blackColor];
    CALayer *separator = [CALayer layer];
    separator.backgroundColor = [UIColor blackColor].CGColor;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        //separator.frame = CGRectMake(0,66, self.view.frame.size.width, 1);
    }
    else
    {
        separator.frame = CGRectMake(0,126, self.view.frame.size.width, 3);
    }
    [cell.layer addSublayer:separator];

    //cell.lblAddress.textColor=[UIColor whiteColor];
    //  cell.backgroundColor = [UIColor clearColor];
   // cell.date.text = [[self.itemshowdetailsAr objectAtIndex:indexPath.row ] objectForKey:@"date"];
    
    cell.des.text = (self.itemshowdetailsAr)[indexPath.row][@"title"];
    
    cell.date1.text=(self.itemshowdetailsAr)[indexPath.row][@"date"];
    
    cell.txt.text=(self.itemshowdetailsAr)[indexPath.row][@"description"];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    manage.services_url=(self.itemshowdetailsAr)[indexPath.row][@"url_path"];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        webEservices *login = [[webEservices alloc]initWithNibName:@"webEservices_iphone" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
    else
    {
        webEservices *login = [[webEservices alloc]initWithNibName:@"webEservices_ipad" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    spinner.center=CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height/2);
    self.screenName = @"Eservices Screen";
    [self.tblvie reloadRowsAtIndexPaths:[self.tblvie indexPathsForVisibleRows]
                       withRowAnimation:UITableViewRowAnimationNone];
}

-(IBAction)home:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
