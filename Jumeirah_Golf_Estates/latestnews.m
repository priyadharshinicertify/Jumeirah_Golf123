//
//  latestnews.m
//  Jumeirah
//
//  Created by Veeramani on 26/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "latestnews.h"
#import "newscell.h"
#import "brief_news.h"
#import "BackgroundLayer.h"
@interface latestnews ()<UITableViewDataSource,UITableViewDelegate>
{
    singleton *manage;
    NSURLConnection *Login_Connection;
    NSMutableData *receivedData;
    NSDictionary *jsonObject;
}
@property(strong,nonatomic)IBOutlet UITableView *tblvie;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@property(strong,nonatomic)IBOutlet UILabel *lbl1;
@property(strong,nonatomic)IBOutlet UIButton *lbl;
@property(strong,nonatomic)IBOutlet UILabel *tit1;
@property(strong,nonatomic)IBOutlet  UIActivityIndicatorView *spinner;
@end

@implementation latestnews
@synthesize tblvie,lbl,lbl1,tit1,itemshowdetailsAr,spinner;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated
{
    self.screenName=@"latestNews Screen";
    NSLog(@"cefef");
    tit1.font=[UIFont fontWithName:@"Roboto-Regular" size:5.0];
    tit1.font=[UIFont systemFontOfSize:16.0];
    
    }


- (void)viewDidLoad
{
    [super viewDidLoad];
    
       [self getcontactdetails];
    
    
    
    
    
    tblvie.backgroundColor=[UIColor blackColor];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)getcontactdetails
{
    CAGradientLayer *btnGradient3 = [BackgroundLayer blackWhiteGradient];
    btnGradient3.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient3 atIndex:0];
    lbl.titleLabel.font=[UIFont fontWithName:@"Roboto-Regular" size:5.0];
    lbl.titleLabel.font=[UIFont systemFontOfSize:10.0];
    lbl1.font=[UIFont fontWithName:@"Roboto-Regular" size:5.0];
    lbl1.font=[UIFont systemFontOfSize:10.0];
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.lbl.bounds;
    btnGradient1.cornerRadius=5;
    btnGradient1.borderWidth=1.0;
    btnGradient1.borderColor=([UIColor whiteColor]).CGColor;
    [self.lbl.layer insertSublayer:btnGradient1 atIndex:0];
    
    self.tblvie.tableFooterView=[[UIView alloc] init];
    manage=[singleton share];
    [self.itemshowdetailsAr removeAllObjects];
    self.itemshowdetailsAr=[[NSMutableArray alloc] init];

    
    [spinner startAnimating];

    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/news.php"]] ];
    
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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    UIAlertView *customAlert = [[UIAlertView alloc]initWithTitle:@"No NetWork" message:@"Internet Connection is Lost" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [customAlert show];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    
    NSError *e = nil;
    NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:receivedData options: NSJSONReadingMutableContainers error: &e];
    NSLog(@"th eres %@",jsonArray1);
    if (jsonArray1)
    {
        
        NSArray *jsonArray=jsonArray1[@"news"];
        
        for (NSDictionary *tmp in jsonArray)
        {
            NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
            
            [itemshowdetails setValue:tmp[@"date"] forKey:@"date"];
            [itemshowdetails setValue:tmp[@"news_description"] forKey:@"news_description"];
            //  [itemshowdetails setValue:[tmp objectForKey:@"id"] forKey:@"id"];
            [itemshowdetails setValue:tmp[@"news_image"] forKey:@"news_image"];
            // [itemshowdetails setValue:[tmp objectForKey:@"content"] forKey:@"content"];
            [itemshowdetails setValue:tmp[@"news_title"] forKey:@"news_title"];
            
            [self.itemshowdetailsAr addObject:itemshowdetails];
            NSLog(@"%@",itemshowdetails);
        }
    }
    else
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
        
    return 93;
    }
    return 126;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return  [UIView new];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor whiteColor];
    
    //  cell.textLabel.textColor=[UIColor whiteColor];
    cell.backgroundView.backgroundColor = [UIColor clearColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str=@"cell";
    
    newscell *cell=[self.tblvie dequeueReusableCellWithIdentifier:str];
    
  
    
    
    
    
    
    if (cell==nil)
    {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            
            NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"newscell" owner:nil options:nil ];
        for(UIView *vie in arr1)
        {
            if([vie isKindOfClass:[UITableViewCell class]])
            {
                cell=(newscell*)vie;
            }
        }
        }
        else
        {
            NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"newscell_ipad" owner:nil options:nil ];
            for(UIView *vie in arr1)
            {
                if([vie isKindOfClass:[UITableViewCell class]])
                {
                    cell=(newscell*)vie;
                }
            }
 
        }
    }
    [cell setBackgroundColor:[UIColor whiteColor]];
    
//    CALayer *separator = [CALayer layer];
//   separator.backgroundColor = [UIColor blackColor].CGColor;
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
//    {
//    //separator.frame = CGRectMake(0,66, self.view.frame.size.width, 1);
//    }
//    else
//   {
//        separator.frame = CGRectMake(0,126, self.view.frame.size.width, 3);
//    }
//    [cell.layer addSublayer:separator];

    [cell setBackgroundColor:[UIColor clearColor]];
    //cell.lblAddress.textColor=[UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    
    
    
    
    cell.tit.text = (self.itemshowdetailsAr)[indexPath.row][@"news_title"];
    
    cell.des.text = (self.itemshowdetailsAr)[indexPath.row][@"news_description"];
  
     [AsynchronousFreeloader loadImageFromLink:itemshowdetailsAr[indexPath.row][@"news_image"] forImageView:cell.img withPlaceholder:nil andContentMode:UIViewContentModeScaleAspectFit];
       cell.date.text = (self.itemshowdetailsAr)[indexPath.row][@"date"];
    manage.commendate=cell.date.text;
    
    
    
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        brief_news *login = [[brief_news alloc]initWithNibName:@"briefnews_iphone" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
    else
    {
        brief_news *login = [[brief_news alloc]initWithNibName:@"briefnews_ipad" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }

    
    

    manage.commentit=(self.itemshowdetailsAr)[indexPath.row][@"news_title"];
    manage.commendes=(self.itemshowdetailsAr)[indexPath.row][@"news_description"];
    manage.commenimg1=(self.itemshowdetailsAr)[indexPath.row][@"news_image"];
    // manage.commenimg=[UIImage imageWithData:imageData];
    manage.commendate=(self.itemshowdetailsAr)[indexPath.row][@"date"];
    
    
   
    
}

-(IBAction)events:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];    
}


@end
