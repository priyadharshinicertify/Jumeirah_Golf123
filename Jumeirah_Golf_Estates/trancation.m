//
//  trancation.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 16/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "trancation.h"
#import "BackgroundLayer.h"
#import "trancell.h"
#import "tranctionhistory.h"
@interface trancation ()

@end

@implementation trancation
@synthesize tblvie;
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
    
    // Do any additional setup after loading the view from its nib.
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // NSLog(@"aaaaa....%lu",(unsigned long)[self.itemshowdetailsAr count]);
    return 1;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
    
   
           return 95;
      }
       else
       {
    return 126;
       }
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *str=@"cell";
    
    trancell *cell=[tblvie dequeueReusableCellWithIdentifier:str];
    if (cell==nil)
    {
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            
            
            NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"trancell_iphone" owner:nil options:nil ];
            for(UIView *vie in arr1)
            {
                if([vie isKindOfClass:[UITableViewCell class]])
                {
                    cell=(trancell*)vie;
                }
                
            }
        }
        else
        {
            // cell = [[paybillcell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"trancell" owner:nil options:nil ];
            for(UIView *vie in arr1)
            {
                if([vie isKindOfClass:[UITableViewCell class]])
                {
                    cell=(trancell*)vie;
                }
                
            }
            
            
        }
    }
    
    
    // cell.servicecharge.text=@"hellllo";
    cell.username.text=manage.userlogin;
    cell.iid.text=manage.cus_iid;
    cell.history.tag = indexPath.row;
    [ cell.history addTarget:self action:@selector(showInfo:) forControlEvents:UIControlEventTouchUpInside];
   
    
   // cell.history.backgroundColor=[UIColor lightGrayColor];
    cell.history.layer.borderWidth=1;
    cell.history.layer.cornerRadius=3;
    
    
    return cell;
}
-(void)showInfo:(UIButton*)button{
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        tranctionhistory *home = [[tranctionhistory alloc]initWithNibName:@"tranctionhistory_iphone" bundle:nil];
        [self.navigationController pushViewController:home animated:YES];
    }
    else
    {
        tranctionhistory *home = [[tranctionhistory alloc]initWithNibName:@"tranctionhistory" bundle:nil];
        [self.navigationController pushViewController:home animated:YES];
    }
  
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@end
