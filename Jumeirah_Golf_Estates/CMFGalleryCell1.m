//
//  CMFGalleryCell1.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 31/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "CMFGalleryCell1.h"

@interface CMFGalleryCell1 ()
- (IBAction)collect:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageView1;
@end

@implementation CMFGalleryCell1

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CMFGalleryCell1" owner:self options:nil];
        
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
    
    NSString *sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Assests1"];
    NSString *filename = [NSString stringWithFormat:@"%@/%@", sourcePath, self.imageName];
    
    UIImage *image = [UIImage imageWithContentsOfFile:filename];
    
    [self.imageView1 setImage:image];
    [self.imageView1 setContentMode:UIViewContentModeScaleAspectFill];
    
}

- (IBAction)collect:(id)sender {
}
@end
