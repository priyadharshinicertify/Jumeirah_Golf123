//
//  FSdownloads.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 22/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSdownloads : GAITrackedViewController<UIWebViewDelegate>
{
    NSMutableData *receivedData;
    
}
@property(nonatomic,strong)IBOutlet UIWebView *viewWeb;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
