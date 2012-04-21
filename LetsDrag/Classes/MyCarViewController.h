//
//  MyCarViewController.h
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarMake.h"
#import "CarModel.h"
#import "CarYear.h"
#import "CarData.h"
#import "MyCarSummaryViewController.h"
#import "OpponentViewController.h"

@interface MyCarViewController : UIViewController 
{
	BOOL hasSelectedCar;
	CarMake *make;
	CarModel *model;
	CarYear *year;
	CarData *carData;
	UIButton *chooseCarButton;
	MyCarSummaryViewController *myCarSummaryViewController;
	OpponentViewController *chooseCarViewController;
	
	
}

@property (nonatomic, retain) IBOutlet UIButton *chooseCarButton;

-(BOOL)checkIfMyCarSelected;
-(IBAction)clickedSelectMyCar:(id)sender;
-(void)readMyCarData;
-(void)writeMyCarData;
-(void)changeMyCarTo:(NSMutableDictionary *)car;
-(void)swapToHasCarView;

@end
