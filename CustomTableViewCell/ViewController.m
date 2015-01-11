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

NSArray *_arr;
NSArray *_img;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    _arr = @[
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

    [self.tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = (CustomTableViewCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    CGRect newBounds = cell.bounds;
    newBounds.size.width = tableView.bounds.size.width;
    cell.bounds = newBounds;

    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    NSLog(@"Cell height: %@", NSStringFromCGSize(cell.preferredView.bounds.size));
    return cell.preferredView.bounds.size.height;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(CustomTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.label.text = [_arr objectAtIndex:indexPath.row];
    cell.photo.image = [UIImage imageNamed:[_img objectAtIndex:indexPath.row % 3]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
