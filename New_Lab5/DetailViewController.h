//
//  DetailViewController.h
//  New_Lab5
//
//  Created by yu on 14-4-24.
//  Copyright (c) 2014年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
