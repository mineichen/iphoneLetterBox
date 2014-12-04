//
//  lastChangeModelEntry.h
//  smartLetterBox
//
//  Created by iOSKurs on 04/12/14.
//  Copyright (c) 2014 Markus Ineichen & Thomas Jösler. All rights reserved.
//

#import "JSONModel.h"

@protocol lastChangeModelEntry @end

@interface lastChangeModelEntry : JSONModel
@property NSString* name;
@property int pid;
@property int weight;
@property int weightChange;
@property NSDate* date;
@end
