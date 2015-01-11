//
//  CustomTableViewCell.h
//  CustomTableViewCell
//
//  Created by Toru Furuya on 2015/01/11.
//  Copyright (c) 2015年 edu.myself. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *preferredView;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *labelView;
@end
