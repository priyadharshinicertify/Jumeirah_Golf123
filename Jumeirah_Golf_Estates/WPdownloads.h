//
//  WPdownloads.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 30/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPdownloads : GAITrackedViewController<UIWebViewDelegate>
{
    NSMutableData *receivedData;

}
@property(nonatomic,strong)IBOutlet UIWebView *viewWeb;
@property (nonatomic, copy) NSURL *documentURL;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end
