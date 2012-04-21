//
//  RequestCarViewController.m
//  LetsDrag
//
//  Created by Andrew Long on 6/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "RequestCarViewController.h"
#import "LetsDragAppDelegate.h"

#define kOFFSET_FOR_YEAR_KEYBOARD					0.0
#define kOFFSET_FOR_MAKE_KEYBOARD					0.0
#define kOFFSET_FOR_MODEL_KEYBOARD					40.0
#define kOFFSET_FOR_EMAIL_KEYBOARD					95.0
#define kOFFSET_FOR_NOTE_KEYBOARD					150.0

// http://www.hairymonkeysoftware.com/BackEndServer/LetsDrag/carList/RequestedCarManager.php?action=requestNewCar&version=1.1&year=2008&email=%20&make=%20&model=%20&note=sfdklj



@interface RequestCarViewController()

- (void)setViewMovedUp:(BOOL)movedUp andTextField:(UITextField *)textField;
-(void)withURLMakeRequest:(NSString *)theurl;

@end


@implementation RequestCarViewController

@synthesize yearTextField, modelTextField, makeTextField, noteTextField, emailTextField, hideKeyboardButton;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		movedUpViewForKeyboard = NO;
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
    [super view];
	//hideKeyboardButton.hidden = YES;
	yearTextField.delegate = self;
	modelTextField.delegate = self;
	makeTextField.delegate = self;
	noteTextField.delegate = self;
	emailTextField.delegate = self;
	self.view.backgroundColor = [UIColor blackColor];
	frameOrigin = self.view.frame;
}

-(void)viewDidDisappear:(BOOL)animated
{
	[self hideKeyboardClicked:nil];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (IBAction)requestCarClicked:(id)sender
{
	[self hideKeyboardClicked:nil];
	
	NSString *yearText = yearTextField.text;
	NSString *makeText = makeTextField.text;
	NSString *modelText = modelTextField.text;
	NSString *emailText = emailTextField.text;
	NSString *noteText = noteTextField.text;
	
	BOOL error = NO;
	
	if ([yearText length] < 2 || [yearText length] > 4)
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Request A Car Error" message:@"Year must be at least 2 characters and at max 4 characters long." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
		[alert show];
		[alert release];
		error = YES;
	}
	
	if ([makeText length] < 2)
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Request A Car Error" message:@"Make of car must be at least 2 characters long." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
		[alert show];
		[alert release];
		error = YES;
	}
	
	if ([modelText length] < 2)
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Request A Car Error" message:@"Model of car must be at least 2 characters long." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
		[alert show];
		[alert release];
		error = YES;
	}
	
	if (error)
	{
		return nil;
	}
	
	if ([emailText length] < 1)
	{
		emailText = @" ";
	}
	
	if ([noteText length] < 1)
	{
		noteText = @" ";
	}
	
	yearText = [yearText stringByReplacingOccurrencesOfString:@"&" withString:@"amp"];
	makeText = [makeText stringByReplacingOccurrencesOfString:@"&" withString:@"amp"];
	modelText = [modelText stringByReplacingOccurrencesOfString:@"&" withString:@"amp"];
	emailText = [emailText stringByReplacingOccurrencesOfString:@"&" withString:@"amp"];
	noteText = [noteText stringByReplacingOccurrencesOfString:@"&" withString:@"amp"];
	
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	
	NSString *url = [NSString stringWithFormat:@"http://www.hairymonkeysoftware.com/BackEndServer/LetsDrag/carList/RequestedCarManager.php?action=requestNewCar&version=%@&year=%@&email=%@&make=%@&model=%@&note=%@", shared.version, yearText, emailText, makeText, modelText, noteText];
	
	[shared showLoadingScreen];
	
	[NSThread detachNewThreadSelector:@selector(withURLMakeRequest:) toTarget:self withObject:url];
}

-(void)withURLMakeRequest:(NSString *)theurl
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	theurl = [theurl stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
	NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:theurl]
												cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
											timeoutInterval:60.0];
	
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
	NSData *response = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:nil error:nil];
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
	
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	[NSThread detachNewThreadSelector:@selector(hideLoadingScreen) toTarget:shared withObject:nil];
	
	if (response != nil)
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Request A Car" message:@"Your car request has been made successfully. Thank You." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
		[alert show];
		[alert release];
	}
	else
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Request A Car Error" message:@"There was an error making your car request. Please try again later or go to www.hairymonkeysoftware.com and request your car." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
		[alert show];
		[alert release];
	}
	
	[pool release];
}

