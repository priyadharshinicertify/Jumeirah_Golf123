//
//  newgolf.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 03/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "newgolf.h"
#import "golfnewcell.h"
#import "BackgroundLayer.h"
@interface newgolf ()
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArray;
@property(nonatomic,strong) NSArray *txtviewarray;
@property(nonatomic,strong)NSArray *headerarray;
@property(nonatomic,strong)NSArray *labelarray;

@end

@implementation newgolf
@synthesize dataArray;
@synthesize itemshowdetailsAr,itemshowdetailsAr_flame,itemshowdetailsAr_flame1,itemshowdetailsAr_flame2,itemshowdetailsAr_flame3,timer,rft,lft,v1,vearth,vetpi,vfire,animatedImageView1,animatedImageView,lbl,text123,btn1,btn2,btn3,btn4,btn5,btn6,navview,color;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[UINavigationBar appearance] setBarTintColor:[UIColor clearColor]];

    }
    return self;
}
-(IBAction)home:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
       manage=[singleton share];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleWidth;
    
    CAGradientLayer *btnGradient2 = [BackgroundLayer blackWhiteGradient2];
    btnGradient2.frame = self.navview.bounds;
    [self.navview.layer insertSublayer:btnGradient2 atIndex:0];

    
    
    CAGradientLayer *btnGradient = [BackgroundLayer blackWhiteGradient1];
    btnGradient.frame = self.v1.bounds;
   // btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
   //  UIColor *colorOne = [UIColor colorWithRed:119.0/255.0 green:119.0/255.0 blue:119.0/255.0 alpha:1.0];
   // btnGradient.borderColor=(colorOne).CGColor;
    btn2.hidden=YES;
    btn3.hidden=YES;
    
    UIColor *colorOne = [UIColor colorWithRed:76.0/255.0 green:76.0/255.0 blue:76.0/255.0 alpha:1.0];
    btn4.backgroundColor=colorOne;
   // btn4.layer.borderColor=(__bridge CGColorRef)(colorOne);
    btn4.layer.borderWidth=1.0;
   btn4.layer.cornerRadius=5;
    
    
    btn5.backgroundColor=colorOne;
    btn5.layer.borderWidth=1.0;
    btn5.layer.cornerRadius=5;

    
    [self.v1.layer insertSublayer:btnGradient atIndex:0];
    // manage=[singleton share];
    
    //animatedImageView1 = [[UIImageView alloc] initWithFrame:self.view.bounds];
  
  /*
     NSArray *imageNames= [NSArray arrayWithObjects:[UIImage imageNamed:@"arrow1.png"],[UIImage imageNamed:@"arrow2.png"] ,nil];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[imageNames objectAtIndex:i]];
    }
    
    animatedImageView1.animationImages=images;
    animatedImageView1.animationDuration = 1.5;
   // animatedImageView1.animationRepeatCount = 0;
    [animatedImageView1 startAnimating];*/
   
    
    itemshowdetailsAr_flame=[[NSMutableArray alloc]init];
    itemshowdetailsAr_flame1=[[NSMutableArray alloc]init];
    itemshowdetailsAr_flame2=[[NSMutableArray alloc]init];
    itemshowdetailsAr_flame3=[[NSMutableArray alloc]init];
    //[self setNeedsStatusBarAppearanceUpdate];
    //[[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];
