//
//  OpponentViewController.h
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OpponentViewController : UIViewController
{
	UINavigationController *myNavigationController;
	UIToolbar *toolBar;
	BOOL displayToolbar;
	
	id objectToCallWhenAcceptCar;
	SEL methodToCallWhenAcceptCar;
	
	BOOL shouldDisplayRaceButton;
}

@property (readwrite, assign) id objectToCallWhenAcceptCar;
@property (readwrite, assign) SEL methodToCallWhenAcceptCar;
@property (readwrite, assign) BOOL shouldDisplayRaceButton;
@property (readwrite, retain) UINavigationController *myNavigationController;
@property (readwrite) BOOL displayToolbar;

-(void)cancel;

@end
