//
//  CarListingsYearTableViewController.h
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarData.h"
#import "CarYear.h"

@interface CarListingsYearTableViewController : UITableViewController {
	NSMutableArray *yearArray;
	id mySuper;
}

@property (readwrite, assign) id mySuper;

- (id)initWithStyle:(UITableViewStyle)style andYearArray:(NSMutableArray *)newYearArray;
-(CarData *)getCarDataWithYear:(CarYear *)year;

@end
