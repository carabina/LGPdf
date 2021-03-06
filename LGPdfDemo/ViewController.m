//
//  ViewController.m
//  LGPdfDemo
//
//  Created by Luna Gao on 16/9/6.
//  Copyright © 2016年 luna.gao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CreatePdf:(id)sender {
    LGPdf *pdf = [LGPdf createPDF];
    struct LGPageInfo size = {A4_L,A4_S};
    [pdf setFileName:@"demo.pdf" pageSize:size];
    [pdf readyToWrite];
    [pdf newPage];
    
    // text
    
    LGPdfText* text = [[LGPdfText alloc] init];
    [text setText:@"hello world 你好世界"];
    [text setAlign:NSTextAlignmentCenter];
    [text setFont:[UIFont boldSystemFontOfSize:12]];
    [text setForegroundColor:[UIColor redColor]];
//    [text setLength:200];
//    struct CGPoint point = {100, 100};
//    [text setLocation:point];
    [pdf addText:text];
    
    
    // table
    
    LGPdfTable *table = [[LGPdfTable alloc] init];
    [table setBorderWidth:0.1];
    NSArray *cWidth = [NSArray arrayWithObjects:@0.1f, @0.1f, @0.2f, @0.2f, @0.2f, @0.1f, @0.1f, nil];
    [table setColumnsWidthByPercent:cWidth];
    
    [self addCell:table WithValue:@"1" WithColSpan:3 WithRowSpan:3];
    [self addCell:table WithValue:@"2" WithColSpan:2 WithRowSpan:1];
    [self addCell:table WithValue:@"3" WithColSpan:1 WithRowSpan:2];
    [self addCell:table WithValue:@"4" WithColSpan:1 WithRowSpan:2];
    [self addCell:table WithValue:@"5" WithColSpan:2 WithRowSpan:1];
    [self addCell:table WithValue:@"6" WithColSpan:2 WithRowSpan:1];
    [self addCell:table WithValue:@"7" WithColSpan:2 WithRowSpan:1];
    [self addCell:table WithValue:@"8" WithColSpan:4 WithRowSpan:1];
    [self addCell:table WithValue:@"9" WithColSpan:1 WithRowSpan:1];
    [self addCell:table WithValue:@"10" WithColSpan:1 WithRowSpan:1];
    [self addCell:table WithValue:@"11" WithColSpan:1 WithRowSpan:1];
    [self addCell:table WithValue:@"12" WithColSpan:1 WithRowSpan:3];
    [self addCell:table WithValue:@"13" WithColSpan:5 WithRowSpan:3];
    [self addCell:table WithValue:@"14" WithColSpan:1 WithRowSpan:1];
    [self addCell:table WithValue:@"15" WithColSpan:1 WithRowSpan:1];
    [self addCell:table WithValue:@"16" WithColSpan:1 WithRowSpan:1];
    [self addCell:table WithValue:@"17" WithColSpan:2 WithRowSpan:1];
    [self addCell:table WithValue:@"18" WithColSpan:1 WithRowSpan:1];
    [self addCell:table WithValue:@"ADSL放假啊撩是斗非加辣；世纪东方拉丝机地方了；as江东父老；卡机地方了；卡十几分；卢卡斯姐地方了；卡机发卢卡斯姐发来；卡机发来；卡介绍的；浪费空间啊收到了；副科级啊数量；" WithColSpan:4 WithRowSpan:1];
    
    [pdf addTable:table];
    
    // image
    LGPdfImage *image = [[LGPdfImage alloc] init];
    UIImage *uiImage = [UIImage imageNamed:@"pdf_png"];
    [image setImage:uiImage];
    struct CGSize imageSize = {100, 100};
    [image setSize:imageSize];
    
    [pdf addImage:image];
    
    [pdf closeToWrite];
    
    NSLog(@"%@", [pdf getPdfFile]);
}

- (void) addCell:(LGPdfTable*) table WithValue:(NSString *)value WithColSpan:(int) colspan WithRowSpan:(int) rowSpan {
    LGPdfCell *cell = [[LGPdfCell alloc] init];
    LGPdfText* text = [[LGPdfText alloc] init];
    [text setText:value];
    if ([value isEqualToString:@"9"]) {
        [text setFont:[UIFont boldSystemFontOfSize:19]];
    } else {
        [text setFont:[UIFont boldSystemFontOfSize:9]];
    }
    [cell setElement:text];
    [cell setColspan:colspan];
    [cell setRowspan:rowSpan];
    [table add:cell];
}

@end
