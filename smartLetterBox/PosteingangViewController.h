//
//  FirstViewController.h
//  smartLetterBox
//
//  Created by Markus Ineichen on 26.11.14.
//  Copyright (c) 2014 Markus Ineichen & Thomas Jösler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lastChangedModel.h"
#import "PNChart.h"

@interface PosteingangViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) lastChangedModel* myChangeData;
@property (strong, nonatomic) PNBarChart* barChart;
@property (strong, nonatomic) UIView *graphContainer;
@property (strong, nonatomic) IBOutlet UIView *detailView;
@end

