//
//  JGEWebsite.h
//  Jumeirah
//
//  Created by Veeramani on 04/07/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JGEWebsite : GAITrackedViewController<UIWebViewDelegate>
@property(nonatomic,strong)IBOutlet UIWebView *viewWeb;
-(IBAction)home:(id)sender;
@property(nonatomic,strong)IBOutlet UIView *sample;
@end
