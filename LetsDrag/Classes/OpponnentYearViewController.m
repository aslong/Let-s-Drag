//
//  OpponnentYearViewController.m
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "OpponnentYearViewController.h"


@implementation OpponnentYearViewController

@synthesize viewControllerHoldingNavigation, make, model, yearListingsTableViewController;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil makeObject:(CarMake *)carMake modelObject:(CarModel *)carModel andYearsArray:(NSMutableArray *)newYearsArray
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
	{
        // Custom initialization
		// Custom initialization
		model = [carModel retain];
		make = [carMake retain];
		carYears = [newYearsArray retain];
		
		self.title = [NSString stringWithFormat:@"%@ %@ Years", make.displayName, model.displayName];
        
		yearListingsTableViewController = [[CarListingsYearTableViewController alloc] initWithStyle:UITableViewStylePlain andYearArray:carYears];
		yearListingsTableViewController.view.frame = CGRectMake(0, 0, yearListingsTableViewController.view.frame.size.width, yearListingsTableViewController.view.frame.size.height);
		yearListingsTableViewController.mySuper = self;
		[self.view addSubview:yearListingsTableViewController.tableView];
    }
    return self;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[model release];
	[make release];
	[carYears release];
	[yearListingsTableViewController release];
    [super dealloc];
}


@end
