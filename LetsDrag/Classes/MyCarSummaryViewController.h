//
//  MyCarSummaryViewController.h
//  LetsDrag
//
//  Created by andrew on 4/21/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarMake.h"
#import "CarModel.h"
#import "CarYear.h"
#import "CarData.h"

@interface MyCarSummaryViewController : UIViewController 
{
	id objectForChangingCar;
	SEL methodForChangingCar;
	CarMake *make;
	CarModel *model;
	CarYear *year;
	CarData *data;
	UILabel *makeModelLabel;
	//UILabel *modelLabel;
	UILabel *yearLabel;
	UIImageView *carImage;
	UILabel *horsePowerLabel;
	UILabel *torqueLabel;
	UILabel *zeroToSixtyLabel;
	UILabel *quarterMileLabel;
	
	UIView *largerView;
	UIScrollView *scrollView;
	UIActivityIndicatorView *activity;
	UILabel *imageNotDownloadedLabel;
	
	NSString *theUrl;
	BOOL dataDoneDownloading;
	BOOL downloadFailed;
	//NSMutableData *receivedData;
	long long dataDownloadingLength;
	long long currentDownloadedLength;
	
	NSFileHandle *writeDataToFileHandler;
	
	NSString *filePath;
	NSString *notificationName;
	NSURLConnection *theConnection;
	BOOL removedDataFile;
}

@property (readwrite, assign) CarMake *make;
@property (readwrite, assign) CarModel *model;
@property (readwrite, assign) CarYear *year;
@property (readwrite, assign) CarData *data;
@property (nonatomic, retain) IBOutlet UILabel *makeModelLabel;
//@property (nonatomic, retain) IBOutlet UILabel *modelLabel;
@property (nonatomic, retain) IBOutlet UILabel *yearLabel;
@property (nonatomic, retain) IBOutlet UILabel *horsePowerLabel;
@property (nonatomic, retain) IBOutlet UILabel *torqueLabel;
@property (nonatomic, retain) IBOutlet UILabel *zeroToSixtyLabel;
@property (nonatomic, retain) IBOutlet UILabel *quarterMileLabel;
@property (nonatomic, retain) IBOutlet UIImageView *carImage;
@property (nonatomic, retain) IBOutlet UIView *largerView;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (readwrite, assign) id objectForChangingCar;
@property (readwrite, assign) SEL methodForChangingCar;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activity;
@property (nonatomic, retain) IBOutlet UILabel *imageNotDownloadedLabel;

-(IBAction)changeYourCar:(id)sender;

@end
