//
//  OpponnentModelViewController.m
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "OpponnentModelViewController.h"


@implementation OpponnentModelViewController

@synthesize viewControllerHoldingNavigation, modelListingsTableViewController;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil makeObject:(CarMake *)carMake andModelsArray:(NSMutableArray *)newModelsArray
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
	{
		// Custom initialization
		carModels = [newModelsArray retain];
		make = [carMake retain];
		
		self.title = [NSString stringWithFormat:@"%@ Models", make.displayName];
        
		modelListingsTableViewController = [[CarListingsModelTableViewController alloc] initWithStyle:UITableViewStylePlain andModelArray:carModels andMake:make];
		modelListingsTableViewController.view.frame = CGRectMake(0, 0, modelListingsTableViewController.view.frame.size.width, modelListingsTableViewController.view.frame.size.height);
		modelListingsTableViewController.mySuper = self;
		[self.view addSubview:modelListingsTableViewController.tableView];
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
	[carModels release];
	[make release];
	[modelListingsTableViewController release];
    [super dealloc];
}


@end
