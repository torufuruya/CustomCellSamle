//
//  ViewController.h
//  CustomTableViewCell
//
//  Created by Toru Furuya on 2015/01/09.
//  Copyright (c) 2015年 edu.myself. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

