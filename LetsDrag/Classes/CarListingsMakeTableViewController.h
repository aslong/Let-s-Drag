//
//  CarListingsMakeTableViewController.h
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarMake.h"

@interface CarListingsMakeTableViewController : UITableViewController 
{
	NSMutableArray *makeArray;
	id mySuper;
}

@property (readwrite, assign) id mySuper;

- (id)initWithStyle:(UITableViewStyle)style andMakeArray:(NSMutableArray *)newMakeArray;
-(NSMutableArray *)getModelData:(CarMake *)make;

@end
