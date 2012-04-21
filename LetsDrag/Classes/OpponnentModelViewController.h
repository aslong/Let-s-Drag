//
//  OpponnentModelViewController.h
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarListingsModelTableViewController.h"
#import "CarMake.h"

@interface OpponnentModelViewController : UIViewController {
	CarListingsModelTableViewController *modelListingsTableViewController;
	NSMutableArray *carModels;
	CarMake *make;
	id viewControllerHoldingNavigation;
}

@property (readwrite, assign) id viewControllerHoldingNavigation;
@property (readwrite, retain) CarListingsModelTableViewController *modelListingsTableViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil makeObject:(CarMake *)carMake andModelsArray:(NSMutableArray *)newModelsArray;

@end
