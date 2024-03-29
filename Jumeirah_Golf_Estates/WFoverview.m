//
//  WFoverview.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 30/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "WFoverview.h"
#import "RZTableViewController.h"
#import "RZCellData.h"
#import "RZCellSizeManager.h"
#import "RESideMenu.h"
#import "RZTableViewCell.h"
#import "singleton.h"
#import "Reachability.h"
#import "NSString+RandomString.h"
#import "tablecellps.h"
#define kRZMaxCells             100
#define kRZMaxTitleLength       50
#define kRZMaxDescriptionLength 900
#define FONT_SIZE 18.0f
//#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f

@interface WFoverview()<UITableViewDataSource, UITableViewDelegate>
{
    singleton *manage;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray* dataArray;
@property (strong, nonatomic) RZCellSizeManager* sizeManager;

@end

@implementation WFoverview
@synthesize itemshowdetailsAr,dataArray,itemshowdetailsAr1,collectionViewPack;
- (void)viewDidLoad
{
    [super viewDidLoad];
    manage=[singleton share];
    [self configureDataSource];
    
    [self configureTableView];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [self.collectionViewPack registerNib:[UINib nibWithNibName:@"tablecellps" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
    }
    else
    {
        [self.collectionViewPack registerNib:[UINib nibWithNibName:@"tablecellps_ipad" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
    }
    
    
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.title = @"Overview";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"l1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(presentLeftMenuViewController:)];
    UIColor *barColour = [UIColor colorWithRed:(50/255.0) green:(167/255.0) blue:(214/255.0) alpha:1];
    [[UINavigationBar appearance] setBarTintColor: barColour];
}

- (void)configureDataSource
{
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/property_showcase4.php"]] ];
    NSString *requestString = [NSString stringWithFormat:@"district_id=jge-wf"];
    
    //CELL_CONTENT_WIDTH 320.0f
    
    
    
    
    NSLog(@" RequestString: %@",requestString);
    
    NSMutableData *requestData =[NSMutableData dataWithBytes:[requestString UTF8String] length: [requestString length]];
    
    [request setHTTPMethod: @"POST"];
    
    [request setHTTPBody: requestData];
 
    NSError *err1;
    NSURLResponse *response1;
    NSData *responseData1 = [NSURLConnection sendSynchronousRequest:request returningResponse:&response1 error:&err1];
    if (responseData1) {
        
        
        NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:responseData1 options: NSJSONReadingMutableContainers error: &err1];
        itemshowdetailsAr=[[NSMutableArray alloc]init];
         itemshowdetailsAr1=[[NSMutableArray alloc]init];
        if ([jsonArray1 count]==0) {
            
        }
        else
        {
            //  NSString *imgstring=jsonArray1[@"image"];
            // NSLog(@"iiius..%@",imgstring);
            
            NSArray *jsonArray=jsonArray1[@"district"];
            
            NSLog(@"us..%@",jsonArray1);
            
            for (NSDictionary *tmp in jsonArray)
            {
                NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
                
                [itemshowdetails setValue:tmp[@"heading"] forKey:@"heading"];
                [itemshowdetails setValue:tmp[@"data"] forKey:@"data"];
                // [itemshowdetails setValue:[tmp objectForKey:@"image"] forKey:@"image"];
                
                [self.itemshowdetailsAr addObject:itemshowdetails];
            }
            NSLog(@"item...%@",itemshowdetailsAr);
            

            // Create an array of random objects to be the datasource so its different every time.
            NSMutableArray* arry = [NSMutableArray array];
            for (int i = 0; i<[itemshowdetailsAr count]; i++)
            {
                [arry addObject:[RZCellData cellDataWithTitle:itemshowdetailsAr[i][@"heading"] subTitle:itemshowdetailsAr[i][@"data"]]];
            }
            self.dataArray = [NSArray arrayWithArray:arry];
            NSLog(@"dataarray...%@",dataArray);
            
         
            self.sizeManager = [[RZCellSizeManager alloc] init];
            [self.sizeManager registerCellClassName:@"RZTableViewCell"
                                       withNibNamed:nil
                                     forObjectClass:nil
                             withConfigurationBlock:^(RZTableViewCell* cell, id object) {
                                 [cell setCellData:object];
                             }];
            NSArray *jsonArrayp=jsonArray1[@"plot"];
            NSLog(@"usnew..%@",jsonArrayp);
            
            for (NSDictionary *tmp in jsonArrayp)
            {
                NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
                
                [itemshowdetails setValue:tmp[@"bua_size"] forKey:@"bua_size"];
                [itemshowdetails setValue:tmp[@"plot_size"] forKey:@"plot_size"];
                [itemshowdetails setValue:[tmp objectForKey:@"number_of_bedroom"] forKey:@"number_of_bedroom"];
                [itemshowdetails setValue:tmp[@"price"] forKey:@"price"];
                [self.itemshowdetailsAr1 addObject:itemshowdetails];
            }
            
            
            
            NSLog(@"item...%@",itemshowdetailsAr1);

        }
    }
    else
    {
        if ([manage.wildover isEqualToString:@"hello"]) {
            manage.wildover=@"";
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"no network"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            alert.tag=100;
            manage.wildover=@"hello";
            [alert show];
        }
        
    }
    
    
}

- (void)configureTableView
{
    [self.tableView registerNib:[UINib nibWithNibName:@"RZTableViewCell" bundle:nil] forCellReuseIdentifier:@"RZTableViewCellType"];
    
    // [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Reload" style:UIBarButtonItemStyleDone target:self action:@selector(reloadPressed)]];
    
}

- (void)reloadPressed
{
    [self configureDataSource];
    
    // In this case we are going to invalidate our entire height cache since we are changing the entire datasource.  It is possible
    //  to just invalidate a speific indexpath or an array of them, and you should so long as you know what is being invalidated.
    [self.sizeManager invalidateCellSizeCache];
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str=@"cell";
    id object = [self.dataArray objectAtIndex:indexPath.row];
    RZTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if ([object isKindOfClass:[RZCellData class]])
    {
        
        
        
        if (cell==nil)
        {
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                
                
                NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"RZTableViewCell" owner:nil options:nil ];
                for(UIView *vie in arr1)
                {
                    if([vie isKindOfClass:[UITableViewCell class]])
                    {
                        cell=(RZTableViewCell*)vie;
                    }
                    
                }
            }
            else
            {
                
                NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"RZTableViewCell~ipad" owner:nil options:nil ];
                for(UIView *vie in arr1)
                {
                    if([vie isKindOfClass:[UITableViewCell class]])
                    {
                        cell=(RZTableViewCell*)vie;
                    }
                    
                }
                
                
            }
        }
        
        
        cell.l1.textColor=[UIColor colorWithRed:(50/255.0) green:(167/255.0) blue:(214/255.0) alpha:1];
        
        [cell setCellData:object];
        cell = cell;
    }
    
    
    
    return cell;
}
-(IBAction)home:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Retrieve our object to give to our size manager.
    id object = [self.dataArray objectAtIndex:indexPath.row];
    
    // Since we are using a tableView we are using the cellHeightForObject:indexPath: method.
    //  It uses the indexPath as the key for cacheing so it is important to pass in the correct one.
    return [self.sizeManager cellHeightForObject:object indexPath:indexPath];
}

// If you have very complex cells or a large number implementing this method speeds up initial load time.
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [RZTableViewCell estimatedCellHeight];
}
# pragma mark-collectionview


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return 1;
}
- (tablecellps *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    tablecellps *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    
    cell.bua.text=(self.itemshowdetailsAr1)[indexPath.row][@"bua_size"];
    cell.plot.text=(self.itemshowdetailsAr1)[indexPath.row][@"plot_size"];
    cell.price.text=(self.itemshowdetailsAr1)[indexPath.row][@"price"];
    cell.bedrooms.text=(self.itemshowdetailsAr1)[indexPath.row][@"number_of_bedroom"];
    
    return cell;
}

@end
