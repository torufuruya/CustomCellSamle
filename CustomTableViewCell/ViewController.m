//
//  ViewController.m
//  CustomTableViewCell
//
//  Created by Toru Furuya on 2015/01/09.
//  Copyright (c) 2015年 edu.myself. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "ViewController.h"

@interface ViewController ()

@end

NSArray *arr;
NSArray *_img;
CGFloat _imgHeight;
const CGFloat kCellWidth = 320;
const CGFloat kCellHeight = 215;
CustomTableViewCell *_stubCell;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    arr = @[
        @"Hello, world!",
        @"自分を励ます最上の方法。それは誰かを励まそうとすることである",
        @"I’ve missed more than 9000 shots, lost almost 300 games. 26 times, I’ve been trusted to take the game winning shot and missed. I’ve failed over and over and over again in my life. And that is why I succeed",
        @"木を切り倒すのに6時間与えられたら、私は最初の4時間を斧を研ぐのに費やす",
        @"人間の本当の価値は、すべてが上手くいって満足している時ではなく、試練に立ち向かい、困難と戦っているときにわかる",
    ];
    _img = @[
             @"sample.jpg",
             @"cake.jpg",
             @"effel.jpg"
    ];

    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    
    _stubCell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
//    self.tableView.estimatedRowHeight = 40;
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGSize checkSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, 400);
    NSDictionary *attributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                 NSFontAttributeName:[UIFont systemFontOfSize:17.0]
                                 };
    NSString *text = [arr objectAtIndex:indexPath.row];
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:text
                                                                 attributes:attributes];
    
    CGRect textFrame = [string boundingRectWithSize:checkSize
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                            context:nil];
    NSLog(@"height: %f", textFrame.size.height);
    _imgHeight = [[UIScreen mainScreen] bounds].size.width / kCellWidth * kCellHeight;
    NSLog(@"_imgHeight: %f", _imgHeight);
    return _imgHeight + textFrame.size.height + 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(CustomTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.label.text = [arr objectAtIndex:indexPath.row];
    NSString *img = [_img objectAtIndex:indexPath.row % 3];
    cell.image.image = [UIImage imageNamed:img];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
