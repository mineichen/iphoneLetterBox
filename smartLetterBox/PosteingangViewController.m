//
//  FirstViewController.m
//  smartLetterBox
//
//  Created by Markus Ineichen on 26.11.14.
//  Copyright (c) 2014 Markus Ineichen & Thomas Jösler. All rights reserved.
//

#import "PosteingangViewController.h"
#import "JSONModelLib.h"
#import "lastChangedModel.h"
#import "lastChangeModelEntry.h"
#import "PNChart.h"
#define CHART_ELEMENTS 10

@interface PosteingangViewController ()

@end

@implementation PosteingangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray* dayOfWeek = [[NSArray alloc] initWithObjects: @"Mo",@"Di",@"Mi",@"Do",@"Fr",@"Sa", @"So", nil];
    CGRect rectangle = CGRectMake(0, 0, SCREEN_WIDTH - 20, 200.0);
    self.barChart = [[PNBarChart alloc] initWithFrame:rectangle];
    self.barChart.backgroundColor = [UIColor clearColor];
    self.barChart.yLabelFormatter = ^(CGFloat yValue){
        CGFloat yValueParsed = yValue;
        return [NSString stringWithFormat:@"%1.f g",yValueParsed];
    };
    
    [self.barChart setStrokeColor:PNDarkBlue];
    // Adding gradient
    self.barChart.barColorGradientStart = [UIColor blueColor];
    [self.graphContainer addSubview:self.barChart];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[lastChangedModel alloc]
        initFromURLWithString: @"http://mineichen.ch/smartLetterbox/lastChanges.php"
        completion:^(lastChangedModel *models, JSONModelError *err) {
            NSMutableArray *yValues = [[NSMutableArray alloc] init];
            NSMutableArray *xLabels = [[NSMutableArray alloc] init];
            
            
            for(int i = (int)models.changes.count-1; i>=0 && (int)yValues.count < CHART_ELEMENTS; i--) {
                lastChangeModelEntry *model = models.changes[i];
                if (model.pid == nil) {
                    [yValues insertObject: [NSNumber numberWithInt: model.weightChange] atIndex:0];
                    [xLabels insertObject: @"Labl" atIndex: 0];
                }
            }
            [self.barChart setYValues:yValues];
            [self.barChart setXLabels:xLabels];
            
            [self.barChart strokeChart];
            
            NSLog(@"DidLoad");
        }
    ];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
