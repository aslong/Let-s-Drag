//
//  OpponnentCarSummaryViewController.m
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "OpponnentCarSummaryViewController.h"
#import "RaceResultsViewController.h"
#import "LetsDragAppDelegate.h"

@implementation OpponnentCarSummaryViewController

@synthesize viewControllerHoldingNavigation, make, model, year, carData, makeModelLabel,  yearLabel, horsePowerLabel, torqueLabel, zeroToSixtyLabel, quarterMileLabel, raceButton, acceptCarButton, activity, carImage, scrollView, largerView, imageNotDownloadedLabel;
//modelLabel,
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		self.title = @"Car Summary";
		
		audio = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"burnout" ofType:@"wav"]] error:nil];
		[audio prepareToPlay];
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
	
	
	makeModelLabel.text = [NSString stringWithFormat:@"%@ %@", make.displayName, model.displayName];
	//makeModelLabel.font = [UIFont systemFontOfSize:30];
	//modelLabel.text = model.displayName;
	//modelLabel.font = [UIFont systemFontOfSize:30];
	yearLabel.text = year.displayName;
	//yearLabel.font = [UIFont systemFontOfSize:30];
	horsePowerLabel.text = [NSString stringWithFormat:@"%i hp", carData.horsePower];
	torqueLabel.text = [NSString stringWithFormat:@"%i lbs.-ft", carData.torque];
	zeroToSixtyLabel.text = [NSString stringWithFormat:@"%1.1f secs", carData.zeroToSixty];
	imageNotDownloadedLabel.hidden = YES;
	imageNotDownloadedLabel.text = @"";
	
	if (carData.quarterMile < 1.0)
	{
		quarterMileLabel.text = @"Unavailable";
	}
	else
	{
		quarterMileLabel.text = [NSString stringWithFormat:@"%1.1f secs", carData.quarterMile];
	}
	
	activity.hidesWhenStopped = YES;
	[activity startAnimating];
	
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	
	UIImage *theCarImage = [shared returnImageForCarMake:make andModel:model andYear:year];
	
	if (theCarImage)
	{
		[activity stopAnimating];
		carImage.image = theCarImage;
		[theCarImage release];
		dataDoneDownloading = YES;
		imageNotDownloadedLabel.hidden = YES;
	}
	else
	{
		if (![self downloadImage])
		{
			[activity stopAnimating];
			imageNotDownloadedLabel.text = @"Image not available\nwithout internet connection";
			imageNotDownloadedLabel.hidden = NO;
		}
	}
	
	[scrollView addSubview:largerView];
	
	if ([viewControllerHoldingNavigation shouldDisplayRaceButton] == NO)
	{
		raceButton.hidden = NO;
		acceptCarButton.hidden = YES;
		[scrollView setContentSize:CGSizeMake(320, 550)];
	}
	else
	{
		raceButton.hidden = YES;
		acceptCarButton.hidden = NO;
		scrollView.frame = CGRectMake(scrollView.frame.origin.x, scrollView.frame.origin.y, scrollView.frame.size.width, scrollView.frame.size.height - 45);
		[scrollView setContentSize:CGSizeMake(320, 560)];
	}
	//[scrollView setContentSize:CGSizeMake(320, 440)];
	
}

