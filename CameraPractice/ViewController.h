//
//  ViewController.h
//  CameraPractice
//
//  Created by Darrell Nicholas on 2/7/15.
//  Copyright (c) 2015 Darrell Nicholas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;

@end

