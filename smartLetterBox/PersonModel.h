//
//  PersonModel.h
//  smartLetterBox
//
//  Created by iOSKurs on 02/12/14.
//  Copyright (c) 2014 Markus Ineichen & Thomas Jösler. All rights reserved.
//

#import "JSONModel.h"
#import "PersonModelEntry.h"

@interface PersonModel : JSONModel
@property (strong, nonatomic) NSMutableArray<PersonModelEntry>* users;
@end
