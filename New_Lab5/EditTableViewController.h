//
//  EditTableViewController.h
//  New_Lab5
//
//  Created by yu on 14-4-27.
//  Copyright (c) 2014年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditTableViewController : UITableViewController<UISplitViewControllerDelegate>
@property (strong,nonatomic) id getPassedItem;


@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UILabel *timelabel;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
- (IBAction)SaveBtn:(id)sender;
-(void)setitem:(id)newItem;
-(void)setContext:(id)context;
@end
