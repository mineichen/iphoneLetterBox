//
//  PersonModelEntry.h
//  smartLetterBox
//
//  Created by iOSKurs on 02/12/14.
//  Copyright (c) 2014 Markus Ineichen & Thomas Jösler. All rights reserved.
//

#import "JSONModel.h"

@protocol PersonModelEntry @end

@interface PersonModelEntry : JSONModel
@property NSString* name;
@property int pid;
@property BOOL active;
@property int fingerprint;
@end
