//
//  ImageSlicerModel.m
//  PuzzleAppl
//
//  Created by IKRAM on 02/08/14.
//  Copyright (c) 2014 Hibrise. All rights reserved.
//

#import "ImageSlicerModel.h"

@implementation ImageSlicerModel

-(NSMutableArray *)splitImageIn:(UIImage *)im_image
{
    CGSize size = [im_image size];
    
NSMutableArray * imagePieces = [[NSMutableArray alloc]initWithCapacity:9];
  
    for (int i = 0;i<3;i++)
{
        for (int j =0; j<3; j++)
        
    {
        CGRect portion =CGRectMake (i * size.width/3.0, j * size.height/3.0,size.width/3.0,size.height/3.0);
        UIGraphicsBeginImageContext(portion.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextTranslateCTM(context, 0, -portion.size.height);
        CGContextTranslateCTM(context, -portion.origin.x, -portion.origin.y);
        CGContextDrawImage(context,CGRectMake(0.0, 0.0,size.width,  size.height), im_image.CGImage);
        [imagePieces addObject:UIGraphicsGetImageFromCurrentImageContext()];
        UIGraphicsEndImageContext();
        
        }
        
    }
    
    return imagePieces;
    
}
@end
