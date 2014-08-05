//
//  testViewController.m
//  PuzzleAppl
//
//  Created by Hibrise on 02/08/14.
//  Copyright (c) 2014 Hibrise. All rights reserved.
//

#import "testViewController.h"
#import "ImageSlicerModel.h"

@interface testViewController ()

{
    
    ImageSlicerModel *imageSlicerObj;
    NSMutableArray *puzzlepieces;
    
}
@end

@implementation testViewController

@synthesize dropTarget;
@synthesize dragObject;
@synthesize touchOffset;
@synthesize homePosition;
@synthesize arrayImages;


-(void)viewDidLoad
{
    
    [self Slicied_Image];

    [self ArrayPics];
    
    [super viewDidLoad];
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@" Values");
    if ([touches count] == 1) {
        // one finger
        CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
        for (UIImageView *iView in self.view.subviews)
        {
        
            if ([iView isMemberOfClass:[UIImageView class]])
            {
                if (touchPoint.x > iView.frame.origin.x &&
                    touchPoint.x < iView.frame.origin.x + iView.frame.size.width &&
                    touchPoint.y > iView.frame.origin.y &&
                    touchPoint.y < iView.frame.origin.y + iView.frame.size.height)
                {
                    if (iView.tag> 0 && iView.tag <10)
                    {
                    self.dragObject = iView;
                    self.touchOffset = CGPointMake(touchPoint.x - iView.frame.origin.x,
                                                   touchPoint.y - iView.frame.origin.y);
                    self.homePosition = CGPointMake(iView.frame.origin.x,
                                                    iView.frame.origin.y);
                    [self.view bringSubviewToFront:self.dragObject];
                }
            }
        }
    }
  }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
    CGRect newDragObjectFrame = CGRectMake(touchPoint.x - touchOffset.x,
                                           touchPoint.y - touchOffset.y,
                                           self.dragObject.frame.size.width,
                                           self.dragObject.frame.size.height);
    self.dragObject.frame = newDragObjectFrame;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

    
    CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
    
    
    
    for (UIImageView * subviews in self.view.subviews)
    {
        if (subviews.tag > 9 && subviews.tag <19)
        {
            if (touchPoint.x > subviews.frame.origin.x &&
                touchPoint.x < subviews.frame.origin.x + subviews.frame.size.width &&
                touchPoint.y > subviews.frame.origin.y &&
                touchPoint.y < subviews.frame.origin.y + subviews.frame.size.height )
            {
                if (dragObject.tag+9 == subviews.tag)
                {
                    subviews.image = self.dragObject.image;
                    [self RemoveImageFromHomePosition:dragObject.tag];
            
                    
                
                    self.dragObject= nil;
                }
            }
       
        
    }
        self.dragObject.frame = CGRectMake(self.homePosition.x, self.homePosition.y,
                                           self.dragObject.frame.size.width,
                                           self.dragObject.frame.size.height);
        
    }
}
-(void)Slicied_Image

{
    
        if (!imageSlicerObj)
            
        {
            imageSlicerObj = [[ImageSlicerModel alloc]init];
            
        }
       UIImageView *imageView=(UIImageView *)[self.view viewWithTag:20];
       [imageView setImage:[UIImage imageNamed:@"1.png"]];

        puzzlepieces = [imageSlicerObj splitImageIn:[UIImage imageNamed:@"1.png"]];
    
        [self AssignImageInView:puzzlepieces];

//    puzzlepieces = [imageSlicerOb]
    
}
-(void)RemoveImageFromHomePosition:(int)index
{
    
    for (UIImageView *removeImage in self.view.subviews)
    {
        if (removeImage.tag == index )
        {
           
            [removeImage removeFromSuperview];
        
            
        }
        
    }
}


-(void)AssignImageInView:(NSMutableArray *)Display_puzzleImages
{
    for (UIImageView * imageView in self.view.subviews)
    {
        if ([imageView isMemberOfClass:[UIImageView class]])
        {
            for ( int i=0 ; i<Display_puzzleImages.count;i++)
            {
                if (imageView.tag < 10)
                {
                    [imageView setImage:[Display_puzzleImages objectAtIndex:i]];
                    [Display_puzzleImages removeObjectAtIndex:i];
                    break;
                    
                }
            }
        }
    }
}
-(void)ArrayPics

{
  arrayImages = [NSMutableArray arrayWithObjects:
              @"images.jpeg" , @"Lion.jpg",nil];
    
    NSLog(@" PIC %@",arrayImages);
    
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SettingBtn:(id)sender
{
    
}
@end
