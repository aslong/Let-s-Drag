//
//  OpponentRootViewController.h
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarListingsMakeTableViewController.h"


@interface OpponentRootViewController : UIViewController 
{
	CarListingsMakeTableViewController *makeListingsTableViewController;
	NSMutableArray *carMakes;
	id viewControllerHoldingNavigation;
}

@property (readwrite, assign) id viewControllerHoldingNavigation;
@property (readwrite, retain) CarListingsMakeTableViewController *makeListingsTableViewController;

@end
