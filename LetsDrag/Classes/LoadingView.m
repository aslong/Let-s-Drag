//
//  LoadingView.m
//  RocketronMobile
//
//  Created by andrew on 1/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LoadingView.h"


@implementation LoadingView

-(id)initWithView:(UIView *)viewToLoad
{
	backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewToLoad.frame.size.width, viewToLoad.frame.size.height)];
	backgroundView.backgroundColor = [UIColor colorWithRed:122 green:122 blue:122 alpha:.80];
	
	UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((viewToLoad.frame.size.width / 2) + 5 - (120 / 2), (viewToLoad.frame.size.height / 2) - (20 / 2), 15, 15)];
	spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
	[spinner startAnimating];
	
	UILabel *loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake((viewToLoad.frame.size.width / 2) + 10 - (120 / 2), (viewToLoad.frame.size.height / 2) - (20 / 2) - 3, 120, 20)];
	loadingLabel.text = @"Loading...";
	loadingLabel.textAlignment = UITextAlignmentCenter;
	loadingLabel.font = [UIFont boldSystemFontOfSize:16];
	loadingLabel.backgroundColor = [UIColor clearColor];
	loadingLabel.textColor = [UIColor grayColor];
	
	[backgroundView addSubview:spinner];
	[backgroundView addSubview:loadingLabel];
	[viewToLoad addSubview:backgroundView];
	
	backgroundView.hidden = YES;
	
	return self;
}

-(id)initWithWindow:(UIView *) window
{
	backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 450, 500)];
	backgroundView.backgroundColor = [UIColor colorWithRed:122 green:122 blue:122 alpha:.80];
	
	UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(100, 213, 15, 15)];
	spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
	[spinner startAnimating];
	
	UILabel *loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(105, 210, 120, 20)];
	loadingLabel.text = @"Loading...";
	loadingLabel.textAlignment = UITextAlignmentCenter;
	loadingLabel.font = [UIFont boldSystemFontOfSize:16];
	loadingLabel.backgroundColor = [UIColor clearColor];
	loadingLabel.textColor = [UIColor grayColor];
	
	[backgroundView addSubview:spinner];
	[backgroundView addSubview:loadingLabel];
	[window addSubview:backgroundView];
	
	backgroundView.hidden = YES;
	
	return self;
	
}

-(id)initWithWindowLandscape:(UIView *) window
{
	//backgroundView.transform = CGAffineTransformMakeRotation(90.0 * M_PI / 180.0);
	
	backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 480, 480)];
	backgroundView.backgroundColor = [UIColor colorWithRed:122 green:122 blue:122 alpha:.80];
	
	int down = 90;
	int left = 100;
	
	UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(100 + down, 213 + left, 15, 15)];
	spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
	[spinner startAnimating];
	
	UILabel *loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(105 + down, 210 + left, 120, 20)];
	loadingLabel.text = @"Loading...";
	loadingLabel.textAlignment = UITextAlignmentCenter;
	loadingLabel.font = [UIFont boldSystemFontOfSize:16];
	loadingLabel.backgroundColor = [UIColor clearColor];
	loadingLabel.textColor = [UIColor grayColor];
	
	backgroundView.transform = CGAffineTransformMakeRotation(90.0 * M_PI / 180.0);
	
	[backgroundView addSubview:spinner];
	[backgroundView addSubview:loadingLabel];
	[window addSubview:backgroundView];
	
	backgroundView.hidden = YES;
	
	//backgroundView = [self initWithNibName:@"LandscapeLoading" bundle:[NSBundle mainBundle]];
	[window addSubview:backgroundView];
	
	return self;
	
}

- (id)initWithLandscapeNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	LoadingView *landscape;
    if (landscape = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
	{
		backgroundView = landscape.view;
		
	}
	return backgroundView;
}

-(void)show
{
	backgroundView.hidden = NO;
}

-(void)hide
{
	backgroundView.hidden = YES;
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

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
    [super dealloc];
}


@end
