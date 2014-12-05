//
//  contactus.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 01/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "contactus.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface contactus ()
{
    UIActivityIndicatorView *spinner;
}
//@property (nonatomic, weak)IBOutlet MKMapView *mapView;
@end

@implementation contactus
@synthesize tour12,tour,mem,maitenence,maintance,membership,clube_house,club,property12,property,scr1,itemshowdetailsAr4,itemshowdetailsAr1,itemshowdetailsAr,itemshowdetailsAr2,itemshowdetailsAr3,p_address2,p_mail1,p_mail2,p_phone1,p_phone2,p_tit1,p_tit2,c_mail1,c_mail2,c_phone1,c_phone2,c_tit1,c_tit2,e_mail1,e_phone1,e_tit1,cm_mail1,cm_phone1,cm_tit1,m_mail1,m_phone1,main_tit;
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
   // self.mapView.mapType = MKMapTypeStandard;
     self.mapView.mapType = MKMapTypeHybrid;
    scr1.contentSize=CGSizeMake(650,40);
    
    scr1.scrollEnabled=YES;
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    
  /*  CLLocationCoordinate2D center =
    CLLocationCoordinate2DMake(25.0136,55.1839);
    MKCoordinateSpan span =MKCoordinateSpanMake(10,10);
    MKCoordinateRegion regionToDisplay =
    MKCoordinateRegionMake(center, span);
    [self.mapView setRegion:regionToDisplay];
    //25.0214813,55.2015293
    NSString *address = @"Jumeirah Golf Estates Golf Club";
    
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder geocodeAddressString:address
                 completionHandler:^(NSArray* placemarks, NSError* error){
                     // Check for returned placemarks
                     if (placemarks && placemarks.count > 0) {
                         CLPlacemark *topResult = placemarks[0];
                         
                         MKPlacemark *placemark = [[MKPlacemark alloc]initWithPlacemark:topResult];
                         [self.mapView addAnnotation:placemark];
                     }
                 }];
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.property12.highlighted = true;
                         property12.selected = true;
                     }
     ];
    
    */
    
    
    [self.mapView setDelegate:self];
   // [self addGestureRecogniserToMapView];
    __block NSArray *annoations;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        annoations = [self parseJSONCities];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            
            [self.mapView addAnnotations:annoations];
            
        });
    });
   
    CLLocationCoordinate2D touchMapCoordinate =
    CLLocationCoordinate2DMake(25.022598,55.200484);
    
    
    MKCoordinateSpan span =MKCoordinateSpanMake(0.02,.02);
    MKCoordinateRegion regionToDisplay =
    MKCoordinateRegionMake(touchMapCoordinate, span);
    
    
  /*  MKMapRect zoomRect = MKMapRectNull;
    for (id <MKAnnotation> annotation in self.mapView.annotations)
    {
        MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
        MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0.0000001000000, 0.0000001000000000);
        zoomRect = MKMapRectUnion(zoomRect, pointRect);
    }
    [self.mapView setVisibleMapRect:zoomRect animated:YES];
    
    
    */
    JFMapAnnotation *toAdd = [[JFMapAnnotation alloc]init];
    
    toAdd.coordinate = touchMapCoordinate;
   // toAdd.subtitle = @"Subtitle";
   // toAdd.title = @"Title";
    [self.mapView setRegion:regionToDisplay];
    [self.mapView addAnnotation:toAdd];
    

    self.club.hidden=YES;
    self.membership.hidden=YES;
    self.tour.hidden=YES;
    self.maintance.hidden=YES;
    self.property.hidden=NO;
    
    [self.itemshowdetailsAr removeAllObjects];
    self.itemshowdetailsAr=[[NSMutableArray alloc] init];
    
    [self.itemshowdetailsAr1 removeAllObjects];
    self.itemshowdetailsAr1=[[NSMutableArray alloc] init];
    
    [self.itemshowdetailsAr2 removeAllObjects];
    self.itemshowdetailsAr2=[[NSMutableArray alloc] init];
    [self.itemshowdetailsAr4 removeAllObjects];
    self.itemshowdetailsAr4=[[NSMutableArray alloc] init];
    [self.itemshowdetailsAr3 removeAllObjects];
    self.itemshowdetailsAr3=[[NSMutableArray alloc] init];

    [self getcontactdetails];
    // Do any additional setup after loading the view from its nib.
}
- (NSMutableArray *)parseJSONCities{
    
    NSMutableArray *retval = [[NSMutableArray alloc]init];
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"capitals"
                                                         ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error = nil;
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data
                                                    options:kNilOptions
                                                      error:&error];
    
    for (JFMapAnnotation *record in json) {
        
        JFMapAnnotation *temp = [[JFMapAnnotation alloc]init];
        [temp setTitle:[record valueForKey:@"Capital"]];
        [temp setSubtitle:[record valueForKey:@"Country"]];
        [temp setCoordinate:CLLocationCoordinate2DMake([[record valueForKey:@"Latitude"]floatValue], [[record valueForKey:@"Longitude"]floatValue])];
        [retval addObject:temp];
        
    }
    
    return retval;
}

