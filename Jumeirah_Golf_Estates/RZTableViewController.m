//
//  RZTableViewController.m
//  RZCellSizeManagerDemo
//
//  Created by Alex Rouse on 12/20/13.
//  Copyright (c) 2013 Raizlabs. All rights reserved.
//

#import "RZTableViewController.h"
#import "RZCellData.h"
#import "RZCellSizeManager.h"
#import "BackgroundLayer.h"
#import "RZTableViewCell.h"

#import "NSString+RandomString.h"

#define kRZMaxCells             100
#define kRZMaxTitleLength       50
#define kRZMaxDescriptionLength 900

@interface RZTableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray* dataArray;
@property (strong, nonatomic) RZCellSizeManager* sizeManager;

@end

@implementation RZTableViewController
@synthesize itemshowdetailsAr,dataArray,img;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureDataSource];
    
    [self configureTableView];
}

- (void)configureDataSource
{
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];

    
    
    
    
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/about_us.php"]] ];
    
    [request setHTTPMethod:@"GET"];
    
    //[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    //[request setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
       NSError *err1;
    NSURLResponse *response1;
    NSData *responseData1 = [NSURLConnection sendSynchronousRequest:request returningResponse:&response1 error:&err1];
    if (responseData1) {

    NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:responseData1 options: NSJSONReadingMutableContainers error: &err1];
    itemshowdetailsAr=[[NSMutableArray alloc]init];
    
   
    if ([jsonArray1 count]==0) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"no network"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
    }
    else
    {
    NSString *imgstring=jsonArray1[@"image"];
        NSLog(@"iiius..%@",imgstring);
   
    NSArray *jsonArray=jsonArray1[@"about_us"];
    NSLog(@"us..%@",jsonArray);
    
    for (NSDictionary *tmp in jsonArray)
    {
        NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
        
        [itemshowdetails setValue:tmp[@"heading"] forKey:@"heading"];
        [itemshowdetails setValue:tmp[@"description"] forKey:@"description"];
        // [itemshowdetails setValue:[tmp objectForKey:@"image"] forKey:@"image"];
        
        [self.itemshowdetailsAr addObject:itemshowdetails];
    }
         // NSString *imagestring=[[itemshowdetailsAr objectAtIndex:2] objectForKey:@"image"];
    
    // NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imagestring]];
        dispatch_queue_t q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
        dispatch_async(q, ^{

    // img.image = [UIImage imageWithData:imageData];
    dispatch_async(dispatch_get_main_queue(), ^{
    [AsynchronousFreeloader loadImageFromLink:imgstring forImageView:img withPlaceholder:nil andContentMode:UIViewContentModeScaleToFill];

    
      });
        });

    // Create an array of random objects to be the datasource so its different every time.
    NSMutableArray* arry = [NSMutableArray array];
    for (int i = 0; i<[itemshowdetailsAr count]; i++)
    {
        [arry addObject:[RZCellData cellDataWithTitle:itemshowdetailsAr[i][@"heading"] subTitle:itemshowdetailsAr[i][@"description"]]];
    }
    self.dataArray = [NSArray arrayWithArray:arry];
    NSLog(@"dataarray...%@",dataArray);
    
    // Initialize the size manager.  In this case we are using a configuration block to compute the height.
    // We could also use a height block to do it where we could set the data and return the height, this is good if
    //  the cell is similar and you don't need to layout everything.
    // NOTE: if you are doing things that don't pertain to layout in the setCellData: method it may be best to create a different
    //  method for computing the height or add an optional parameter setCellData:forHeight: to not do additional work,  This
    //  expecially applies if you are loading images or anything of that manor.
    self.sizeManager = [[RZCellSizeManager alloc] init];
    [self.sizeManager registerCellClassName:@"RZTableViewCell"
                               withNibNamed:nil
                             forObjectClass:nil
                     withConfigurationBlock:^(RZTableViewCell* cell, id object) {
                         [cell setCellData:object];
                     }];
         }
  
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"no network"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
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

        
        cell.l1.textColor=[UIColor greenColor];
       
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
@end

