//
//  FTdownloads.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 01/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
@interface FTdownloads : UIViewController<UIWebViewDelegate>
{
    NSMutableData *receivedData;
    
}
@property(nonatomic,strong)IBOutlet UIWebView *viewWeb;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end