-(void)getcontactdetails
{
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center=self.view.center;
    spinner.color=[UIColor blackColor];
    [self.view addSubview:spinner];
    // self.view.center=spinner;
    
        
        //back to the main thread for the UI call
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner startAnimating];
        });
        

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/contact_us.php"]] ];
    
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
    dispatch_async(dispatch_get_main_queue(), ^{
    UIAlertView *customAlert = [[UIAlertView alloc]initWithTitle:@"No NetWork" message:@"Internet Connection is Lost" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [customAlert show];
    
    
        [spinner stopAnimating];
    });
    

}
-(IBAction)home:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Contact Screen";
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    
    if (receivedData) {
        
        NSError *e = nil;
        NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:receivedData options: NSJSONReadingMutableContainers error: &e];
        
        // NSLog(@"%@",jsonArray1);
        
        
        NSArray  *jsonArray=jsonArray1[@"contact_us"];
        NSLog(@"%@",jsonArray1);
        NSArray *filtered1 = [jsonArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(contact_type == %@)", @"Property Sales and Enquiries"]];
        
        NSArray *filtered2 = [jsonArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(contact_type == %@)", @"Club House"]];
        
        NSArray *filtered3 = [jsonArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(contact_type == %@)", @"ETPI"]];
        
        NSArray *filtered4 = [jsonArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(contact_type == %@)", @"Maintenance"]];
        
        NSArray *filtered5 = [jsonArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(contact_type == %@)", @"Club Membership"]];
        //
        NSLog(@"...%@",filtered5);
        
        NSLog(@"%@",filtered2);
        
        for (NSDictionary *tmp in filtered1)
        {
            NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
            
            //[itemshowdetails setValue:[tmp objectForKey:@"contact_type"] forKey:@"contact_type"];
            if(![tmp[@"for_purpose"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"for_purpose"] forKey:@"for_purpose"];
            }
            if(![tmp[@"contact_person_name"] isEqualToString:@""])
                
            {
                [itemshowdetails setValue:tmp[@"contact_person_name"] forKey:@"contact_person_name"];
            }
            if(![tmp[@"designation"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"designation"] forKey:@"designation"];
            }
            if(![tmp[@"mail_id"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"mail_id"] forKey:@"mail_id"];
            }
            if(![tmp[@"contact_number"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"contact_number"] forKey:@"contact_number"];
            }
            if(![tmp[@"address"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"address"] forKey:@"address"];
            }
            //[itemshowdetails setValue:[tmp objectForKey:@"designation"] forKey:@"designation"];
            
            [self.itemshowdetailsAr addObject:itemshowdetails];
            
        }
        for (NSDictionary *tmp in filtered4)
        {
            NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
            
            //[itemshowdetails setValue:[tmp objectForKey:@"contact_type"] forKey:@"contact_type"];
            if(![tmp[@"for_purpose"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"for_purpose"] forKey:@"for_purpose"];
            }
            if(![tmp[@"contact_person_name"] isEqualToString:@""])
                
            {
                [itemshowdetails setValue:tmp[@"contact_person_name"] forKey:@"contact_person_name"];
            }
            if(![tmp[@"designation"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"designation"] forKey:@"designation"];
            }
            if(![tmp[@"mail_id"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"mail_id"] forKey:@"mail_id"];
            }
            if(![tmp[@"contact_number"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"contact_number"] forKey:@"contact_number"];
            }
            if(![tmp[@"address"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"address"] forKey:@"address"];
            }
            //[itemshowdetails setValue:[tmp objectForKey:@"designation"] forKey:@"designation"];
            
            [self.itemshowdetailsAr3 addObject:itemshowdetails];
            
        }
        
        
        NSLog(@"%@",itemshowdetailsAr3);
        for (NSDictionary *tmp in filtered2)
        {
            
            NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
            
            //[itemshowdetails setValue:[tmp objectForKey:@"contact_type"] forKey:@"contact_type"];
            if(![tmp[@"for_purpose"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"for_purpose"] forKey:@"for_purpose"];
            }
            if(![tmp[@"contact_person_name"] isEqualToString:@""])
                
            {
                [itemshowdetails setValue:tmp[@"contact_person_name"] forKey:@"contact_person_name"];
            }
            if(![tmp[@"designation"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"designation"] forKey:@"designation"];
            }
            if(![tmp[@"mail_id"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"mail_id"] forKey:@"mail_id"];
            }
            if(![tmp[@"contact_number"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"contact_number"] forKey:@"contact_number"];
            }
            if(![tmp[@"address"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"address"] forKey:@"address"];
            }
            //[itemshowdetails setValue:[tmp objectForKey:@"designation"] forKey:@"designation"];
            
            [self.itemshowdetailsAr1 addObject:itemshowdetails];
            
            
        }
        
        NSLog(@"%@",itemshowdetailsAr1);
        
        for (NSDictionary *tmp in filtered3)
        {
            NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
            
            //[itemshowdetails setValue:[tmp objectForKey:@"contact_type"] forKey:@"contact_type"];
            if(![tmp[@"for_purpose"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"for_purpose"] forKey:@"for_purpose"];
            }
            if(![tmp[@"contact_person_name"] isEqualToString:@""])
                
            {
                [itemshowdetails setValue:tmp[@"contact_person_name"] forKey:@"contact_person_name"];
            }
            if(![tmp[@"designation"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"designation"] forKey:@"designation"];
            }
            if(![tmp[@"mail_id"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"mail_id"] forKey:@"mail_id"];
            }
            if(![tmp[@"contact_number"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"contact_number"] forKey:@"contact_number"];
            }
            if(![tmp[@"address"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"address"] forKey:@"address"];
                
                //[itemshowdetails setValue:[tmp objectForKey:@"designation"] forKey:@"designation"];
            }
            [self.itemshowdetailsAr2 addObject:itemshowdetails];
            
            
        }
        for (NSDictionary *tmp in filtered5)
        {
            NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
            
            //[itemshowdetails setValue:[tmp objectForKey:@"contact_type"] forKey:@"contact_type"];
            if(![tmp[@"for_purpose"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"for_purpose"] forKey:@"for_purpose"];
            }
            if(![tmp[@"contact_person_name"] isEqualToString:@""])
                
            {
                [itemshowdetails setValue:tmp[@"contact_person_name"] forKey:@"contact_person_name"];
            }
            if(![tmp[@"designation"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"designation"] forKey:@"designation"];
            }
            if(![tmp[@"mail_id"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"mail_id"] forKey:@"mail_id"];
            }
            if(![tmp[@"contact_number"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"contact_number"] forKey:@"contact_number"];
            }
            if(![tmp[@"address"] isEqualToString:@""])
            {
                [itemshowdetails setValue:tmp[@"address"] forKey:@"address"];
                
                //[itemshowdetails setValue:[tmp objectForKey:@"designation"] forKey:@"designation"];
            }
            [self.itemshowdetailsAr4 addObject:itemshowdetails];
            
            
        }
        
        
        
        p_tit1.text=itemshowdetailsAr[0][@"for_purpose"];
        p_tit2.text=itemshowdetailsAr[1][@"for_purpose"];
        
        p_mail1.text=itemshowdetailsAr[0][@"mail_id"];
        NSLog(@"maillll%@",p_mail1);
        p_mail2.text=itemshowdetailsAr[1][@"mail_id"];
        
        p_phone1.text=itemshowdetailsAr[0][@"contact_number"];
        p_phone2.text=itemshowdetailsAr[1][@"contact_number"];
        
        p_address2.text=itemshowdetailsAr[1][@"address"];
        
        
        
        
        c_tit1.text=itemshowdetailsAr1[0][@"for_purpose"];
        c_tit2.text=itemshowdetailsAr1[1][@"for_purpose"];
        
        c_mail1.text=itemshowdetailsAr1[0][@"mail_id"];
        NSLog(@"maillll%@",p_mail1);
        c_mail2.text=itemshowdetailsAr1[1][@"mail_id"];
        
        c_phone1.text=itemshowdetailsAr1[0][@"contact_number"];
        c_phone2.text=itemshowdetailsAr1[1][@"contact_number"];
        
       // c_address2.text=itemshowdetailsAr[1][@"address"];
        

        
        e_tit1.text=itemshowdetailsAr2[0][@"for_purpose"];
        e_phone1.text=itemshowdetailsAr2[0][@"contact_number"];
        
        e_mail1.text=itemshowdetailsAr2[0][@"mail_id"];
        
        
        
        
        
       cm_tit1.text=itemshowdetailsAr4[0][@"for_purpose"];
        cm_phone1.text=itemshowdetailsAr4[0][@"contact_number"];
        
        cm_mail1.text=itemshowdetailsAr4[0][@"mail_id"];
        
        
        
        m_phone1.text=itemshowdetailsAr3[0][@"contact_number"];
        
        m_mail1.text=itemshowdetailsAr3[0][@"mail_id"];

        main_tit.text=itemshowdetailsAr3[0][@"for_purpose"];
        
        
        
        NSLog(@"%@",itemshowdetailsAr);
        
        
        
        NSLog(@"%@",itemshowdetailsAr1);
        
        
        
        NSLog(@"%@",itemshowdetailsAr2);
        
        
        
        NSLog(@"%@",itemshowdetailsAr3);
        
        
        NSLog(@"%@",itemshowdetailsAr4);
        
        dispatch_async(dispatch_get_main_queue(), ^{
                     [spinner stopAnimating];
        });

        //
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"no network"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner stopAnimating];
        });
        

        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)propertypress:(id)sender
{
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.property12.highlighted = true;
                         property12.selected = true;
                     }
     ];
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.clube_house.highlighted = false;
                         clube_house.selected = false;
                     }
     ];
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.maitenence.highlighted = false;
                         maitenence.selected = false;
                     }
     ];
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.mem.highlighted = false;
                         mem.selected = false;
                     }
     ];
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.tour12.highlighted = false;
                         tour12.selected = false;
                     }
     ];
    
    
    
    
    if ((property.hidden=YES)) {
        [property12 setTitleColor:[UIColor redColor]
                         forState:(UIControlStateHighlighted | UIControlStateSelected)];
        //
        property.hidden=NO;
        maintance.hidden=YES;
        club.hidden=YES;
        membership.hidden=YES;
        tour.hidden=YES;
    }
}
-(IBAction)clubpress:(id)sender
{
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.property12.highlighted = false;
                         property12.selected = false;
                     }
     ];
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.clube_house.highlighted = true;
                         clube_house.selected = true;
                     }
     ];
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.maitenence.highlighted = false;
                         maitenence.selected = false;
                     }
     ];
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.mem.highlighted = false;
                         mem.selected = false;
                     }
     ];
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.tour12.highlighted = false;
                         tour12.selected = false;
                     }
     ];
    
    
    
    if ((club.hidden=YES)) {
        club.hidden=NO;
        property.hidden=YES;
        membership.hidden=YES;
        maintance.hidden=YES;

        tour.hidden=YES;
        
    }
    
}
-(IBAction)membership:(id)sender
{
    
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.maitenence.highlighted = true;
                         maitenence.selected = true;
                        
                     }
     ];
    
    
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.clube_house.highlighted = false;
                         clube_house.selected = false;
                     }
     ];
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.property12.highlighted = false;
                         property12.selected = false;
                     }
     ];
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.mem.highlighted = false;
                         mem.selected = false;
                     }
     ];
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.tour12.highlighted = false;
                         tour12.selected = false;
                     }
     ];
    
    if ((membership.hidden=YES)) {
        membership.hidden=NO;
        club.hidden=YES;
        property.hidden=YES;
        tour.hidden=YES;
        maintance.hidden=YES;

    }
}
-(IBAction)tourpress:(id)sender
{
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.tour12.highlighted = true;
                         tour12.selected = true;
                     }
     ];
    
    
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.maitenence.highlighted = false;
                         maitenence.selected = false;
                     }
     ];
    
    
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.clube_house.highlighted = false;
                         clube_house.selected = false;
                     }
     ];
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.property12.highlighted = false;
                         property12.selected = false;
                     }
     ];
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.mem.highlighted = false;
                         mem.selected = false;
                     }
     ];
    
    
    if ((tour.hidden=YES)) {
        tour.hidden=NO;
        club.hidden=YES;
        property.hidden=YES;
        membership.hidden=YES;
         maintance.hidden=YES;
        
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self.pagecontrol setCurrentPage:scrollView.contentOffset.x/320];
}
-(IBAction)maintance:(id)sender
{
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.tour12.highlighted = false;
                         tour12.selected = false;
                     }
     ];
    
    
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.mem.highlighted = true;
                         mem.selected = true;
                     }
     ];
    
    
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.clube_house.highlighted = false;
                         clube_house.selected = false;
                     }
     ];
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.property12.highlighted = false;
                         property12.selected = false;
                     }
     ];
    
    [UIView animateWithDuration:1
                     animations:^{
                     }
                     completion:^(BOOL finished) {
                         self.maitenence.highlighted = false;
                         maitenence.selected = false;
                     }
     ];
    
    
    if ((maintance.hidden=YES)) {
        maintance.hidden=NO;
        tour.hidden=YES;
        club.hidden=YES;
        property.hidden=YES;
        membership.hidden=YES;
        
    }
 
}

@end
