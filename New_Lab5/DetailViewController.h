//
//  DetailViewController.h
//  New_Lab5
//
//  Created by yu on 14-4-24.
//  Copyright (c) 2014年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UITableViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(void)getContext:(id)context;
@end
