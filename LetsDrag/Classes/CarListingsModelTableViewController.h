//
//  CarListingsModelTableViewController.h
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarMake.h"

@interface CarListingsModelTableViewController : UITableViewController {
	NSMutableArray *modelArray;
	id mySuper;
	CarMake *make;
}

@property (readwrite, assign) id mySuper;

- (id)initWithStyle:(UITableViewStyle)style andModelArray:(NSMutableArray *)newModelArray andMake:(CarMake *)newCarMake;

@end
