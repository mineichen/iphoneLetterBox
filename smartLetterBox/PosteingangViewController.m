//
//  FirstViewController.m
//  smartLetterBox
//
//  Created by Markus Ineichen on 26.11.14.
//  Copyright (c) 2014 Markus Ineichen & Thomas Jösler. All rights reserved.
//

#import "PosteingangViewController.h"
#import "JSONModelLib.h"

@interface PosteingangViewController ()

@end

@implementation PosteingangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *url = @"http://mineichen.ch/smartLetterbox/lastChanges.php";
    self.myChangeData = [[lastChangedModel alloc]
                         initFromURLWithString:url
                         completion:^(lastChangedModel *model, JSONModelError *err) {
                             // -- TO DO: ---------------------------
                             // check if data can be fetched correctly. JSON needs adjustment by Kusi "the JSON" Ineichen.
                             // create LineChart and place it in the Kusi-Container.
                             NSLog(@"%@", model.changes);
                             NSLog(@"%@", err);
                             
                         }
                         ];
    
    
    self.lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
    [self.lineChart setXLabels:@[@"SEP 1",@"SEP 2",@"SEP 3",@"SEP 4",@"SEP 5"]];
    
    NSArray * data01Array = @[@60.1, @160.1, @126.4, @262.2, @186.2];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.color = PNDarkYellow;
    data01.itemCount = self.lineChart.xLabels.count;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    self.lineChart.chartData = @[data01];
    [self.lineChart strokeChart];
    
    [self.view addSubview:self.lineChart];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
