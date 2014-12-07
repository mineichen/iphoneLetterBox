//
//  BenutzerHinzufuegenViewController.h
//  smartLetterBox
//
//  Created by iOSKurs on 26/11/14.
//  Copyright (c) 2014 Markus Ineichen & Thomas Jösler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BenutzerHinzufuegenViewController : UIViewController <UITextFieldDelegate>
- (IBAction)savePressed:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UITextField *benutzerTextField;
@property (weak, nonatomic) IBOutlet UIImageView *benutzernameCheckmark;
@property (weak, nonatomic) IBOutlet UIImageView *fingerprintCheckmark;

- (IBAction)readFingerprintButtonPressed:(UIButton *)sender;

@end
