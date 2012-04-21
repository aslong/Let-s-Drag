//
//  CarListingsModelTableViewController.m
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CarListingsModelTableViewController.h"
#import "OpponnentYearViewController.h"
#import "CarModel.h"
#import "CarYear.h"
#import "LetsDragAppDelegate.h"

@implementation CarListingsModelTableViewController

@synthesize mySuper;

- (id)initWithStyle:(UITableViewStyle)style andModelArray:(NSMutableArray *)newModelArray andMake:(CarMake *)newCarMake
{
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) 
	{
		make = [newCarMake retain];
		modelArray = [newModelArray retain];
		
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
	[modelArray sortUsingSelector:@selector(sort:)];
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
    return [modelArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	CarModel *temp = [modelArray objectAtIndex:indexPath.row];
	
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
	
	OpponnentYearViewController *yearViewController = [[OpponnentYearViewController alloc] initWithNibName:nil bundle:nil makeObject:make modelObject:[modelArray objectAtIndex:indexPath.row] andYearsArray:[self getYearDataArray:make andModel:((CarModel *)[modelArray objectAtIndex:indexPath.row])]];
	yearViewController.viewControllerHoldingNavigation = [mySuper viewControllerHoldingNavigation];
	//yearViewController.hidesBottomBarWhenPushed = YES;
	[[mySuper navigationController] pushViewController:yearViewController animated:YES];
	[yearViewController release];
	
	if ([[mySuper viewControllerHoldingNavigation] displayToolbar])
	{
		yearViewController.yearListingsTableViewController.view.frame = CGRectMake(0, 0, yearViewController.yearListingsTableViewController.view.frame.size.width, yearViewController.yearListingsTableViewController.view.frame.size.height - 45);
	}
	
	
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];

}

-(NSMutableArray *)getYearDataArray:(CarMake *)theMake andModel:(CarModel *)model
{
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	
	NSMutableArray *years = [shared getYearArraysForMake:theMake andModel:model];
	
	return years;
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
	[modelArray release];
    [super dealloc];
}

-(NSMutableArray *)testYearData:(int)makeID modelID:(int)modelID
{
	NSMutableArray *carYears = [[NSMutableArray alloc] init];
	
	
	if (makeID == 1)
	{
		if (modelID == 12)
		{
			CarYear *year1 = [[CarYear alloc] initWithDisplayName:@"2008" andYearID:2];			
			[carYears addObject:year1];
			
			[year1 release];
		}
		else if (modelID == 13)
		{
			CarYear *year1 = [[CarYear alloc] initWithDisplayName:@"2007" andYearID:3];			
			[carYears addObject:year1];
			
			[year1 release];
			
		}
		else if (modelID == 14)
		{
			CarYear *year1 = [[CarYear alloc] initWithDisplayName:@"2009" andYearID:1];			
			[carYears addObject:year1];
			
			[year1 release];
		}
	}
	
	if (makeID == 2)
	{
		if (modelID == 15)
		{
			CarYear *year1 = [[CarYear alloc] initWithDisplayName:@"2002" andYearID:6];			
			[carYears addObject:year1];
			
			[year1 release];
		}
		else if (modelID == 16)
		{
			CarYear *year1 = [[CarYear alloc] initWithDisplayName:@"2003" andYearID:5];			
			[carYears addObject:year1];
			
			[year1 release];
		}
		else if (modelID == 17)
		{
			CarYear *year1 = [[CarYear alloc] initWithDisplayName:@"2004" andYearID:4];			
			[carYears addObject:year1];
			
			[year1 release];
		}
	}
	
	
	
	return carYears;
}

@end

