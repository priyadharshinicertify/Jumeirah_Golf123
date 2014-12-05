//
//  CMFViewController.m
//  UICollectionGallery
//
//  Created by Tim on 05/04/2013.
//  Copyright (c) 2013 Charismatic Megafauna Ltd. All rights reserved.
//

#import "CMFViewController.h"
#import "CMFGalleryCell.h"

@interface CMFViewController ()
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArray;
@property(nonatomic,strong) NSArray *txtviewarray;
@property(nonatomic,strong)NSArray *headerarray;
@property(nonatomic,strong)NSArray *labelarray;

@property (nonatomic) int currentIndex;
@end

@implementation CMFViewController
@synthesize itemshowdetailsAr,itemshowdetailsAr_flame,itemshowdetailsAr_flame1,itemshowdetailsAr_flame2,itemshowdetailsAr_flame3,timer,rft,lft;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];

     [self.navigationController setNavigationBarHidden:YES];
	// Do any additional setup after loading the view, typically from a nib.
    [self loadImages];
    itemshowdetailsAr_flame=[[NSMutableArray alloc]init];
    itemshowdetailsAr_flame1=[[NSMutableArray alloc]init];
    itemshowdetailsAr_flame2=[[NSMutableArray alloc]init];
    itemshowdetailsAr_flame3=[[NSMutableArray alloc]init];
    self.headerarray=@[@"Earth",@"ETPI",@"Fire"];
    self.txtviewarray=@[@"The courses offer golfers of all ages and abilities the opportunity to play two exciting and challenging championship layouts each one providing unique and distinctive playing characteristics.",@"The ETPI is one of the finest instructional facilities offering an unrivalled teaching and practice experience giving amateur golfers the opportunity to “rub shoulders” with the very best players in the game.",@"The courses offer golfers of all ages and abilities the opportunity to play two exciting and challenging championship layouts each one providing unique and distinctive playing characteristics."];
    self.labelarray=@[@"Click View Earth Gallery",@"Click to View ETPI Gallery",@"Click to View Fire Gallery"];
  //  self.labelarray
    NSString *post =[[NSString alloc] initWithFormat:@"folder_name=Earth"];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSLog(@"postData.....%@", post);
    NSString *URL = [NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/golf_picture_gallery.php"];
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
     rft.hidden=YES;
       [self setupCollectionView];
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
            NSString *ss=headlines[i][@"image_url"];
            
            [self.itemshowdetailsAr_flame addObject:ss];
            NSLog(@"%@",itemshowdetailsAr_flame);
            
        }
        
        networkImages = [[NSArray alloc] initWithArray:itemshowdetailsAr_flame];
        
    }
    
    
    
    NSString *post1 =[[NSString alloc] initWithFormat:@"folder_name=ETPI"];
    NSData *postData1 = [post1 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSLog(@"postData.....%@", post1);
    NSString *URL1 = [NSString stringWithFormat:@"http://mobileapp.certifytechnologies.com/jumeirah/golf_picture_gallery.php"];
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
            NSString *ss=headlines[i][@"image_url"];
            
            [self.itemshowdetailsAr_flame1 addObject:ss];
            NSLog(@"%@",itemshowdetailsAr_flame1);
            
        }
        
        flameimages = [[NSArray alloc] initWithArray:itemshowdetailsAr_flame1];
        
    }
    
    
    
    NSString *post2 =[[NSString alloc] initWithFormat:@"folder_name=Fire"];
    NSData *postData2 = [post2 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSLog(@"postData.....%@", post2);
    NSString *URL2 = [NSString stringWithFormat:@"http://mobileapp.certifytechnologies.com/jumeirah/golf_picture_gallery.php"];
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
            NSString *ss=headlines[i][@"image_url"];
            
            [self.itemshowdetailsAr_flame2 addObject:ss];
            NSLog(@"%@",itemshowdetailsAr_flame2);
            
        }
        
        wispering = [[NSArray alloc] initWithArray:itemshowdetailsAr_flame2];
        
    }
    
    
    [self.itemshowdetailsAr removeAllObjects];
    self.itemshowdetailsAr=[[NSMutableArray alloc] init];
   
   // [spinner  stopAnimating];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)home:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - FGalleryViewControllerDelegate Methods


