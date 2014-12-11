//
//  BenutzerHinzufuegenViewController.m
//  smartLetterBox
//
//  Created by iOSKurs on 26/11/14.
//  Copyright (c) 2014 Markus Ineichen & Thomas Jösler. All rights reserved.
//

#import "BenutzerHinzufuegenViewController.h"

@interface BenutzerHinzufuegenViewController ()

@end

@implementation BenutzerHinzufuegenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.benutzerTextField setDelegate:self];
    [self.benutzerTextField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.tabBarController.tabBar setHidden:NO]; // Tabbar wieder anzeigen wen VC verlassen wird
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldChanged:(UITextField *)textField
{
    if ([textField hasText]) {
        self.benutzernameCheckmark.hidden = NO;
    } else {
        self.benutzernameCheckmark.hidden = YES;
    }
}

- (IBAction)readFingerprintButtonPressed:(UIButton *)sender {
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!
    // STARTEN DES FINGERPRINT LESENS, YO
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //CHECK OB OK
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    self.fingerprintCheckmark.hidden = NO;
}

- (IBAction)savePressed:(UIBarButtonItem *)sender {
    // Felderüberprüfung & speichern
    if([self.benutzerTextField hasText]) {
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!
        // SENDEN DES SPEICHERNS ANS INTERNET
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!
        [self performSegueWithIdentifier:@"IdentifierUnwindToTableView" sender:self];
    } else {
        UIAlertView* infoMessage = [[UIAlertView alloc]initWithTitle:@"Fehler"
                                                             message:@"Bitte stellen sie sicher, dass alle benötigten Felder ausgefüllt sind."
                                                            delegate:nil
                                                   cancelButtonTitle:@"Schliessen"
                                                   otherButtonTitles:nil];
        [infoMessage show];
    }
}

@end

