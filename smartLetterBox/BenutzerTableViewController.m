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

-(void)viewDidLoad {
    [super viewDidLoad];
    self.benutzerTableView.delegate = self;
    self.benutzerTableView.dataSource = self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.myPersonData = [[PersonModel alloc]
        initFromURLWithString: @"http://192.168.178.22:9080/user"
        completion:^(PersonModel *model, JSONModelError *err) {
            [self.benutzerTableView reloadData];
        }
    ];
}

- (IBAction)unwindToTableView:(UIStoryboardSegue*)sender {
    NSLog(@"Unwind TableView");
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
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"%@", myPersonData.name];
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        PersonModelEntry * person = self.myPersonData.users[0];
        [self deleteUser: person._id];
        
        [self.myPersonData.users removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
        return YES;
}
- (void)deleteUser: (int) userId {
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat: @"http://192.168.178.22:9080/user/%i", userId]]];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // Specify that it will be a POST request
    [urlRequest setHTTPMethod: @"DELETE"];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
    {
        NSLog(@"Done");
    }];
}

@end
