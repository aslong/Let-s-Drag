//
//  OpponentViewController.m
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "OpponentViewController.h"
#import "OpponentRootViewController.h"


@implementation OpponentViewController

@synthesize myNavigationController, displayToolbar, objectToCallWhenAcceptCar, methodToCallWhenAcceptCar, shouldDisplayRaceButton;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
	{
        // Custom initialization
		shouldDisplayRaceButton = YES;
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
	OpponentRootViewController *rootView = [[OpponentRootViewController alloc] initWithNibName:nil bundle:nil];
	rootView.viewControllerHoldingNavigation = self;
	
	myNavigationController = [[UINavigationController alloc] initWithRootViewController:rootView];
	// Silver
	//myNavigationController.navigationBar.tintColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
	// Green
	//myNavigationController.navigationBar.tintColor = [UIColor colorWithRed:0/255.0 green:128/255.0 blue:0/255.0 alpha:1];
	//myNavigationController.navigationBar.tintColor = [UIColor colorWithRed:0/255.0 green:255/255.0 blue:0/255.0 alpha:1];
	// Blue
	//myNavigationController.navigationBar.tintColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:128/255.0 alpha:1];
	// Plum
	myNavigationController.navigationBar.tintColor = [UIColor colorWithRed:128/255.0 green:0/255.0 blue:128/255.0 alpha:1];
	// Cayenne
	//myNavigationController.navigationBar.tintColor = [UIColor colorWithRed:128/255.0 green:0/255.0 blue:0/255.0 alpha:1];


	myNavigationController.view.frame = CGRectMake(0, 0, myNavigationController.view.frame.size.width, myNavigationController.view.frame.size.height);
	
	[self.view addSubview:[myNavigationController view]];
	
	if (displayToolbar)
	{
		UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
		
		toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 415, 320, 45)];
		toolBar.tintColor = [UIColor colorWithRed:128/255.0 green:0/255.0 blue:128/255.0 alpha:1];
		//myNavigationController.navigationBar.tintColor = [UIColor colorWithRed:128/255.0 green:0/255.0 blue:128/255.0 alpha:1];
		[toolBar setItems:[NSArray arrayWithObjects:cancelButton, nil] animated:NO];
		[self.view addSubview:toolBar];
		
		rootView.makeListingsTableViewController.tableView.frame = CGRectMake(0, 0, rootView.makeListingsTableViewController.tableView.frame.size.width, rootView.makeListingsTableViewController.tableView.frame.size.height - 45);
	}
}

-(void)cancel
{
	[self dismissModalViewControllerAnimated:YES];
}

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
	[myNavigationController release];
    [super dealloc];
}


@end
