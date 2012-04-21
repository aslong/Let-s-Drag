//
//  MyCarViewController.m
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MyCarViewController.h"
#import "LetsDragAppDelegate.h"

@implementation MyCarViewController

@synthesize chooseCarButton;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
	{
        // Custom initialization

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
	
	hasSelectedCar = [self checkIfMyCarSelected];
	
	if (hasSelectedCar)
	{
		[self readMyCarData];
		[self swapToHasCarView];
	}
}

-(void)swapToHasCarView
{
	chooseCarButton.hidden = YES;
	
	myCarSummaryViewController = [[MyCarSummaryViewController alloc] initWithNibName:@"MyCarSummaryView" bundle:[NSBundle mainBundle]];
	myCarSummaryViewController.objectForChangingCar = self;
	myCarSummaryViewController.methodForChangingCar = @selector(clickedSelectMyCar:);
	myCarSummaryViewController.year = year;
	myCarSummaryViewController.model = model;
	myCarSummaryViewController.make = make;
	myCarSummaryViewController.data = carData;
	[self.view addSubview:myCarSummaryViewController.view];
}

-(IBAction)clickedSelectMyCar:(id)sender
{	
	if (!chooseCarViewController)
	{
		chooseCarViewController = [[OpponentViewController alloc] initWithNibName:@"OpponentViewController" bundle:[NSBundle mainBundle]];
	
	
	chooseCarViewController.displayToolbar = YES;
	chooseCarViewController.objectToCallWhenAcceptCar = self;
	chooseCarViewController.methodToCallWhenAcceptCar = @selector(changeMyCarTo:);
	chooseCarViewController.shouldDisplayRaceButton = YES;
	
	}
	[chooseCarViewController viewDidLoad];
	//[self presentModalViewController:chooseCarViewController animated:NO];
	//[chooseCarViewController dismissModalViewControllerAnimated:YES];
	[self presentModalViewController:chooseCarViewController animated:YES];
	[chooseCarViewController viewDidLoad];
	
}

-(BOOL)checkIfMyCarSelected
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	
    if (!documentsDirectory) 
	{
        NSLog(@"Documents directory not found!");
        //return NO;
    }
	
	NSString *fileLocation = [documentsDirectory stringByAppendingPathComponent:@"MyCar.plst"];
	
	NSFileManager *fileManager = [[NSFileManager alloc] init];
	BOOL isDir = NO;
	
	return [fileManager fileExistsAtPath:fileLocation isDirectory:&isDir];
}

-(void)readMyCarData
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	
    if (!documentsDirectory) 
	{
        NSLog(@"Documents directory not found!");
        //return NO;
    }
	
	NSString *fileLocation = [documentsDirectory stringByAppendingPathComponent:@"MyCar.plst"];
	
	NSData* data = [NSData dataWithContentsOfFile:fileLocation];
	NSMutableDictionary *car = [NSKeyedUnarchiver unarchiveObjectWithData:data];
	
	year = [car objectForKey:@"year"];
	make = [car objectForKey:@"make"];
	model = [car objectForKey:@"model"];
	carData = [car objectForKey:@"carData"];
	
	[year retain];
	[make retain];
	[model retain];
	[carData retain];
	
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	shared.myMake = make;
	shared.myModel = model;
	shared.myYear = year;
	shared.myData = carData;
}

-(void)writeMyCarData
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	
    if (!documentsDirectory) 
	{
        NSLog(@"Documents directory not found!");
        //return NO;
    }
	
	NSString *fileLocation = [documentsDirectory stringByAppendingPathComponent:@"MyCar.plst"];
	
	NSMutableDictionary *toWrite = [[NSMutableDictionary alloc] init];
	[toWrite setObject:year forKey:@"year"];
	[toWrite setObject:make forKey:@"make"];
	[toWrite setObject:model forKey:@"model"];
	[toWrite setObject:carData forKey:@"carData"];
	
	NSData *data = [NSKeyedArchiver archivedDataWithRootObject:toWrite];
	[data writeToFile:fileLocation atomically:YES];
	
	[toWrite release];
	
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	shared.myMake = make;
	shared.myModel = model;
	shared.myYear = year;
	shared.myData = carData;
}

-(void)changeMyCarTo:(NSMutableDictionary *)car
{	
	make = [car objectForKey:@"make"];
	model = [car objectForKey:@"model"];
	year = [car objectForKey:@"year"];
	carData = [car objectForKey:@"carData"];
	
	[make retain];
	[model retain];
	[year retain];
	[carData retain];
	
	[self writeMyCarData];
	[self swapToHasCarView];
	
	
	[car release];
	
	//NSLog(@"Year - %@", year.displayName);
	//NSLog(@"Make - %@", make.displayName);
	//NSLog(@"Model - %@", model.displayName);

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
    [super dealloc];
}


@end
