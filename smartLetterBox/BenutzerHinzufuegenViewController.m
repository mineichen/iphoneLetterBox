//
//  BenutzerHinzufuegenViewController.m
//  smartLetterBox
//
//  Created by iOSKurs on 26/11/14.
//  Copyright (c) 2014 Markus Ineichen & Thomas Jösler. All rights reserved.
//

#import "BenutzerHinzufuegenViewController.h"
#import "MBProgressHUD.h"

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
    //!!!!!!!!!!!!!!!!!!!!!		!!!!!!
    // STARTEN DES FINGERPRINT LESENS, Y	O
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //CHECK OB OK
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    self.fingerprintCheckmark.hidden = NO;
}

- (IBAction)savePressed:(UIBarButtonItem *)sender {
    // Felderüberprüfung & speichern
    if([self.benutzerTextField hasText]) {
        [self createUser: self.benutzerTextField.text];
        MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"Finger scannen";
    } else {
        UIAlertView* infoMessage = [[UIAlertView alloc]initWithTitle:@"Fehler"
                                                             message:@"Bitte stellen sie sicher, dass alle benötigten Felder ausgefüllt sind."
                                                            delegate:nil
                                                   cancelButtonTitle:@"Schliessen"
                                                   otherButtonTitles:nil];
        
        [infoMessage show];
    }
}

- (void)createUser: (NSString*) userName {
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: @"http://192.168.178.22:9080/user"]];
    [urlRequest setHTTPMethod: @"POST"];
    [urlRequest addValue: @"text/json" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPBody: [[NSString stringWithFormat:@"{\"name\": \"%@\"}", userName] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         dispatch_async(dispatch_get_main_queue(), ^{
             [self performSegueWithIdentifier:@"IdentifierUnwindToTableView" sender:self];
         });
     }];
}


@end

