//
//  MyFullScreenProgressView.m
//  LetsDrag
//
//  Created by andrew on 5/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MyFullScreenProgressView.h"


@implementation MyFullScreenProgressView

@synthesize progressView, label;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
	{
        // Custom initialization
    }
    return self;
}

-(void)setProgressLabel:(NSString *)newText
{
	label.text = newText;
}

-(void)setProgress:(NSNumber *)newProgress
{
	progressView.progress = [newProgress floatValue];
}

-(void)hideProgressView
{
	[self.view removeFromSuperview];
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	progressView.progress = 0.0;
	label.text = @"";
	//self.view.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height);
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
