//
//  EditTableViewController.m
//  New_Lab5
//
//  Created by yu on 14-4-27.
//  Copyright (c) 2014年 yu. All rights reserved.
//

#import "EditTableViewController.h"
#import "DetailViewController.h"
@interface EditTableViewController ()

@end

@implementation EditTableViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]
            initWithTitle:@"Cancel"
              style:UIBarButtonItemStyleBordered
                                 target:self
                                 action:@selector(leftItemAction)];
    //UIButton *cancelButton = self.editButtonItem;
    self.navigationItem.leftBarButtonItem =cancelButton;
    //self.timelabel.text = [self.getPassedItem valueForKey:@"timeStamp"];
}
-(void)setitem:(id)newItem
{


    if (self.getPassedItem != newItem) {
         self.getPassedItem = newItem;
        [self configview];

            }
}

-(void)configview
{
    if(self.getPassedItem){
        NSLog([self.getPassedItem description]);
        self.timelabel.text =[[self.getPassedItem valueForKey:@"timeStamp"] description];
        //self.timelabel.text=@"hello";
       // self.nameField.text =@"something";
        //[self.tableView reloadData];
    }
}

-(void)setContext:(id)context
{
    self.managedObjectContext = context;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.timelabel.text =[[self.getPassedItem valueForKey:@"timeStamp"] description];
    self.nameField.text =[[self.getPassedItem valueForKey:@"name"] description];
        self.numberField.text =[[self.getPassedItem valueForKey:@"number"] description];
}


-(void)leftItemAction
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil
    ];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)SaveBtn:(id)sender {
    [self.getPassedItem setValue:self.nameField.text forKey:@"name"];
    [self.getPassedItem setValue:self.numberField.text forKey:@"number"];
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Error on save:%@",[error localizedDescription]);
    }
    [self.navigationController dismissViewControllerAnimated:YES completion:nil
     ];
}

@end
