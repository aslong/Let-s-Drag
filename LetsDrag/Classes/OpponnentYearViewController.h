//
//  OpponnentYearViewController.h
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarListingsYearTableViewController.h"
#import "CarModel.h"
#import "CarMake.h"

@interface OpponnentYearViewController : UIViewController 
{
	CarListingsYearTableViewController *yearListingsTableViewController;
	NSMutableArray *carYears;
	CarMake *make;
	CarModel *model;
	id viewControllerHoldingNavigation;
}

@property (readwrite, retain) CarMake *make;
@property (readwrite, retain) CarModel *model;
@property (readwrite, assign) id viewControllerHoldingNavigation;
@property (readwrite, retain) CarListingsYearTableViewController *yearListingsTableViewController;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil makeObject:(CarMake *)carMake modelObject:(CarModel *)carModel andYearsArray:(NSMutableArray *)newYearsArray;


@end
