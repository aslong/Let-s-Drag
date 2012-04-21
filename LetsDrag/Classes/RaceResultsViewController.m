//
//  RaceResultsViewController.m
//  LetsDrag
//
//  Created by andrew on 4/21/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "RaceResultsViewController.h"
#import "CarYear.h"
#import "CarModel.h"
#import "CarData.h"
#import "CarModel.h"
#import "LetsDragAppDelegate.h"


@implementation RaceResultsViewController

@synthesize viewControllerHoldingNavigation, car, winLoseLabel, winView, loseView, tieView, loadingView;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andCar:(NSMutableDictionary *)newCar
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		self.title = @"Race Results";
		car = newCar;
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	winView.hidden = YES;
	tieView.hidden = YES;
	loseView.hidden = YES;
	
	[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(calculateWinOrLose) userInfo:nil repeats:NO];
	//[self calculateWinOrLose];
	
}

-(void)calculateWinOrLose
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.7];
	loadingView.alpha = 0;
	
	
	[UIView commitAnimations];
	
	loadingView.hidden = YES;
	
	CarMake *make = (CarMake *)[car objectForKey:@"make"];
	CarModel *model = (CarModel *)[car objectForKey:@"model"];
	CarYear *year = (CarYear *)[car objectForKey:@"year"];
	CarData *data = (CarData *)[car objectForKey:@"carData"];
	
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	CarMake *myMake = shared.myMake;
	CarModel *myModel = shared.myModel;
	CarYear *myYear = shared.myYear;
	CarData *myData = shared.myData;
	
	if (data.zeroToSixty < myData.zeroToSixty)
	{
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:.7];
		
		
		
		//return @"You Will Lose";
		winView.hidden = YES;
		tieView.hidden = YES;
		loseView.hidden = NO;
		
		audio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"boo" ofType:@"wav"]] error:nil];
		[audio play];
		
		[UIView commitAnimations];
	}
	else if (data.zeroToSixty > myData.zeroToSixty)
	{
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:.7];
		
		//return @"You Will Win";
		winView.hidden = NO;
		tieView.hidden = YES;
		loseView.hidden = YES;
		
		audio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cheering" ofType:@"wav"]] error:nil];
		[audio play];
		
		[UIView commitAnimations];
	}
	else
	{
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:.7];
		//return @"You Will Tie";
		winView.hidden = YES;
		tieView.hidden = NO;
		loseView.hidden = YES;
		
		audio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"aww" ofType:@"wav"]] error:nil];
		[audio play];
		
		[UIView commitAnimations];
	}
	
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
	[audio release];
    [super dealloc];
}


@end