- (IBAction)hideKeyboardClicked:(id)sender
{
	[yearTextField resignFirstResponder];
	[modelTextField resignFirstResponder];
	[makeTextField resignFirstResponder];
	[noteTextField resignFirstResponder];
	[emailTextField resignFirstResponder];
	[self setViewMovedUp:NO andTextField:nil];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
	return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	[self setViewMovedUp:YES andTextField:textField];
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[self hideKeyboardClicked:nil];
	return YES;
}

// Animate the entire view up or down, to prevent the keyboard from covering the author field.
- (void)setViewMovedUp:(BOOL)movedUp andTextField:(UITextField *)textField
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    // Make changes to the view's frame inside the animation block. They will be animated instead
    // of taking place immediately.
    CGRect rect = self.view.frame;
    if (movedUp)
	{
		//if (!movedUpViewForKeyboard)
		//{
			// If moving up, not only decrease the origin but increase the height so the view 
			// covers the entire screen behind the keyboard.
			if (textField == nil)
			{
				rect.origin.y = (frameOrigin.origin.y - 20) - kOFFSET_FOR_YEAR_KEYBOARD;
				rect.size.height += kOFFSET_FOR_YEAR_KEYBOARD;
			}
			else if (textField == yearTextField)
			{
				rect.origin.y = (frameOrigin.origin.y - 20) - kOFFSET_FOR_YEAR_KEYBOARD;
				rect.size.height += kOFFSET_FOR_YEAR_KEYBOARD;
				movedForYear = YES;
			}
			else if (textField == modelTextField)
			{
				rect.origin.y = (frameOrigin.origin.y - 20) - kOFFSET_FOR_MODEL_KEYBOARD;
				rect.size.height += kOFFSET_FOR_MODEL_KEYBOARD;
				movedForModel = YES;
			}
			else if (textField == makeTextField)
			{
				rect.origin.y = (frameOrigin.origin.y - 20) - kOFFSET_FOR_MAKE_KEYBOARD;
				rect.size.height += kOFFSET_FOR_MAKE_KEYBOARD;
				movedForMake = YES;
			}
			else if (textField == noteTextField)
			{
				rect.origin.y = (frameOrigin.origin.y - 20) - kOFFSET_FOR_NOTE_KEYBOARD;
				rect.size.height += kOFFSET_FOR_NOTE_KEYBOARD;
				movedForNote = YES;
			}
			else if (textField == emailTextField)
			{
				rect.origin.y = (frameOrigin.origin.y - 20) - kOFFSET_FOR_EMAIL_KEYBOARD;
				rect.size.height += kOFFSET_FOR_EMAIL_KEYBOARD;
				movedForEmail = YES;
			}
			
			//movedUpViewForKeyboard = YES;
		//}
    }
	else
	{
		//if (movedUpViewForKeyboard)
		//{
			// If moving down, not only increase the origin but decrease the height.
			if (textField == nil)
			{
				rect.origin.y = frameOrigin.origin.y - 20;
				rect.size.height = frameOrigin.size.height;
			}
			else if (textField == yearTextField)
			{
				rect.origin.y += kOFFSET_FOR_YEAR_KEYBOARD;
				rect.size.height -= kOFFSET_FOR_YEAR_KEYBOARD;
			}
			else if (textField == modelTextField)
			{
				rect.origin.y += kOFFSET_FOR_MODEL_KEYBOARD;
				rect.size.height -= kOFFSET_FOR_MODEL_KEYBOARD;
			}
			else if (textField == makeTextField)
			{
				rect.origin.y += kOFFSET_FOR_MAKE_KEYBOARD;
				rect.size.height -= kOFFSET_FOR_MAKE_KEYBOARD;
			}
			else if (textField == noteTextField)
			{
				rect.origin.y += kOFFSET_FOR_NOTE_KEYBOARD;
				rect.size.height -= kOFFSET_FOR_NOTE_KEYBOARD;
			}
			else if (textField == emailTextField)
			{
				rect.origin.y += kOFFSET_FOR_EMAIL_KEYBOARD;
				rect.size.height -= kOFFSET_FOR_EMAIL_KEYBOARD;
			}
			
		//	movedUpViewForKeyboard = NO;
		//}
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

- (void)dealloc {
    [super dealloc];
}


@end
