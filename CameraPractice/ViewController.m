//
//  ViewController.m
//  CameraPractice
//
//  Created by Darrell Nicholas on 2/7/15.
//  Copyright (c) 2015 Darrell Nicholas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *uuidImageName = @"<__NSConcreteUUID 0x170229cc0> F1CE2B5A-D740-48AD-B22E-DCCF03E3C3E0.png";
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
    //NSString *uuidImageName = [NSString stringWithFormat:@"/images/%@.png",[NSUUID UUID]];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:uuidImageName]; //Add the file name
    NSData *pngData = [NSData dataWithContentsOfFile:filePath];
    UIImage *loadImage = [UIImage imageWithData:pngData];
    _imageView.image = loadImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)selectPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

#pragma mark - UIImagePickerController Delegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    // turn the image into png data
    NSData *pngData = UIImagePNGRepresentation(chosenImage);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
    NSString *uuidImageName = [NSString stringWithFormat:@"%@.png",[NSUUID UUID]];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:uuidImageName]; //Add the file name
    NSLog(@"%@", filePath);
    [pngData writeToFile:filePath atomically:YES]; //Write the file
    self.imageView.image = chosenImage;
    //NSLog(@"%@", info.description);
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
