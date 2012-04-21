//
//  CarListingsMakeTableViewController.m
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CarListingsMakeTableViewController.h"
#import "CarMake.h"
#import "CarModel.h"
#import "OpponnentModelViewController.h"
#import "LetsDragAppDelegate.h"
#import "LetsDragTableViewCells.h"

@implementation CarListingsMakeTableViewController

@synthesize mySuper;

- (id)initWithStyle:(UITableViewStyle)style andMakeArray:(NSMutableArray *)newMakeArray
{
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) 
	{
		makeArray = [newMakeArray retain];
    }
	
	self.tableView.backgroundColor = [UIColor blackColor];
	self.tableView.separatorColor = [UIColor whiteColor];
	self.tableView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	shared.makesTableView = self;
	
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	[makeArray sortUsingSelector:@selector(sort:)];
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
    return [makeArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
	LetsDragTableViewCells *cell = (LetsDragTableViewCells *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
	  cell = [[[LetsDragTableViewCells alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
	}
	
    /*UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }*/
	
	
	CarMake *temp = [makeArray objectAtIndex:indexPath.row];
	//[cell setTitle:temp.displayName];
	//UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 25)];
	//tempView.backgroundColor = [UIColor blackColor];
	//cell.backgroundView = tempView;
	//cell.backgroundColor = [UIColor blackColor];
	

	/*UIView* backgroundView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
	backgroundView.backgroundColor = [UIColor blackColor];
	cell.backgroundView = backgroundView;
	
	for ( UIView* view in cell.contentView.subviews ) 
	{
		view.backgroundColor = [UIColor clearColor];
	}*/
	
	
	//[cell setCellColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1]];
	
	cell.text = temp.displayName;
	cell.textColor = [UIColor whiteColor];
	cell.accessoryView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Chevron.png"]] autorelease];
	//cell.backgroundColor = [UIColor blueColor];
	
    // Set up the cell...

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
	OpponnentModelViewController *modelViewController = [[OpponnentModelViewController alloc] initWithNibName:nil bundle:nil makeObject:[makeArray objectAtIndex:indexPath.row] andModelsArray:[self getModelData:((CarMake *)[makeArray objectAtIndex:indexPath.row])]];
	modelViewController.viewControllerHoldingNavigation = [mySuper viewControllerHoldingNavigation];
	//modelViewController.hidesBottomBarWhenPushed = YES;
	
	if ([[mySuper viewControllerHoldingNavigation] displayToolbar])
	{
		modelViewController.modelListingsTableViewController.view.frame = CGRectMake(0, 0, modelViewController.modelListingsTableViewController.view.frame.size.width, modelViewController.modelListingsTableViewController.view.frame.size.height - 45);
	}
	
	[[mySuper navigationController] pushViewController:modelViewController animated:YES];
	[modelViewController release];
	
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSMutableArray *)getModelData:(CarMake *)make
{
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	
	NSMutableArray *models = [shared getModelArraysForMake:make];
	
	return models;
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
	[makeArray release];
    [super dealloc];
}

-(NSMutableArray *)testModelData:(int)makeID
{
	NSMutableArray *carModels = [[NSMutableArray alloc] init];
	
	
	if (makeID == 1)
	{
		CarModel *model1 = [[CarModel alloc] initWithDisplayName:@"RS4" andModelID:12];
		[carModels addObject:model1];
		
		[model1 release];
		
		model1 = [[CarModel alloc] initWithDisplayName:@"A4" andModelID:13];
		[carModels addObject:model1];
		
		[model1 release];
		
		model1 = [[CarModel alloc] initWithDisplayName:@"R8" andModelID:14];
		[carModels addObject:model1];
	}
	
	if (makeID == 2)
	{
		CarModel *model1 = [[CarModel alloc] initWithDisplayName:@"M3" andModelID:15];
		[carModels addObject:model1];
		
		[model1 release];
		
		model1 = [[CarModel alloc] initWithDisplayName:@"M5" andModelID:16];
		[carModels addObject:model1];
		
		[model1 release];
		
		model1 = [[CarModel alloc] initWithDisplayName:@"Z4" andModelID:17];
		[carModels addObject:model1];
	}
	
	
	
	return carModels;
}


@end

