//
//  BenutzerTableViewController.h
//  smartLetterBox
//
//  Created by iOSKurs on 26/11/14.
//  Copyright (c) 2014 Markus Ineichen & Thomas Jösler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonModel.h"

@interface BenutzerTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *benutzerTableView;
@property (strong, nonatomic) PersonModel* myPersonData;

- (IBAction)unwindToTableView:(UIStoryboardSegue*)sender;
@end
