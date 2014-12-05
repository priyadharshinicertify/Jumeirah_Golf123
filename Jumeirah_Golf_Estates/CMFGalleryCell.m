//
//  CMFGalleryCell.m
//  UICollectionGallery
//
//  Created by Tim on 09/04/2013.
//  Copyright (c) 2013 Charismatic Megafauna Ltd. All rights reserved.
//

#import "CMFGalleryCell.h"
#import "FGalleryViewController.h"
@interface CMFGalleryCell()
- (IBAction)collect:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation CMFGalleryCell
@synthesize txt,brieftx,headtxt;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CMFGalleryCell" owner:self options:nil];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![arrayOfViews[0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = arrayOfViews[0];
    }
    
    return self;
}

-(void)updateCell {
    
    NSString *sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Assests"];
    NSString *filename = [NSString stringWithFormat:@"%@/%@", sourcePath, self.imageName];
    
    UIImage *image = [UIImage imageWithContentsOfFile:filename];
    
    [self.imageView setImage:image];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFill];
    
}

- (IBAction)collect:(id)sender {
   }
@end
//@"Click View Earth Gallery",@"Click to View ETPI Gallery",@"Click to View Fire Gallery", nil];
