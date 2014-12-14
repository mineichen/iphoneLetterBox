//
//  SecondViewController.h
//  smartLetterBox
//
//  Created by Markus Ineichen on 26.11.14.
//  Copyright (c) 2014 Markus Ineichen & Thomas Jösler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lastChangedModel.h"
#import "PNChart.h"

@interface LeerungenViewController : UIViewController
@property (strong, nonatomic) lastChangedModel* myChangeData;
@property (strong, nonatomic) PNBarChart* barChart;
@property (strong, nonatomic) IBOutlet UIView *detailView;
@property (strong, nonatomic) IBOutlet UIView *graphContainer;
@end


