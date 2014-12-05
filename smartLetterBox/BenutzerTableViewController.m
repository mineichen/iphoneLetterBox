//
//  BenutzerTableViewController.m
//  smartLetterBox
//
//  Created by iOSKurs on 26/11/14.
//  Copyright (c) 2014 Markus Ineichen & Thomas Jösler. All rights reserved.
//

#import "BenutzerTableViewController.h"
#import "PersonModel.h"
#import "JSONModelLib.h"



@interface BenutzerTableViewController ()

@end

@implementation BenutzerTableViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSString *url = @"http://mineichen.ch/smartLetterbox/person.php";
    self.myPersonData = [[PersonModel alloc]
        initFromURLWithString:url
        completion:^(PersonModel *model, JSONModelError *err) {
            [self.benutzerTableView reloadData];
            
        }
    ];
}

- (IBAction)unwindToTableView:(UIStoryboardSegue*)sender {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.myPersonData.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    PersonModelEntry* myPersonData = self.myPersonData.users[indexPath.row];
    
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"%@", myPersonData.name];
    return cell;
}

@end