/*-(void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	[scrollView addSubview:largerView];
	
	if ([viewControllerHoldingNavigation shouldDisplayRaceButton] == NO)
	{
		raceButton.hidden = NO;
		acceptCarButton.hidden = YES;
		[scrollView setContentSize:CGSizeMake(320, 440)];
	}
	else
	{
		raceButton.hidden = YES;
		acceptCarButton.hidden = NO;
		[scrollView setContentSize:CGSizeMake(320, 470)];
	}
}*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(IBAction)acceptThisCar:(id)sender
{	
	//NSArray *viewControllers = self.navigationController.viewControllers;
	[viewControllerHoldingNavigation dismissModalViewControllerAnimated:YES];
	
	NSMutableDictionary *car = [[NSMutableDictionary alloc] init];
	
	[car setObject:make forKey:@"make"];
	[car setObject:model forKey:@"model"];
	[car setObject:year forKey:@"year"];
	[car setObject:carData forKey:@"carData"];
	
	if ([viewControllerHoldingNavigation objectToCallWhenAcceptCar])
	{
		[[viewControllerHoldingNavigation objectToCallWhenAcceptCar] performSelector:[viewControllerHoldingNavigation methodToCallWhenAcceptCar] withObject:car];
	}
}

-(IBAction)shouldDragClicked:(id)sender
{
	
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	CarData *myData = shared.myData;
	
	if (myData == nil)
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"My Car Missing" message:@"Before racing you must\nfirst choose your car." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
		[alert show];
		[alert release];
		
		return;
	}
	
	NSMutableDictionary *car = [[NSMutableDictionary alloc] init];
	
	[car setObject:make forKey:@"make"];
	[car setObject:model forKey:@"model"];
	[car setObject:year forKey:@"year"];
	[car setObject:carData forKey:@"carData"];
	
	[audio play];
	
	RaceResultsViewController *raceResultsViewController = [[RaceResultsViewController alloc] initWithNibName:@"RaceResultsView" bundle:[NSBundle mainBundle] andCar:car];
	
	//carSummaryView.hidesBottomBarWhenPushed = YES;
	[[viewControllerHoldingNavigation myNavigationController] pushViewController:raceResultsViewController animated:YES];
	[raceResultsViewController release];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	if (!dataDoneDownloading)
	{
		[self cancelDownloading];
	}
	[carImage release];
	[audio release];
    [super dealloc];
}

-(BOOL)downloadImage
{
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	if (shared.localHost)
	{
		theUrl = [NSString stringWithFormat:@"http://127.0.0.1/~andrew/LetsDragBackend/CarManager.php?action=getImageForCar&specID=%i", carData.theID];
	}
	else
	{
		theUrl = [NSString stringWithFormat:@"http://www.hairymonkeysoftware.com/BackEndServer/LetsDrag/carList/CarManager.php?action=getImageForCar&specID=%i", carData.theID];
	}

	// create the request
	NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:theUrl]
												cachePolicy:NSURLRequestUseProtocolCachePolicy
											timeoutInterval:60.0];
	// create the connection with the request
	// and start loading the data
	theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
	writeDataToFileHandler = nil;
	dataDownloadingLength = 0;
	currentDownloadedLength = 0;
	if (theConnection) 
	{
		// Create the NSMutableData that will hold
		// the received data
		// receivedData is declared as a method instance elsewhere
		//[receivedData release];
		//receivedData = [[NSMutableData data] retain];
	
		//notificationName = newNotificationName;
	
		filePath = [[shared getNextTempFileName] retain];
		removedDataFile = NO;
	
		downloadFailed = NO;
		//writeDataToFileStream = [[NSOutputStream alloc] initToFileAtPath:filePath append:YES];
		dataDoneDownloading = NO;
		[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
		return YES;
	} 
	else 
	{
		// inform the user that the download could not be made
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Network Connection" message:@"To download car images you must be connected to the internet." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
		[alert show];
		[alert release];
		dataDoneDownloading = YES;
		downloadFailed = YES;
		return NO;
	}
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // this method is called when the server has determined that it
    // has enough information to create the NSURLResponse
	
    // it can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    // receivedData is declared as a method instance elsewhere
    //[receivedData setLength:0];
	[writeDataToFileHandler release];
	
	writeDataToFileHandler = [[NSFileHandle fileHandleForWritingAtPath:filePath] retain];
	[writeDataToFileHandler seekToEndOfFile];
	
	dataDownloadingLength = [response expectedContentLength];
	currentDownloadedLength = 0;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // append the new data to the receivedData
    // receivedData is declared as a method instance elsewhere
	currentDownloadedLength += [data length];
	// [receivedData appendData:data];
	[writeDataToFileHandler writeData:data];
	//[writeDataToFileStream write:(uint8_t *)[data bytes] maxLength:[data length]];
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    // release the connection, and the data object
    [theConnection release];
	theConnection = nil;
    // receivedData is declared as a method instance elsewhere
    //[receivedData release];
	
	dataDownloadingLength = 0;
	currentDownloadedLength = 0;
	dataDoneDownloading = YES;
	downloadFailed = YES;
	
    // inform the user
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
	
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
	
	[activity stopAnimating];
	[writeDataToFileHandler closeFile];
	[writeDataToFileHandler release];
	writeDataToFileHandler = nil;
	
	imageNotDownloadedLabel.text = @"Image not available\nwithout internet connection";
	imageNotDownloadedLabel.hidden = NO;
	[self removeDataFile];
	
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // do something with the data
    // receivedData is declared as a method instance elsewhere
    //NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
	
	[writeDataToFileHandler closeFile];
	[writeDataToFileHandler release];
	writeDataToFileHandler = nil;
	
	currentDownloadedLength = dataDownloadingLength;
	dataDoneDownloading = YES;
	downloadFailed = NO;
	
    // release the connection, and the data object
    [theConnection release];
	theConnection = nil;
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
	
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	[shared moveTempFileToCarImage:filePath usingCarMake:make carModel:model year:year];
	
	UIImage *theCarImage = [shared returnImageForCarMake:make andModel:model andYear:year];
	
	if (theCarImage)
	{
		[activity stopAnimating];
		carImage.image = theCarImage;
		[theCarImage release];
		imageNotDownloadedLabel.hidden = YES;
	}	
}

-(void)cancelDownloading
{
	/*if (writeDataToFileHandler != nil)
	 {
	 [writeDataToFileHandler closeFile];
	 [writeDataToFileHandler release];
	 }*/
	
	[self removeDataFile];
	
	if (theConnection != nil)
	{
		[activity stopAnimating];
		[theConnection cancel];
	}
}

-(void)removeDataFile
{
	if (!removedDataFile)
	{
		NSFileManager *fileManager = [[NSFileManager alloc] init];
		
		[fileManager removeItemAtPath:filePath error:nil];
		
		[fileManager release];
		
		removedDataFile = YES;
	}
}



@end
