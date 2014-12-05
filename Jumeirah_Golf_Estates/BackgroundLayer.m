//
//  BackgroundLayer.h
//  SPANPLAN
//
//  Created by SPAN TECHNOLOGY on 24/12/12.
//  Copyright (c) 2012 SPAN TECHNOLOGY. All rights reserved.
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer


//Blue gradient background
+ (CAGradientLayer*) blackWhiteGradient
{
    UIColor *colorOne = [UIColor colorWithRed:119.0/255.0 green:119.0/255.0 blue:119.0/255.0 alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:0.0/255.0  green:0.0/255.0  blue:0.0/255.0  alpha:1.0];
    UIColor *colorThree = [UIColor colorWithRed:119.0/255.0 green:119.0/255.0 blue:119.0/255.0 alpha:1.0];

    NSArray *colors = @[(id)colorOne.CGColor, (id)(colorTwo.CGColor), (id)(colorThree.CGColor)];
    
    CAGradientLayer *buttonLayer = [CAGradientLayer layer];
	buttonLayer.colors = colors;
    
	return buttonLayer;
}
+ (CAGradientLayer*) blackWhiteGradient1
{
     UIColor *colorOne = [UIColor colorWithRed:119.0/255.0 green:119.0/255.0 blue:119.0/255.0 alpha:1.0];
   // UIColor *colorOne1 = [UIColor colorWithRed:119.0/255.0 green:119.0/255.0 blue:119.0/255.0 alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:0.0/255.0  green:0.0/255.0  blue:0.0/255.0  alpha:1.0];
   // UIColor *colorThree = [UIColor colorWithRed:0.0/255.0  green:0.0/255.0  blue:0.0/255.0  alpha:1.0];
    NSArray *colors = @[(id)colorOne.CGColor, (id)(colorTwo.CGColor),(id)(colorTwo.CGColor)];
    
    CAGradientLayer *buttonLayer = [CAGradientLayer layer];
	buttonLayer.colors = colors;
    
	return buttonLayer;
}
/*
 
 [04/09/14 3:19:58 pm] Subachitra: rgb(223,239,213)
 [04/09/14 3:20:08 pm] Subachitra: rgb(169,201,154)
 [04/09/14 3:20:18 pm] Subachitra: rgb(84,186,76)
 */
+ (CAGradientLayer*) blackWhiteGradient2
{
    UIColor *colorOne = [UIColor colorWithRed:223.0/255.0 green:239.0/255.0 blue:213.0/255.0 alpha:1.0];
    // UIColor *colorOne1 = [UIColor colorWithRed:119.0/255.0 green:119.0/255.0 blue:119.0/255.0 alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:169.0/255.0  green:201.0/255.0  blue:154.0/255.0  alpha:1.0];
    UIColor *colorThree = [UIColor colorWithRed:84.0/255.0  green:186.0/255.0  blue:76.0/255.0  alpha:1.0];
    NSArray *colors = @[(id)colorOne.CGColor, (id)(colorTwo.CGColor), (id)(colorThree.CGColor)];
    
    CAGradientLayer *buttonLayer = [CAGradientLayer layer];
	buttonLayer.colors = colors;
    
	return buttonLayer;
}







+ (CAGradientLayer*) blackWhiteGradientw
{
    UIColor *colorOne = [UIColor colorWithRed:60.0/255.0 green:169.0/255.0 blue:219.0/255.0 alpha:1.0];
    // UIColor *colorOne1 = [UIColor colorWithRed:119.0/255.0 green:119.0/255.0 blue:119.0/255.0 alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:30.0/255.0  green:124.0/255.0  blue:195.0/255.0  alpha:1.0];
   // UIColor *colorThree = [UIColor colorWithRed:84.0/255.0  green:186.0/255.0  blue:76.0/255.0  alpha:1.0];
    NSArray *colors = @[(id)colorOne.CGColor, (id)(colorTwo.CGColor)];
    
    CAGradientLayer *buttonLayer = [CAGradientLayer layer];
	buttonLayer.colors = colors;
    
	return buttonLayer;
}



+ (CAGradientLayer*) blackWhiteGradientp
{
    UIColor *colorOne = [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:51.0/255.0 alpha:1.0];
   
    UIColor *colorTwo = [UIColor colorWithRed:153.0/255.0  green:163.0/255.0  blue:51.0/255.0  alpha:1.0];
     NSArray *colors = @[(id)colorOne.CGColor, (id)(colorTwo.CGColor)];
    
    CAGradientLayer *buttonLayer = [CAGradientLayer layer];
	buttonLayer.colors = colors;
    
	return buttonLayer;
}




@end