- (int)numberOfPhotosForPhotoGallery:(FGalleryViewController *)gallery
{
    NSUInteger num1;
    if( gallery == flamegallery ) {
        num1 = [flameimages count];
    }
    else if( gallery == networkGallery ) {
        num1 = [networkImages count];
    }
    else if( gallery == wishperinggallery ) {
        num1 = [wispering count];
    }
    int num=(int)num1;
	return num;
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
-(IBAction)earth:(id)sender event:(id)event
{
   
}
-(IBAction)etpi:(id)sender
{
    
   
    if ( _collectionView.visibleCells.count==0) {
        // There are invisible cells
        lft.hidden=YES;
        
    }
    else
    {
        lft.hidden=NO;
       // _collectionView.visibleCells.count+1;
    }
    if ( _collectionView.visibleCells.count==1) {
         
    }
   
    
}
-(IBAction)fire:(id)sender
{
    self.title = @"Earth";
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    wishperinggallery = [[FGalleryViewController alloc] initWithPhotoSource:self];
    [self.navigationController pushViewController:wishperinggallery animated:YES];
    
}

#pragma mark -
#pragma mark UICollectionView methods

-(void)setupCollectionView {
    [self.collectionView registerClass:[CMFGalleryCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [flowLayout setMinimumLineSpacing:0.0f];
    [self.collectionView setPagingEnabled:YES];
    [self.collectionView setCollectionViewLayout:flowLayout];
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataArray count];
    NSLog(@"%lu",(unsigned long)[self.dataArray count]);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CMFGalleryCell *cell = (CMFGalleryCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    NSString *imageName = (self.dataArray)[indexPath.row];
    [cell setImageName:imageName];
    cell.headtxt.text=(self.headerarray)[indexPath.row];
    cell.brieftx.text=(self.txtviewarray)[indexPath.row];
    
    [cell.txt setTitle: (self.labelarray)[indexPath.row] forState: UIControlStateNormal];
    
    
    cell.txt.alpha = 0;
    [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        cell.txt.alpha = 1;
    } completion:nil];
    
    
    
    
    
    if (indexPath.row==0) {
        cell.headtxt.textColor=[UIColor greenColor];
        [cell.txt setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        lft.hidden=NO;
        rft.hidden=YES;
     }
    if (indexPath.row==1) {
        cell.headtxt.textColor=[UIColor blueColor];
        [cell.txt setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
       // lft.hidden=YES;
       // rft.hidden=YES;

    }

    if (indexPath.row==2) {
        cell.headtxt.textColor=[UIColor redColor];
        [cell.txt setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        lft.hidden=YES;
        rft.hidden=NO;
    }
    [cell updateCell];
        return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0)
    {
        self.title = @"Earth";
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
        networkGallery = [[FGalleryViewController alloc] initWithPhotoSource:self];
        [self.navigationController pushViewController:networkGallery animated:YES];
    }
     if(indexPath.row==1)
     {
         self.title = @"ETPI";
         self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
         self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
         
         flamegallery = [[FGalleryViewController alloc] initWithPhotoSource:self];
         [self.navigationController pushViewController:flamegallery animated:YES];

     }
    if(indexPath.row==2)
    {
        self.title = @"Fire";
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
        wishperinggallery = [[FGalleryViewController alloc] initWithPhotoSource:self];
        [self.navigationController pushViewController:wishperinggallery animated:YES];

    }
}
- (IBAction)myClickEvent:(id)sender event:(id)event {
   
        
        self.title = @"Earth";
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
        networkGallery = [[FGalleryViewController alloc] initWithPhotoSource:self];
        [self.navigationController pushViewController:networkGallery animated:YES];
    

}
- (IBAction)myClickEvent1:(id)sender event:(id)event {
    
    
    
    
}
- (IBAction)myClickEvent2:(id)sender event:(id)event {
    
    
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.collectionView.frame.size;
//}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (_isLandscape)
//        return CGSizeMake(yourLandscapeWidth, yourLandscapeHeight);
//    else
//        return CGSizeMake(yourNonLandscapeWidth, yourNonLandscapeHeight);
    if (UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        return CGSizeMake(1024.f, 768.f);
    }
    return CGSizeMake(768.f, 1024.f);
}


#pragma mark -
#pragma mark Data methods
-(void)loadImages {
    
    NSString *sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Assests"];
    self.dataArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:sourcePath error:NULL];

}

#pragma mark -
#pragma mark Rotation handling methods

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:
(NSTimeInterval)duration {
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    
    // Fade the collectionView out
    [self.collectionView setAlpha:0.0f];
    
    // Suppress the layout errors by invalidating the layout
    [self.collectionView.collectionViewLayout invalidateLayout];
  
    // Calculate the index of the item that the collectionView is currently displaying
    CGPoint currentOffset = [self.collectionView contentOffset];    
    self.currentIndex = currentOffset.x / self.collectionView.frame.size.width;
}
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self.collectionView.collectionViewLayout invalidateLayout];
}
-(void)viewWillAppear:(BOOL)animated
{
     [self.navigationController setNavigationBarHidden:YES];
    [self.collectionView.collectionViewLayout invalidateLayout];
}
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
  
    // Force realignment of cell being displayed
    CGSize currentSize = self.collectionView.bounds.size;
    float offset = self.currentIndex * currentSize.width;
    [self.collectionView setContentOffset:CGPointMake(offset, 0)];
    
    // Fade the collectionView back in
    [UIView animateWithDuration:0.125f animations:^{
        [self.collectionView setAlpha:1.0f];
    }];
    
}
-(IBAction)left:(id)sender
{
     rft.hidden=NO;
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    NSArray *indexPaths = [self.collectionView indexPathsForVisibleItems];
    NSLog(@"%@",indexPaths);
    
    if ( indexPaths.count > 0 && indexPaths.count < 2 )
    {
        
        NSIndexPath *oldIndexPath = indexPaths[0];
        NSInteger oldRow = oldIndexPath.row;
        
       
            //   else
        //{
        if (oldRow==1) {
             lft.hidden=YES;
            rft.hidden=NO;
        }
        newIndexPath = [NSIndexPath indexPathForRow:oldRow + 1 inSection:oldIndexPath.section];
            [self.collectionView scrollToItemAtIndexPath:newIndexPath
                                        atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                                animated:YES];

       // }
    }
    if (indexPaths.count==2) {
        lft.hidden=YES;
    }

    
    
}
-(IBAction)right:(id)sender
{
    NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    NSArray *indexPaths = [self.collectionView indexPathsForVisibleItems];
    if ( indexPaths.count > 0 )
    {
        
        NSIndexPath *oldIndexPath = indexPaths[0];
        
        NSInteger oldRow = oldIndexPath.row;
        if (oldRow==1) {
            rft.hidden=YES;
        }
        else
        {
          rft.hidden=NO;
        }
        newIndexPath = [NSIndexPath indexPathForRow:oldRow - 1 inSection:oldIndexPath.section];
    }    [self.collectionView scrollToItemAtIndexPath:newIndexPath
                                atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                        animated:YES];
    if (indexPaths.count==0) {
         rft.hidden=YES;    }
    

    }


@end
