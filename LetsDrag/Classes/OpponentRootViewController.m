//
//  OpponentRootViewController.m
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "OpponentRootViewController.h"
#import "CarMake.h"
#import "CarModel.h"
#import "LetsDragAppDelegate.h"

@implementation OpponentRootViewController

@synthesize viewControllerHoldingNavigation, makeListingsTableViewController;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		self.view.backgroundColor = [UIColor greenColor];
		self.title = @"Makes";
		
		makeListingsTableViewController = [[CarListingsMakeTableViewController alloc] initWithStyle:UITableViewStylePlain andMakeArray:[self makeData]];
		makeListingsTableViewController.view.frame = CGRectMake(0, 0, makeListingsTableViewController.view.frame.size.width, makeListingsTableViewController.view.frame.size.height);
		makeListingsTableViewController.mySuper = self;
		[self.view addSubview:makeListingsTableViewController.tableView];
    }
    return self;
}
		
-(NSMutableArray *)testMakeData
{
	carMakes = [[NSMutableArray alloc] init];
	
	CarMake *make1 = [[CarMake alloc] initWithDisplayName:@"Audi" andMakeID:1];
	
	[carMakes addObject:make1];
	
	[make1 release];
	
	make1 = [[CarMake alloc] initWithDisplayName:@"BMW" andMakeID:2];
	
	[carMakes addObject:make1];
	
	[self writeMakeData];
	return carMakes;
}

-(NSMutableArray *)makeData
{
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	
	carMakes = shared.makes;
	
	return carMakes;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(void)writeMakeData
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	
    if (!documentsDirectory) 
	{
        NSLog(@"Documents directory not found!");
        //return NO;
    }
	
	NSString *fileLocation = [documentsDirectory stringByAppendingPathComponent:@"CarMakes.plst"];
	
	NSFileManager *fileManager = [[NSFileManager alloc] init];
	BOOL isDir = YES;
	if (![fileManager fileExistsAtPath:documentsDirectory isDirectory:&isDir])
	{
		[fileManager createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:nil];
	}
	
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:carMakes];
	[data writeToFile:fileLocation atomically:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[makeListingsTableViewController release];
    [super dealloc];
}


@end