//self.navigationController.navigationBar.translucent = YES;
    
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
//    {
//         [self.collectionView registerNib:[UINib nibWithNibName:@"golfnewcell_iphone" bundle:nil] forCellWithReuseIdentifier:@"cell"];
//    }else
//    {
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [self.collectionView registerNib:[UINib nibWithNibName:@"golfnewcell_iphone" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    }
    else
    {
        [self.collectionView registerNib:[UINib nibWithNibName:@"golfnewcell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    }

//    }
[[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    self.dataArray=@[@"ea.jpg",@"etpi.jpg",@"fire.jpg"];
    self.headerarray=@[@"Earth",@"ETPI",@"Fire"];
    self.txtviewarray=@[@"Earth, home to the DP World Tour Championship, Dubai sets the scene for an incredible experience. The rolling fairways, brilliant white bunkering and deep red ochre landscape are framed by a plethora of trees and shrubs making each hole picture perfect. The abundance of nature is reflected in the many lakes throughout the experience which are home to a myriad of wildlife.",@"The European Tour has awarded the status of European Tour Performance Institute to Jumeirah Golf Estates for its unique facilities which have been designed specifically to enhance the performance of members, guests and visitors to the club; enabling them to fine tune and hone their game throughout the year, utilizing the very latest in cutting-edge technology. The ETPI offers a variety of instructional programmes to suit all abilities – player development and introduction to golf clinics, ladies group coaching, corporate clinics and our junior master-class programs.",@"Framed by a wide variety of captivating flora, carefully selected to reflect the overall theme and to enhance its natural setting, Fire is in complete harmony with its surroundings. The undulating topography, with its considerable protrusions, creates a more challenging level of play. Rustic, and so visually stunning as to captivate even those who do not golf, the Fire course demands a well-thought-out strategy. Going directly at the flag may not always be the best approach, which gives Fire a strong sense of classic links-style play."];
    self.labelarray=@[@"Click View Earth Gallery",@"Click to View ETPI Gallery",@"Click to View Fire Gallery"];
    // Do any additional setup after loading the view from its nib.
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
    text123.text=(self.txtviewarray)[0];
    lbl.text=(self.headerarray)[0];
    lbl.textColor=[UIColor greenColor];
       color.backgroundColor=[UIColor greenColor];

    
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
    NSString *URL1 = [NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/golf_picture_gallery.php"];
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
    NSString *URL2 = [NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/golf_picture_gallery.php"];
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



-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return [dataArray count];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
  //  UITapGestureRecognizer *letterTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(highlightLetter:)];
    
     UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    cell.backgroundView.backgroundColor=[UIColor clearColor];
    
//    if(self.selectedIndexPath)
    if ((self.selectedIndexPath.row ==1)) {
        // deselect previously selected cell
        
        
        UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:self.selectedIndexPath];
        cell.backgroundColor=[UIColor clearColor];
        if (cell != nil) {
            cell.backgroundColor=[UIColor clearColor];
            
            // set default color for cell
        }
    }

    if (self.selectedIndexPath != nil) {
        // deselect previously selected cell
        UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:self.selectedIndexPath];
         cell.backgroundColor=[UIColor clearColor];
        if (cell != nil) {
            cell.backgroundColor=[UIColor clearColor];

            // set default color for cell
        }
    }
    // Select newly selected cell:
// UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor=[UIColor clearColor];

    
    if (cell != nil) {
        if (indexPath.row==0) {
            color.backgroundColor=[UIColor clearColor];
          cell.backgroundColor=[UIColor greenColor];
        }
       else if (indexPath.row==1) {
             color.backgroundColor=[UIColor clearColor];
           UICollectionViewCell *cell1 = [collectionView cellForItemAtIndexPath:0];
           cell1.contentView.backgroundColor=[UIColor clearColor];

              UIColor *barColour = [UIColor colorWithRed:(90/255.0) green:(233/255.0) blue:(255/255.0) alpha:1];
            cell.backgroundColor=barColour;
//           UICollectionViewCell *cell1 = [collectionView cellForItemAtIndexPath:0];
//           cell1.backgroundColor=[UIColor clearColor];

           
           
        }
        //if (indexPath.row==2)
        else
        {
              color.backgroundColor=[UIColor clearColor];
            cell.backgroundColor=[UIColor orangeColor];
            [self.collectionView deselectItemAtIndexPath:0 animated:NO];
        }
        


        // set highlight color for cell
    }
    
//    UICollectionViewCell *datasetCell =[collectionView cellForItemAtIndexPath:indexPath];
//    datasetCell.backgroundColor = [UIColor blueColor]; // highlight selection
    // Remember selection:
    self.selectedIndexPath = indexPath;
    
    if(indexPath.row==0)
    {
       // self.title = @"Earth";
        text123.text=(self.txtviewarray)[0];
        lbl.text=(self.headerarray)[0];
        lbl.textColor=[UIColor greenColor];
        btn2.hidden=YES;
        btn3.hidden=YES;
        btn1.hidden=NO;
      
     
     }
   
   else if(indexPath.row==1)
    {
        UICollectionViewCell *cell1 = [collectionView cellForItemAtIndexPath:0];
        cell1.backgroundColor=[UIColor clearColor];
        

        text123.text=(self.txtviewarray)[1];
         UIColor *barColour = [UIColor colorWithRed:(90/255.0) green:(233/255.0) blue:(255/255.0) alpha:1];
    lbl.textColor=barColour;
         lbl.text=(self.headerarray)[1];
  
        btn2.hidden=NO;
        btn3.hidden=YES;
        btn1.hidden=YES;
        
     
        
    }
  else
    {
        text123.text=(self.txtviewarray)[2];
     lbl.textColor=[UIColor orangeColor];
         lbl.text=(self.headerarray)[2];
        btn2.hidden=YES;
        btn3.hidden=NO;
        btn1.hidden=YES;
      }
    
}
- (void)highlightLetter:(UITapGestureRecognizer*)sender {
    
    
    
    
}
-(IBAction)btn1action:(id)sender
{
    manage.golf_1=@"h2";
    self.title = @"Earth";
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UIColor *barColour = [UIColor colorWithRed:(41/255.0) green:(87/255.0) blue:(41/255.0) alpha:1];
    [[UINavigationBar appearance] setBarTintColor:barColour];
    
    networkGallery = [[FGalleryViewController alloc] initWithPhotoSource:self];
    [self.navigationController pushViewController:networkGallery animated:YES];
}
-(IBAction)btn2action:(id)sender
{
    self.title = @"ETPI";
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    UIColor *barColour = [UIColor colorWithRed:(39/255.0) green:(94/255.0) blue:(175/255.0) alpha:1];
    [[UINavigationBar appearance] setBarTintColor: barColour];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    flamegallery = [[FGalleryViewController alloc] initWithPhotoSource:self];
    [self.navigationController pushViewController:flamegallery animated:YES];
}
-(IBAction)btn3action:(id)sender{
    
    
    self.title = @"Fire";
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    UIColor *barColour = [UIColor colorWithRed:(218/255.0) green:(125/255.0) blue:(52/255.0) alpha:1];
    [[UINavigationBar appearance] setBarTintColor: barColour];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    wishperinggallery = [[FGalleryViewController alloc] initWithPhotoSource:self];
    [self.navigationController pushViewController:wishperinggallery animated:YES];
}

-(golfnewcell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    static NSString *cellIdentifier = @"cell";
    
    
    golfnewcell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
     [self.collectionView selectItemAtIndexPath:0 animated:NO scrollPosition:NO];
    
    cell.txt.text=(self.txtviewarray)[indexPath.row];
    cell.myImageView.image=[UIImage imageNamed:[dataArray objectAtIndex:indexPath.row]];
    cell.title.text=(self.headerarray)[indexPath.row];
    cell.title1.text=(self.labelarray)[indexPath.row];
    cell.colored.backgroundColor=[UIColor clearColor];
    
//    if (cell.selected) {
//        cell.backgroundColor = [UIColor blueColor]; // highlight selection
//    }
//    else
//    {
//        cell.backgroundColor = [UIColor redColor]; // Default color
//    }
//    
   if (indexPath.row==0) {
        // [cell setSelected:YES];
        [cell setSelected:YES];
        cell.colored.tag=100;
        [self.collectionView selectItemAtIndexPath:0 animated:NO scrollPosition:NO];
        //cell.title.textColor=[UIColor greenColor];
      // cell.backgroundColor=[UIColor greenColor];
        cell.backgroundColor=[UIColor clearColor];
        
        
    }
    if (indexPath.row==1) {
        // cell.title.textColor=[UIColor blueColor];
        cell.title1.layer.borderColor = [UIColor blueColor].CGColor;
        cell.title1.layer.borderWidth = 4.0;
           cell.title1.layer.cornerRadius=10;
       // lbl.text=(self.txtviewarray)[1];

        
    }
    if (indexPath.row==2) {
        // cell.title.textColor=[UIColor orangeColor];
        cell.title1.layer.borderColor = [UIColor orangeColor].CGColor;
        cell.title1.layer.borderWidth = 4.0;
           cell.title1.layer.cornerRadius=10;
       // lbl.text=(self.txtviewarray)[2];

        
    }
    if ([self.selectedIndexPath isEqual:indexPath])
    {
        if (indexPath.row==0) {
            [cell setSelected:YES];
            [self.collectionView selectItemAtIndexPath:0 animated:NO scrollPosition:NO];
             cell.backgroundColor=[UIColor greenColor];
        }
        if (indexPath.row==1) {
            cell.colored.hidden=YES;
             UIColor *barColour = [UIColor colorWithRed:(90/255.0) green:(233/255.0) blue:(255/255.0) alpha:1];
             cell.backgroundColor=barColour;
        }
        if (indexPath.row==2) {
            cell.colored.hidden=YES;
            cell.backgroundColor=[UIColor orangeColor];
        }

       
        // set highlight color
    } else {
        if (indexPath.row==0) {
            //[cell setSelected:YES];
           // [self.collectionView selectItemAtIndexPath:0 animated:NO scrollPosition:NO];
            // cell.backgroundColor=[UIColor greenColor];
             [self.collectionView selectItemAtIndexPath:0 animated:NO scrollPosition:NO];
             cell.backgroundColor=[UIColor clearColor];
            cell.selected=YES;
            
        }
        if (indexPath.row==1) {
            cell.colored.hidden=YES;
             cell.backgroundColor=[UIColor clearColor];
        }
        if (indexPath.row==2) {
            cell.colored.hidden=YES;
              cell.backgroundColor=[UIColor clearColor];
        }
        
        

      

        // set default color
    }
   
    return cell;
    
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:
(NSTimeInterval)duration {
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    
    // Fade the collectionView out
    [self.collectionView setAlpha:0.0f];
    
    // Suppress the layout errors by invalidating the layout
   // [self.collectionView.collectionViewLayout invalidateLayout];
    
    // Calculate the index of the item that the collectionView is currently displaying
  }
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
   // [self.collectionView.collectionViewLayout invalidateLayout];
}
/*-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    //const CGSize ksize;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        
    }
    else
    {
       if (UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) //{
       return CGSizeMake(302.f, 188.f);
    }
    
//    }
    return CGSizeMake(302.f, 188.f);
}*/
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *datasetCell =[collectionView cellForItemAtIndexPath:indexPath];
    datasetCell.backgroundColor = [UIColor redColor]; // Default color
}
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
   }

-(void)viewWillAppear:(BOOL)animated
{
     [[UINavigationBar appearance] setBarTintColor:[UIColor clearColor]];
    [self.navigationController setNavigationBarHidden:YES];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleWidth;
   // [self.collectionView.collectionViewLayout invalidateLayout];
}

-(IBAction)btn4action:(id)sender
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        teebooking *vdo = [[teebooking alloc] initWithNibName:@"teebooking_iphone" bundle:nil];
        [self.navigationController pushViewController:vdo animated:NO];
    }
    else
    {
        teebooking *vdo = [[teebooking alloc] initWithNibName:@"teebooking_ipad" bundle:nil];
        [self.navigationController pushViewController:vdo animated:NO];
    }
  
}
-(IBAction)btn5action:(id)sender
{
    /*
    
    contactus *et = [[contactus alloc]init];
    [self.navigationController pushViewController:et animated:NO];
     
     */
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        contactus *et = [[contactus alloc]initWithNibName:@"contact_iphone" bundle:nil];
        [self.navigationController pushViewController:et animated:NO];
    }
    else
    {
        contactus *et = [[contactus alloc]init];
        [self.navigationController pushViewController:et animated:NO];       }
    

}

@end
