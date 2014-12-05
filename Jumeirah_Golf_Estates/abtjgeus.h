//
//  abtjgeus.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 01/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BackgroundLayer.h"

@interface abtjgeus : UIViewController<UIScrollViewDelegate>
@property(nonatomic,retain)IBOutlet UIScrollView *scroll;

@property(nonatomic,strong)IBOutlet UIView *sample;
-(IBAction)home:(id)sender;

@end
