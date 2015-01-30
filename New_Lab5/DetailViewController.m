//
//  DetailViewController.m
//  New_Lab5
//
//  Created by yu on 14-4-24.
//  Copyright (c) 2014年 yu. All rights reserved.
//

#import "DetailViewController.h"
#import "EditTableViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

-(IBAction)uwindToDetail:(UIStoryboardSegue *)segue
{
    //In this method, retrieve the source view controller—the controller you’re unwinding from,
    EditTableViewController *source = [segue sourceViewController];
    self.detailItem  = source.getPassedItem;
    if(self.detailItem !=nil){
        self.dateLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
        self.nameLabel.text=[self.detailItem valueForKey:@"name"];
        self.numberLabel.text=[self.detailItem valueForKey:@"number"];
        //[self.tableView reloadData];
    }
}

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

-(void)getContext:(id)context
{
    self.managedObjectContext = context;
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {

        self.dateLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
        self.nameLabel.text=[self.detailItem valueForKey:@"name"];
         self.numberLabel.text=[self.detailItem valueForKey:@"number"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSArray *navigationControllers = [[segue destinationViewController] viewControllers];
    EditTableViewController *editViewController = [navigationControllers objectAtIndex:0];
    [editViewController setitem:self.detailItem];
    [editViewController setContext:self.managedObjectContext];
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}



@end
