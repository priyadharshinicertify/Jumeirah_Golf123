//
//  newsletter.m
//  Jumeirah
//
//  Created by Veeramani on 18/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "newsletter.h"
#import "lettercell.h"
#import "BackgroundLayer.h"
@interface newsletter ()
{
    NSMutableData *receivedData;
}
@property(strong,nonatomic)IBOutlet  UIActivityIndicatorView *spinner;
@end

@implementation newsletter
@synthesize spinner,titleing;
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Newsletter Screen";
    [self.tblvie reloadRowsAtIndexPaths:[self.tblvie indexPathsForVisibleRows]
                          withRowAnimation:UITableViewRowAnimationNone];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getcontactdetails
{
   [spinner startAnimating];
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/newsletter.php"]] ];
    
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
        
        NSArray *jsonArray =jsonArray1[@"newsletter"];
        
        
        for (NSDictionary *tmp in jsonArray)
        {
            NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
            
            [itemshowdetails setValue:tmp[@"date"] forKey:@"date"];
            [itemshowdetails setValue:tmp[@"description"] forKey:@"description"];
            [itemshowdetails setValue:tmp[@"url_path"] forKey:@"url_path"];
            
             [itemshowdetails setValue:tmp[@"title"] forKey:@"title"];
            
            //title
            
            [self.itemshowdetailsAr addObject:itemshowdetails];
            
        }
        [self.tblvie reloadData];
    }    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"no network"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    [self.tblvie reloadData];
    [spinner stopAnimating];
    [spinner hidesWhenStopped];
   }


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.itemshowdetailsAr count];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {

    return 55;
    }
    else
    {
      return 126;
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
  cell.backgroundColor = [UIColor whiteColor];
    
    cell.textLabel.textColor=[UIColor blackColor];
     cell.backgroundView.backgroundColor = [UIColor clearColor];
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

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.tblvie reloadRowsAtIndexPaths:[self.tblvie indexPathsForVisibleRows]
                       withRowAnimation:UITableViewRowAnimationNone];
   
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return  [UIView new];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str=@"cell";
    
    lettercell *cell=[self.tblvie dequeueReusableCellWithIdentifier:str];
    if (cell==nil)
    {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {

        
        NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"lettercell" owner:nil options:nil ];
        for(UIView *vie in arr1)
        {
            if([vie isKindOfClass:[UITableViewCell class]])
            {
                cell=(lettercell*)vie;
            }
        }
        }
        else
        {
            NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"lettercell_ipad" owner:nil options:nil ];
            for(UIView *vie in arr1)
            {
                if([vie isKindOfClass:[UITableViewCell class]])
                {
                    cell=(lettercell*)vie;
                }
            }
 
        }
    }
    [cell setBackgroundColor:[UIColor whiteColor]];
    
   // [cell setBackgroundColor:[UIColor whiteColor]];
    //cell.tit.textColor=[UIColor blackColor];
    
    cell.des.textColor=[UIColor blackColor];
    
    cell.date.textColor=[UIColor blackColor];
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
    
    
    cell.date.text = (self.itemshowdetailsAr)[indexPath.row][@"date"];
    
    cell.txt.text = (self.itemshowdetailsAr)[indexPath.row][@"description"];
    cell.des.text=(self.itemshowdetailsAr)[indexPath.row][@"title"];
    
    
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    manage.letter_url=(self.itemshowdetailsAr)[indexPath.row][@"url_path"];
    
   
    manage.newsletter_tit=@"Newsletter";
 
    
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
-(IBAction)home:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];    
}
@end
