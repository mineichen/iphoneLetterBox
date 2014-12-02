//
//  DataController.h
//  smartLetterBox
//
//  Created by iOSKurs on 30/11/14.
//  Copyright (c) 2014 Markus Ineichen & Thomas Jösler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonModel.h"

@interface DataController : NSObject
- (PersonModel*)getUserData;
- (NSArray*)getPosteingangData;
- (NSArray*)getLeerungenData;

+ (DataController*) sharedDataController;

@end
