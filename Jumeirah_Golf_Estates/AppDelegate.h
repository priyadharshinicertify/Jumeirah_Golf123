//
//  AppDelegate.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 15/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;
#import "singleton.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
     singleton *manage;
}

@property (strong, nonatomic) UIWindow *window;


@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) UINavigationController *navigationcontroller;

@end
