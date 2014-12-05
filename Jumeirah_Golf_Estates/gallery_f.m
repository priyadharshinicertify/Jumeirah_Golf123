//
//  gallery_f.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 23/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "gallery_f.h"
#import "BackgroundLayer.h"
@interface gallery_f ()
{
    UIActivityIndicatorView* indicator;
}

@end

@implementation gallery_f
@synthesize itemshowdetailsAr,itemshowdetailsAr_flame,itemshowdetailsAr_flame1,itemshowdetailsAr_flame2,itemshowdetailsAr_flame3,tablviw,spinner,itemshowdetailsAr1;
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
  }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

#pragma mark - View lifecycle

- (void)loadView {  [super loadView];
    manage=[singleton share];
    //  navigationBar.barTintColor = [UIColor whiteColor];
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    // Do any additional setup after loading the view from its nib.
    
    manage.colorchnage=@"hello";

     itemshowdetailsAr1=[[NSMutableArray alloc]init];
    NSMutableURLRequest *request8 = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/picture_gallery_folder.php"]] ];
    
    [request8 setHTTPMethod:@"GET"];

   // [request1 setHTTPBody:postData1];
    
    NSError *e = nil;
    NSURLResponse *response1;

    NSData *responseData1 = [NSURLConnection sendSynchronousRequest:request8 returningResponse:&response1 error:&e];
    if (responseData1) {
        
      NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:responseData1 options: NSJSONReadingMutableContainers error: &e];
        
    NSLog(@"%@",jsonArray1);
    
    
    NSArray *jsonArray=jsonArray1[@"folder"];
    
    
    for (NSDictionary *tmp in jsonArray)
    {
        NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
        
        [itemshowdetails setValue:tmp[@"folder_name"] forKey:@"folder_name"];
        [itemshowdetails setValue:tmp[@"image"] forKey:@"image"];
        [itemshowdetails setValue:tmp[@"count"] forKey:@"count"];
        
        [self.itemshowdetailsAr1 addObject:itemshowdetails];
    }
    
    NSLog(@"it.....%@",itemshowdetailsAr1);
    

  
    [self.navigationItem setHidesBackButton:YES animated:YES];
    [self.navigationController setNavigationBarHidden:YES];
 
    
    
    itemshowdetailsAr=[[NSMutableArray alloc]init];
     itemshowdetailsAr_flame=[[NSMutableArray alloc]init];
    itemshowdetailsAr_flame1=[[NSMutableArray alloc]init];
    itemshowdetailsAr_flame2=[[NSMutableArray alloc]init];
    itemshowdetailsAr_flame3=[[NSMutableArray alloc]init];
    

	localCaptions = @[@"Lava", @"Hawaii", @"Audi", @"Happy New Year!",@"Frosty Web"];
    localImages = @[@"lava.jpeg", @"hawaii.jpeg", @"audi.jpg"];
       
   NSString *post =[[NSString alloc] initWithFormat:@"folder_name=Redwood"];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSLog(@"postData.....%@", post);
    NSString *URL = [NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/picture_gallery.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
    [request setHTTPMethod:@"POST"];
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (con) {
        NSLog(@"data sent ");
    } else
    {
        NSLog(@"Not sent");
    }
    [con start];
    [spinner startAnimating];
    
    
    
  
   
    }

    
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated
{
    self.title = @"Image Gallery";
    [self.navigationController setNavigationBarHidden:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"Image Gallery";
    [self.navigationController setNavigationBarHidden:YES];
     indicator = [[UIActivityIndicatorView alloc] init];
    indicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyleWhiteLarge;
    //indicator.color=  [UIColor  colorWithRed:0.655 green:0.729 blue:0.812 alpha:1.0];
    indicator.color=  [UIColor whiteColor];
    [indicator setFrame:CGRectMake(150, 170, 20, 20)];
    [self.view addSubview:indicator];
    
     [self.navigationController setNavigationBarHidden:YES];
   
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if (receivedData == NULL) {
        receivedData = [[NSMutableData alloc] init];
    }
    else
    {
        receivedData_flame=[[NSMutableData alloc] init];
    }
    [receivedData setLength:0];}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
    [receivedData_flame appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [error userInfo][NSURLErrorFailingURLStringErrorKey]);
    UIAlertView *customAlert = [[UIAlertView alloc]initWithTitle:@"No NetWork" message:@"Interet Connection is Lost" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [customAlert show];
    [spinner stopAnimating];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *err;
   // NSURLResponse *response;
   // NSData *responseData = [NSURLConnection sendSynchronousRequest:receivedData returningResponse:&response error:&err];
    
    NSDictionary *jsonArrayflame = [NSJSONSerialization JSONObjectWithData:receivedData options: NSJSONReadingMutableContainers error: &err];    // NSLog(@"%@",jsonArray1);
    NSLog(@"%@",jsonArrayflame);
    
      
    if (jsonArrayflame) {
        
        
        
        NSArray *headlines=jsonArrayflame[@"picture_gallery"];
        
        for (int i=0;i<[headlines count]; i++)
        {
            NSString *ss=headlines[i][@"pg_image_url"];
            
            [self.itemshowdetailsAr_flame addObject:ss];
            NSLog(@"%@",itemshowdetailsAr_flame);
            
        }
        
        networkImages = [[NSArray alloc] initWithArray:itemshowdetailsAr_flame];
        
    }
    else
    {
        self.tablviw.hidden=YES;
    }
    
    
    
    NSString *post1 =[[NSString alloc] initWithFormat:@"folder_name=Flame Tree Ridge"];
    NSData *postData1 = [post1 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSLog(@"postData.....%@", post1);
    NSString *URL1 = [NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/picture_gallery.php"];
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
    
    if (jsonArrayflame1) {
        
       
        NSArray *headlines=jsonArrayflame1[@"picture_gallery"];
        
        for (int i=0;i<[headlines count]; i++)
        {
            NSString *ss=headlines[i][@"pg_image_url"];
            
            [self.itemshowdetailsAr_flame1 addObject:ss];
            NSLog(@"%@",itemshowdetailsAr_flame1);
            
        }
        
        flameimages = [[NSArray alloc] initWithArray:itemshowdetailsAr_flame1];
        
    }
    else
    {
        self.tablviw.hidden=YES;
    }
    
    
    
    
    NSString *post2 =[[NSString alloc] initWithFormat:@"folder_name=whispering Pines"];
    NSData *postData2 = [post2 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSLog(@"postData.....%@", post2);
    NSString *URL2 = [NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/picture_gallery.php"];
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
    
    if (jsonArrayflame2) {
       
        NSArray *headlines=jsonArrayflame2[@"picture_gallery"];
        
        for (int i=0;i<[headlines count]; i++)
        {
            NSString *ss=headlines[i][@"pg_image_url"];
            
            [self.itemshowdetailsAr_flame2 addObject:ss];
            NSLog(@"%@",itemshowdetailsAr_flame2);
            
        }
        
        wispering = [[NSArray alloc] initWithArray:itemshowdetailsAr_flame2];
        
    }
    else
    {
        self.tablviw.hidden=YES;
    }
    
    
    
    
    
    NSString *post3 =[[NSString alloc] initWithFormat:@"folder_name=General"];
    NSData *postData3 = [post3 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSLog(@"postData.....%@", post3);
    NSString *URL3 = [NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/picture_gallery.php"];
    NSMutableURLRequest *request3 = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL3] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
    [request3 setHTTPMethod:@"POST"];
    //[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    //[request setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
    [request3 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request3 setHTTPBody:postData3];
    
    NSError *err3;
    NSURLResponse *response3;
    NSData *responseData3 = [NSURLConnection sendSynchronousRequest:request3 returningResponse:&response3 error:&err3];
    
    NSDictionary *jsonArrayflame3 = [NSJSONSerialization JSONObjectWithData:responseData3 options: NSJSONReadingMutableContainers error: &err3];
    // NSLog(@"%@",jsonArray1);
    NSLog(@"%@",jsonArrayflame3);
    
    if (jsonArrayflame3) {
        
      
        NSArray *headlines=jsonArrayflame3[@"picture_gallery"];
        
        for (int i=0;i<[headlines count]; i++)
        {
            NSString *ss=headlines[i][@"pg_image_url"];
            
            [self.itemshowdetailsAr_flame3 addObject:ss];
            NSLog(@"%@",itemshowdetailsAr_flame3);
            
        }
        

        
        
        gereral = [[NSArray alloc] initWithArray:itemshowdetailsAr_flame3];
        
    }
    else
    {
        self.tablviw.hidden=YES;
    }
    
    NSLog(@"general,,..%@",gereral);
  /*
    NSError *e = nil;
    
 NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:receivedData options: NSJSONReadingMutableContainers error: &e];
    NSLog(@"%@",jsonArray1);
    
    if (jsonArray1) {
        
        NSArray *headlines=[jsonArray1 objectForKey:@"picture_gallery"];
        
        for (int i=0;i<[headlines count]; i++)
        {
            NSString *ss=[[headlines objectAtIndex:i]objectForKey:@"pg_image_url"];
            
            [self.itemshowdetailsAr addObject:ss];
            NSLog(@"%@",itemshowdetailsAr);
            
        }
        
        networkImages = [[NSArray alloc] initWithArray:itemshowdetailsAr];
       // [self.collectionViewPack reloadData];
    }    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"no network"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
  
    
      NSDictionary *jsonArrayflame = [NSJSONSerialization JSONObjectWithData:receivedData options: NSJSONReadingMutableContainers error: &e];
    NSLog(@"%@",jsonArrayflame);
    
    if (jsonArrayflame) {
        
        NSArray *headlines=[jsonArrayflame objectForKey:@"picture_gallery"];
        
        for (int i=0;i<[headlines count]; i++)
        {
            NSString *ss=[[headlines objectAtIndex:i]objectForKey:@"pg_image_url"];
            
            [self.itemshowdetailsAr_flame addObject:ss];
            NSLog(@"%@",itemshowdetailsAr_flame);
            
        }
        
        flameimages = [[NSArray alloc] initWithArray:itemshowdetailsAr_flame];
        // [self.collectionViewPack reloadData];
    }    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"no network"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    */

    
    [spinner stopAnimating];
  // [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [indicator stopAnimating];
}




#pragma mark - Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}
// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if ([itemshowdetailsAr1 count]!=0) {
         cell.textLabel.text =[NSString stringWithFormat:@"%@ (%@)",itemshowdetailsAr1[indexPath.row][@"folder_name"],itemshowdetailsAr1[indexPath.row][@"count"]];
    }
    
	// Configure the cell.
	/*if( indexPath.row == 0 ) {
		// @"Flame Tree Ridge(" stringByAppendingString:(flameimages.count);
        
        cell.textLabel.text =[NSString stringWithFormat:@"%@ (%@)", @"Flame Tree Ridge",pg1];
        
        
	}
    else if( indexPath.row == 1 ) {
        
        
		cell.textLabel.text =[NSString stringWithFormat:@"%@ (%@)", @"Redwood",pg2];
      
	
    }
	else if( indexPath.row == 2 ) {
		cell.textLabel.text = [NSString stringWithFormat:@"%@ (%lu)", @"whispering Pines",(unsigned long)wispering.count];
	}
    else if( indexPath.row == 3 ) {
		cell.textLabel.text =[NSString stringWithFormat:@"%@ (%lu)", @"General",(unsigned long)gereral.count] ;
	}*/
       
    return cell;

}

#pragma mark - FGalleryViewControllerDelegate Methods


- (int)numberOfPhotosForPhotoGallery:(FGalleryViewController *)gallery
{
    NSUInteger num;
    if( gallery == flamegallery ) {
        num = flameimages.count;
    }
    else if( gallery == networkGallery ) {
        num = [networkImages count];
    }
    else if( gallery == wishperinggallery ) {
        num = [wispering count];
    }
    else if( gallery == generalgallery ) {
        num = [gereral count];
    }
  int number = (int)num;
	return number;
}


- (FGalleryPhotoSourceType)photoGallery:(FGalleryViewController *)gallery sourceTypeForPhotoAtIndex:(NSUInteger)index
{
	return FGalleryPhotoSourceTypeNetwork;
}


/*- (NSString*)photoGallery:(FGalleryViewController *)gallery captionForPhotoAtIndex:(NSUInteger)index
{
    NSString *caption;
    if( gallery == localGallery ) {
        caption = [localCaptions objectAtIndex:index];
    }
    else if( gallery == networkGallery ) {
        caption = [networkImages objectAtIndex:index];
    }
	return caption;
}
*/

- (NSString*)photoGallery:(FGalleryViewController*)gallery filePathForPhotoSize:(FGalleryPhotoSize)size atIndex:(NSUInteger)index {
    return localImages[index];
}

- (NSString*)photoGallery:(FGalleryViewController *)gallery urlForPhotoSize:(FGalleryPhotoSize)size atIndex:(NSUInteger)index {
   //  NSString *caption;
    NSString *counting;
    if( gallery == flamegallery ) {
        counting = flameimages[index];
    }
    else if( gallery == networkGallery ) {
        counting = networkImages[index];
    }
    else if( gallery == wishperinggallery ) {
        counting = wispering[index];
    }
    else if( gallery == generalgallery ) {
        counting = gereral[index];
    }
	return counting;
       // return [networkImages objectAtIndex:index];
    
}

- (void)handleTrashButtonTouch:(id)sender {
    // here we could remove images from our local array storage and tell the gallery to remove that image
    // ex:
    //[localGallery removeImageAtIndex:[localGallery currentIndex]];
}


- (void)handleEditCaptionButtonTouch:(id)sender {
    // here we could implement some code to change the caption for a stored image
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
	if( indexPath.row == 0 ) {
        
       
        
       // [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"gradianting.png"]];
      self.title = @"Back";
        self.navigationController.navigationBar.tintColor = [UIColor blackColor];

       // [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"gradianting.png"] forBarMetrics:UIBarMetricsDefault];
        
        wishperinggallery = [[FGalleryViewController alloc] initWithPhotoSource:self];
        [self.navigationController pushViewController:wishperinggallery animated:YES];

        
      
	}
    else if( indexPath.row == 1 ) {
      self.title = @"Back";
         self.navigationController.navigationBar.tintColor = [UIColor blackColor];
       // [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"gradianting.png"] forBarMetrics:UIBarMetricsDefault];
        

        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        // self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
        networkGallery = [[FGalleryViewController alloc] initWithPhotoSource:self];
        [self.navigationController pushViewController:networkGallery animated:YES];

        
        
        
        
      

       		    }
	else if( indexPath.row == 2 ) {
        
        
     self.title = @"Back";
               self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
       // [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"gradianting.png"] forBarMetrics:UIBarMetricsDefault];
        

         self.navigationController.navigationBar.tintColor = [UIColor blackColor];
        // self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
        flamegallery = [[FGalleryViewController alloc] initWithPhotoSource:self];
        [self.navigationController pushViewController:flamegallery animated:YES];
        

       
		
		}
    else if( indexPath.row == 3) {
        
      self.title = @"Back";
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
         //self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

         self.navigationController.navigationBar.tintColor = [UIColor blackColor];
       // [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"gradianting.png"] forBarMetrics:UIBarMetricsDefault];
        

        
		generalgallery = [[FGalleryViewController alloc] initWithPhotoSource:self];
        [self.navigationController pushViewController:generalgallery animated:YES];	}
}


#pragma mark - Memory management


- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

-(IBAction)home:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
