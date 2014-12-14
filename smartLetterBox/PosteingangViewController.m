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
        initFromURLWithString: @"http://192.168.178.22:9080/weightChange"
        completion:^(lastChangedModel *models, JSONModelError *err) {
            [self clearDetailView];
            NSMutableArray *yValues = [[NSMutableArray alloc] init];
            NSMutableArray *xLabels = [[NSMutableArray alloc] init];
            NSDateFormatter * weekdayFormatter = [[NSDateFormatter alloc]init];
            weekdayFormatter.dateFormat = @"E";
            weekdayFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier: @"de-CH"];
            
            NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
            formatter.dateStyle = NSDateFormatterMediumStyle;
            formatter.timeStyle = NSDateFormatterShortStyle;
            formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier: @"de-CH"];
            
            [self addLineAtRow:0
                      withDate:@"Datum"
                        weight: @"Gewicht"
                  weightChange: @"Änderung"
                       andFont: [UIFont fontWithName:@"TrebuchetMS-Bold" size:18]];
            
            int detailItemCounter = 1;
            for(int i = (int)models.changes.count-1; i>=0 && (int)yValues.count < CHART_ELEMENTS; i--) {
                lastChangeModelEntry *model = models.changes[i];
                if (model.weightChange > 0) {
                    [yValues insertObject: [NSNumber numberWithInt: model.weightChange/10] atIndex:0];
                    [xLabels insertObject: [weekdayFormatter stringFromDate:model.date] atIndex: 0];
                    [self addLineAtRow:detailItemCounter
                              withDate: [formatter stringFromDate: model.date]
                                weight: [NSString stringWithFormat: @"%i g", model.weight]
                          weightChange: [NSString stringWithFormat: @"+%i g", model.weightChange]
                               andFont: [UIFont fontWithName:@"TrebuchetMS" size:18]
                     ];
                    detailItemCounter++;
                }
            }
            
            [self.barChart setYValues:yValues];
            [self.barChart setXLabels:xLabels];
            
            [self.barChart strokeChart];
            
            NSLog(@"DidLoad");
        }
    ];
}
-(void) addLineAtRow: (int) index withDate: (NSString*) date weight: (NSString*) weight weightChange:(NSString*) weightChange andFont: (UIFont*) font {
    float gridWidth = self.detailView.bounds.size.width / 12;
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, index * 30, gridWidth * 6, 30)];
    label.text = date;
    label.textColor = [UIColor blueColor];
    label.font = font;
    [self.detailView addSubview:label];
    
    UILabel* weightLabel = [[UILabel alloc] initWithFrame:CGRectMake(gridWidth * 6, index * 30, gridWidth * 3, 30)];
    weightLabel.text = weight;
    weightLabel.font = font;
    weightLabel.textColor = [UIColor blueColor];
    [self.detailView addSubview:weightLabel];
    
    UILabel* weightChangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(gridWidth * 9, index * 30, gridWidth * 3, 30)];
    weightChangeLabel.text = weightChange;
    weightChangeLabel.font = font;
    weightChangeLabel.textColor = [UIColor blueColor];
    [self.detailView addSubview:weightChangeLabel];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void) clearDetailView {
    for(UILabel *view in self.detailView.subviews)
    {
        [view removeFromSuperview];
    }
}

@end
