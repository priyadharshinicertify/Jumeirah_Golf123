//
//  AppDelegate.m
//  Jumeirah
//
//  Created by $ h i v a on 03/05/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "singleton.h"

@implementation AppDelegate

@synthesize window,viewController;
@synthesize navigationcontroller = _navigationcontroller;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
 
   [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
   
   
    /************************* GA Implement start ********************/
    

    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = 20;
    
    // Optional: set Logger to VERBOSE for debug information.
    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
    
    // Initialize tracker. Replace with your tracking ID.
    [[GAI sharedInstance] trackerWithTrackingId:@"UA-53350589-1"];
    
    
 

    
    /************************* GA Implement close ********************/

    
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
  
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
    }
    else
    {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
    }

/*#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,320, 20)];
        view.backgroundColor=[UIColor blackColor];
        [self.window.rootViewController.view addSubview:view];
    }
    */
    _navigationcontroller = [[UINavigationController alloc]initWithRootViewController:viewController];
    self.window.rootViewController = self.navigationcontroller;
    
     manage=[singleton share];
    
    
    
    //device UUID
   manage.deviceUUID= [[[UIDevice currentDevice] identifierForVendor] UUIDString];
   
    manage.devicevers = [[UIDevice currentDevice] systemVersion];
   
   manage.devicemodel = [[UIDevice currentDevice] model];
    
    
    
    
    
    
    //************ method for APNS ****************//
  //  NSLog(@"APN device token: %@", deviceToken);
    //NSString *deviceTokenString = [NSString stringWithFormat:@"%@",deviceToken];
 
   
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"HasLaunchedOnce"] == NO) {
        
//        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"thank you" message:@"smart application" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alrt show];
        manage.welcome=@"Thank you for downloading JGE  smart application";
        
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        
        manage.welcome=@"";
        // app already launched
    }
     
    
    
  [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge |UIRemoteNotificationTypeSound)];
    
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma Mark - APNS

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"content---%@", token);
    
    manage.deivceToken=[NSString stringWithFormat:@"%@",token];
    
    [self sendDevicedetails];
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    NSLog(@"Error in registration. Error: %@", err);
    //  [self alertNotice:@"" withMSG:[NSString stringWithFormat:@"Error in registration. Error: %@", err] cancleButtonTitle:@"OK" otherButtonTitle:nil];
    
    manage.str1=@"failure";
    
    
}

-(void)alertNotice:(NSString *)title withMSG:(NSString *)msg cancleButtonTitle:(NSString *)cancleTitle otherButtonTitle:(NSString *)otherTitle{
    UIAlertView *alert;
    if([otherTitle isEqualToString:@""])
        alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:cancleTitle otherButtonTitles:nil,nil];
    else
        alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:cancleTitle otherButtonTitles:otherTitle,nil];
    [alert show];
    
}

#pragma mark - Payload Sections
- (void)application:(UIApplication*)application didReceiveRemoteNotification:(NSDictionary*)userInfo
{
	NSLog(@"Received notification: %@", userInfo);
    
    if ([userInfo count]!=0) {
        
    NSMutableArray *notify;
    NSMutableArray *notify1;

    if ([notify count]==0) {
          notify=[[NSMutableArray alloc]init];
    }
      notify1=[[NSMutableArray alloc]init];
    NSMutableArray *mutableRetrievedDictionary;
    
    mutableRetrievedDictionary = [[NSUserDefaults standardUserDefaults] objectForKey:@"noyificationcount"] ;
    manage.deviealert = [[NSUserDefaults standardUserDefaults] objectForKey:@"noyificationcount"] ;
    

    
    if ( [manage.deviealert count]==0) {
       
        manage.deviealert=[[NSMutableArray alloc]init];

    }
    
    //it depend up on your Dictionary reference : http://www.raywenderlich.com/32963/apple-push-notification-services-in-ios-6-tutorial-part-2
    
    [notify addObject: [[userInfo valueForKey:@"aps"] valueForKey:@"alert"]];
         [notify addObject: [[userInfo valueForKey:@"aps"] valueForKey:@"badge"]];
    NSLog(@"aaaa %@", notify);
    
    
        NSString* alertValue = [[userInfo valueForKey:@"aps"] valueForKey:@"badge"];
        NSLog(@"my message-- %@",alertValue);
        int  badgeValue= [alertValue intValue];
    
    
    
   if (![notify count]==0) {
   // notify1=[notify mutableCopy];
      notify1 = [[manage.deviealert arrayByAddingObjectsFromArray:notify] mutableCopy];
       [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"noyificationcount"];
       
            manage.deviealert=[notify1 mutableCopy];
       NSLog(@"new...%@",manage.deviealert);
      
       [[ NSUserDefaults standardUserDefaults]setObject:manage.deviealert forKey:@"noyificationcount" ];
       
       [[NSUserDefaults standardUserDefaults]synchronize];
   }
    
    
   
    NSLog(@"dev.....%@",manage.deviealert);
    
          [notify removeAllObjects];
    
    
   
        //[[NSUserDefaults standardUserDefaults]removeObjectForKey:@"noyificationcount"];
        

   
        
        [UIApplication sharedApplication].applicationIconBadgeNumber+=badgeValue ;//[manage.deviealert count];
    
        
        
  //  [[UIApplication sharedApplication] setApplicationIconBadgeNumber:count];
    
    }  	//NSMutableArray *parts = [NSMutableArray arrayWithArray:[alertValue componentsSeparatedByString:@": "]];
	 
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)sendDevicedetails
{
    manage.deviceUUID= [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    manage.devicevers = [[UIDevice currentDevice] systemVersion];
    
    manage.devicemodel = [[UIDevice currentDevice] model];
    

    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/app_install.php"]];
    // create the Method "GET" or "POST"
    
    [request setHTTPMethod:@"POST"];
    
    //Pass The String to server
    NSString *userUpdate =[NSString stringWithFormat:@"unique_identifier=%@&device_token=%@&device_name=%@&device_version=%@",manage.deviceUUID,manage.deivceToken,manage.devicemodel,manage.devicevers,nil];
    
    //Check The Value what we passed
    NSLog(@"the data Details is =%@", userUpdate);
    
    //Convert the String to Data
    NSData *data1 = [userUpdate dataUsingEncoding:NSUTF8StringEncoding];
    
    //Apply the data to the body
    [request setHTTPBody:data1];
    
    //Create the response and Error
    
    NSError *err;
    NSURLResponse *response;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request      returningResponse:&response error:&err];
    
    NSString *resSrt = [[NSString alloc]initWithData:responseData encoding:NSASCIIStringEncoding];
    
    //This is for Response
    NSLog(@"got response==%@", resSrt);
    
    if(resSrt.length>0)
    {
        NSLog(@"got response");
        
         NSDictionary *name = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error: &err];
        
        NSString *error_message=name[@"error_message"];
        
        if ([error_message isEqualToString:@"App installed Sucessfully"]) {
            
            NSLog(@"App installed Sucessfully");
        }
        else
        {
            
        }
        
        
    }
    else
    {
        NSLog(@"faield to connect");
    }
     });
}


@end
