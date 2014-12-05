//
//  ViewController.h
//  Jumeirah
//
//  Created by $ h i v a on 03/05/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "test.h"

#import "fav.h"
@interface ViewController : GAITrackedViewController<UIScrollViewDelegate>

@property (nonatomic, retain) IBOutlet UIButton *login_Button;
@property (nonatomic, retain) IBOutlet UILabel *legand;
@property (nonatomic, retain) IBOutlet UILabel *legand1;
@property (nonatomic, retain) IBOutlet UILabel *legand2;
@property (nonatomic, retain) IBOutlet UILabel *legand3;
@property (nonatomic, retain) IBOutlet UILabel *legand4;
@property (nonatomic, retain) IBOutlet UIButton *guest_Button;
@property (nonatomic, retain) IBOutlet UIButton *sign_up;

-(IBAction)LoginBtn:(id)sender;
-(IBAction)GuestLoginBtn:(id)sender;
- (IBAction)signup:(id)sender;

@property(strong,nonatomic) IBOutlet UIScrollView *theScrollview;

@property(strong,nonatomic)UIPageControl *thepagecontrol;
@property(strong,nonatomic)IBOutlet UIView *view1;
@property(strong,nonatomic)IBOutlet UIView *view2;
@property(strong,nonatomic)IBOutlet UIView *view3;
@property(strong,nonatomic)IBOutlet UIView *view4;

@property (strong, nonatomic) IBOutlet UIImageView *testimg;
@property (strong, nonatomic) IBOutlet UILabel *textlabel;


-(IBAction)btnleft:(id)sender;
-(IBAction)btnright:(id)sender;


@property(nonatomic,strong)IBOutlet UIButton *lft;
@property(nonatomic,strong)IBOutlet UIButton *rft;
@end
