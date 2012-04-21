//
//  LetsDragAppDelegate.h
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarMake.h"
#import "CarModel.h"
#import "CarYear.h"
#import "CarData.h"
#import "LoadingView.h"
#import "UpdateUsersCars.h"

#import "CarListingsMakeTableViewController.h"


@interface LetsDragAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	LoadingView *hud;
    UITabBarController *tabBarController;
	//UINavigationController *myNavigationController;
	CarMake *myMake;
	CarModel *myModel;
	CarYear *myYear;
	CarData *myData;
	NSMutableDictionary *allCars;
	
	NSMutableDictionary *carLayout;
	NSMutableArray *makes;
	NSMutableArray *models;
	NSMutableArray *years;
	NSMutableArray *specs;
	
	int nextTemp;
	BOOL localHost;
	
	NSString *version;
	
	UpdateUsersCars *updateCars;
	
	double timeLastUpdated;
	
	CarListingsMakeTableViewController *makesTableView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (readwrite, retain) CarMake *myMake;
@property (readwrite, retain) CarModel *myModel;
@property (readwrite, retain) CarYear *myYear;
@property (readwrite, retain) CarData *myData;
@property (readwrite, retain) NSMutableDictionary *carLayout;
@property (readwrite, retain) NSMutableArray *makes;
@property (readwrite, retain) NSMutableDictionary *allCars;
@property (readonly) NSString *version;
@property (readonly) BOOL localHost;
@property (readwrite, assign) CarListingsMakeTableViewController *makesTableView;
//@property (nonatomic, retain) IBOutlet UINavigationController *myNavigationController;

-(void)showLoadingScreen;
-(void)hideLoadingScreen;

-(BOOL)checkIfMyCarSelected;
-(void)readMyCarData;
-(void)readAllCars;
-(NSMutableDictionary *)returnDataForCarMake:(CarMake *)make andModel:(CarModel *)model andYear:(CarYear *)year;
-(NSMutableArray *)getModelArraysForMake:(CarMake *)make;
-(NSMutableArray *)getYearArraysForMake:(CarMake *)make andModel:(CarModel *)model;
-(NSMutableDictionary *)getArrayOfCarsFromXPathResult:(NSArray *)result;


-(void)prepFoldersForImageUsingCarMake:(CarMake *)make andModel:(CarModel *)model andYear:(CarYear *)year;
-(UIImage *)returnImageForCarMake:(CarMake *)make andModel:(CarModel *)model andYear:(CarYear *)year;
-(NSString *)pathForCarImageFile:(CarMake *)make andModel:(CarModel *)model andYear:(CarYear *)year;

-(void)updateToLatestCarsFailed;
-(void)successfullyRetrievedNewCars;
-(void)mergeNewCarsWithCurrentCars:(NSMutableDictionary *)newCars;

-(void)copyCarsFileIfNeeded;
-(void)copyImageFolderIfNeeded;

@end
