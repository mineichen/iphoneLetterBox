//
//  lastChangedModel.h
//  smartLetterBox
//
//  Created by iOSKurs on 04/12/14.
//  Copyright (c) 2014 Markus Ineichen & Thomas Jösler. All rights reserved.
//

#import "JSONModel.h"
#import "lastChangeModelEntry.h"

@interface lastChangedModel : JSONModel
@property (strong, nonatomic) NSArray<lastChangeModelEntry>* changes;
@end
