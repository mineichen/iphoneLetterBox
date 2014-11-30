//
//  DataController.m
//  smartLetterBox
//
//  Created by iOSKurs on 30/11/14.
//  Copyright (c) 2014 Markus Ineichen & Thomas Jösler. All rights reserved.
//

#import "DataController.h"

@implementation DataController

// Singleton
+ (DataController*) sharedDataController {
    
    static DataController* dataProvider = nil;
    if(!dataProvider) {
        dataProvider = [[self alloc]init];
    }
    return dataProvider;
}

- (NSArray*)getUserData {
    NSURL *url = [[NSURL alloc]initWithString:@"http://wherever.ch/hslu/iPhoneAdressData.json"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in [NSJSONSerialization JSONObjectWithData:data options:0 error:nil]) {
        [tempArray addObject:[[NSString alloc] initWithFormat:@"%@ %@",
                              [dict valueForKey:@"firstName"],
                              [dict valueForKey:@"lastName"],
                              nil]];
    }
    return [NSArray arrayWithArray:tempArray];
}

- (NSArray*)getLeerungenData {
    NSURL *url = [[NSURL alloc]initWithString:@"http://wherever.ch/hslu/iPhoneAdressData.json"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in [NSJSONSerialization JSONObjectWithData:data options:0 error:nil]) {
        [tempArray addObject:[[NSString alloc] initWithFormat:@"%@ %@",
                              [dict valueForKey:@"firstName"],
                              [dict valueForKey:@"lastName"],
                              nil]];
    }
    return [NSArray arrayWithArray:tempArray];
}

- (NSArray*)getPosteingangData {
    NSURL *url = [[NSURL alloc]initWithString:@"http://wherever.ch/hslu/iPhoneAdressData.json"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in [NSJSONSerialization JSONObjectWithData:data options:0 error:nil]) {
        [tempArray addObject:[[NSString alloc] initWithFormat:@"%@ %@",
                              [dict valueForKey:@"firstName"],
                              [dict valueForKey:@"lastName"],
                              nil]];
    }
    return [NSArray arrayWithArray:tempArray];
}

@end
