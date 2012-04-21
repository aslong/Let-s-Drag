//
//  CarListingsYearTableViewController.m
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CarListingsYearTableViewController.h"
#import "CarMake.h"
#import "CarModel.h"
#import "CarYear.h"
#import "OpponnentCarSummaryViewController.h"
#import "LetsDragAppDelegate.h"

@implementation CarListingsYearTableViewController

@synthesize mySuper;

 - (id)initWithStyle:(UITableViewStyle)style andYearArray:(NSMutableArray *)newYearArray
{
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) 
	{
		yearArray = newYearArray;
		self.tableView.backgroundColor = [UIColor blackColor];
		self.tableView.separatorColor = [UIColor whiteColor];
		self.tableView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	[yearArray sortUsingSelector:@selector(sort:)];
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 50;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [yearArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	CarYear *temp = [yearArray objectAtIndex:indexPath.row];
	
	cell.text = temp.displayName;
	//cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.textColor = [UIColor whiteColor];
	cell.accessoryView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Chevron.png"]] autorelease];
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
	
	CarYear *year = [yearArray objectAtIndex:indexPath.row];
	
	OpponnentCarSummaryViewController *carSummaryView = [[OpponnentCarSummaryViewController alloc] initWithNibName:@"CarSummaryView" bundle:[NSBundle mainBundle]];
	carSummaryView.viewControllerHoldingNavigation = [mySuper viewControllerHoldingNavigation];
	carSummaryView.year = year;
	carSummaryView.model = (CarModel *)[mySuper model];
	carSummaryView.make = (CarMake *)[mySuper make];
	carSummaryView.carData = (CarData *)[self getCarDataWithYear:year];
	
	//carSummaryView.hidesBottomBarWhenPushed = YES;
	[[mySuper navigationController] pushViewController:carSummaryView animated:YES];
	[carSummaryView release];
	
	
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CarData *)getCarDataWithYear:(CarYear *)year
{
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	
	NSMutableDictionary *car = [shared returnDataForCarMake:(CarMake *)[mySuper make] andModel:(CarModel *)[mySuper model] andYear:year];
	
	return (CarData *)[car objectForKey:@"carData"];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
    [super dealloc];
}


@end

