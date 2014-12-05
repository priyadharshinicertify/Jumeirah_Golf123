//
//  Abtus.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 21/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "Abtus.h"
#import "RZCellSizeManager.h"


#define FONT_SIZE 14.0f

#define CELL_CONTENT_MARGIN 10.0f
@interface Abtus ()<UIAlertViewDelegate>
@property (strong, nonatomic) RZCellSizeManager *sizeManager;
@property (nonatomic) float CELL_CONTENT_WIDTH;
@end

@implementation Abtus
@synthesize img,itemshowdetailsAr,CELL_CONTENT_WIDTH;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            CELL_CONTENT_WIDTH =320.0f;
        }
        else
        {
            UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
            
            if(orientation == UIDeviceOrientationPortrait)
            {
                CELL_CONTENT_WIDTH=768.0f;
            }
            else
            {
                CELL_CONTENT_WIDTH =1024.0f;
                
            }
            
        }

    }
    return self;
}

- (void)viewDidLoad
{
      [super viewDidLoad];
    
    
    [self.itemshowdetailsAr removeAllObjects];
    self.itemshowdetailsAr=[[NSMutableArray alloc] init];
    [self getcontactdetails];
    
    
    self.title=@"About JGE";
  
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getcontactdetails
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/about_us.php"]] ];
    
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
}

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
     customAlert.tag=100;
    [customAlert show];
}
-(IBAction)home:(id)sender
{[self.navigationController popViewControllerAnimated:YES];    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    
    if (receivedData) {
        
        NSError *e = nil;
        NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:receivedData options: NSJSONReadingMutableContainers error: &e];
        
        NSLog(@"%@",jsonArray1);
        
        NSString *imgstring=jsonArray1[@"image"];
        NSArray *jsonArray=jsonArray1[@"about_us"];
        
       
        for (NSDictionary *tmp in jsonArray)
        {
            NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
            
            [itemshowdetails setValue:tmp[@"heading"] forKey:@"heading"];
            [itemshowdetails setValue:tmp[@"description"] forKey:@"description"];
           // [itemshowdetails setValue:[tmp objectForKey:@"image"] forKey:@"image"];
            
            [self.itemshowdetailsAr addObject:itemshowdetails];
                   }
        [self.tblvie reloadData];
       // NSString *imagestring=[[itemshowdetailsAr objectAtIndex:2] objectForKey:@"image"];
        
       // NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imagestring]];
       // img.image = [UIImage imageWithData:imageData];
        
        [AsynchronousFreeloader loadImageFromLink:imgstring forImageView:img withPlaceholder:nil andContentMode:UIViewContentModeScaleToFill];
        
      
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"no network"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        alert.tag=100;
        [alert show];
    }
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"About Jumeriah Screen";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.itemshowdetailsAr count];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text1=itemshowdetailsAr[indexPath.row][@"heading"];
    text1=[text1 stringByAppendingString:@"\n\t"];
    NSString *text2 =itemshowdetailsAr[indexPath.row][@"description"];
    NSString *text3=[text1 stringByAppendingString:text2];
    
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    
    NSAttributedString *attributedText =
    [[NSAttributedString alloc]
     initWithString:text3
     attributes:@
     {
     NSFontAttributeName:[UIFont systemFontOfSize:FONT_SIZE]
     }];
    CGRect rect = [attributedText boundingRectWithSize:constraint
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];
    CGSize size = rect.size;
    
    
    CGFloat height = MAX(size.height, 44.0f);
    
    return height + (CELL_CONTENT_MARGIN * 2);

}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.backgroundView.backgroundColor = [UIColor clearColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str=@"cell";
    UILabel *label = nil;
    
    
    UITableViewCell *cell=[self.tblvie dequeueReusableCellWithIdentifier:str];
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor=[UIColor clearColor];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        [label setLineBreakMode:NSLineBreakByWordWrapping];
        [label setMinimumScaleFactor:FONT_SIZE];
        [label setNumberOfLines:0];
        [label setFont:[UIFont systemFontOfSize:18]];
        [label setTextColor:[UIColor whiteColor]];
        [label setTag:1];
        
        //[[label layer] setBorderWidth:2.0f];
        
        [[cell contentView] addSubview:label];
        
    }
    
    [cell setBackgroundColor:[UIColor clearColor]];
    NSString *text1=itemshowdetailsAr[indexPath.row][@"heading"];
    text1=[text1 stringByAppendingString:@"\n\n\t\t"];
    NSString *text2 =itemshowdetailsAr[indexPath.row][@"description"];
    NSString *text3=[text1 stringByAppendingString:text2];
    //cell.lblAddress.textColor=[UIColor whiteColor];
    //    NSString *text1 = [items objectAtIndex:[indexPath row]];
    //    NSString *text2 = [items objectAtIndex:[indexPath row]];
    
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    
    NSAttributedString *attributedText = [[NSAttributedString alloc]initWithString:text3 attributes:@{
                                                                                                      NSFontAttributeName:[UIFont systemFontOfSize:FONT_SIZE]
                                                                                                      }];
    CGRect rect = [attributedText boundingRectWithSize:constraint
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];
    CGSize size = rect.size;
    
    if (!label)
        label = (UILabel*)[cell viewWithTag:1];
    
    [label setText:text3];
    [label sizeToFit];
    [label setFrame:CGRectMake(10, CELL_CONTENT_MARGIN, CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), MAX(size.height, 44.0f))];
    //[cell.label sizeToFit];

        return cell;
   

    
}

#pragma mark - alert deletegate Method

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==100) {
        [self.tblvie setHidden:YES];
    }
    else
    {
        [self.tblvie setHidden:NO];

    }
}


@end
