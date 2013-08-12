//
//  ViewController.m
//  DynamicHeightCellTest
//
//  Created by kaiba on 13/08/07.
//  Copyright (c) 2013 kaiba. All rights reserved.
//

#import "ViewController.h"
#import "TextCell.h"

@interface ViewController () {
    CGFloat fontSize;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    fontSize = 10;
    [self.tableView registerNib:[UINib nibWithNibName:@"TextCell" bundle:nil] forCellReuseIdentifier:@"TextCell"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(plus)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"-" style:UIBarButtonItemStylePlain target:self action:@selector(minus)];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TextCell* textCell = [tableView dequeueReusableCellWithIdentifier:@"TextCell"];
    textCell.multiLineTextView.text = [self textForIndex:indexPath.row];
    textCell.multiLineTextView.font = [UIFont systemFontOfSize:fontSize];
    return textCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [TextCell heightForCell:[self textForIndex:indexPath.row] size:fontSize width:self.view.frame.size.width];
}

- (void)tableView:(UITableView *)tableView
    willDisplayCell:(UITableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // For even
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor whiteColor];
    }
    // For odd
    else {
        cell.backgroundColor = [UIColor colorWithHue:0.61
            saturation:0.09
            brightness:0.99
            alpha:1.0];
    }
}

// 本当は表示するデータのオブジェクトから取るのでしょうね
- (NSString*)textForIndex:(int)index {
    NSMutableString *text = [NSMutableString string];
    [text appendString:@"うわ"];
    for (int i = 0; i < (30 + index); i++) {
        [text appendString:@"ぁ"];
    }
    [text appendString:@"ん"];
    return [NSString stringWithString:text];
}

- (void)plus {
    fontSize += 0.5;
    [self.tableView reloadData];
}

- (void)minus {
    fontSize -= 0.5;
    if (fontSize <= 0) {
        fontSize = 1;
    }
    [self.tableView reloadData];
}

@end