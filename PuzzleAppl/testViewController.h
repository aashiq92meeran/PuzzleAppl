//
//  testViewController.h
//  PuzzleAppl
//
//  Created by Hibrise on 02/08/14.
//  Copyright (c) 2014 Hibrise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface testViewController : UIViewController


 @property(nonatomic,strong) UIImageView *dragObject;
 @property(nonatomic,strong) UIImageView * dropTarget;

 @property (nonatomic, assign) CGPoint touchOffset;
 @property (nonatomic, assign) CGPoint homePosition;
@property (nonatomic,strong) NSMutableArray * arrayImages;

- (IBAction)SettingBtn:(id)sender;


@end
