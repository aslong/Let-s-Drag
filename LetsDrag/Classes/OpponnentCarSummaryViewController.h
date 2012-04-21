//
//  OpponnentCarSummaryViewController.h
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarModel.h"
#import "CarMake.h"
#import "CarYear.h"
#import "CarData.h"
#import <AVFoundation/AVFoundation.h>


@interface OpponnentCarSummaryViewController : UIViewController 
{
	id viewControllerHoldingNavigation;
	CarMake *make;
	CarModel *model;
	CarYear *year;
	CarData *carData;
	UILabel *yearLabel;
	UILabel *makeModelLabel;
	//UILabel *modelLabel;
	UILabel *horsePowerLabel;
	UILabel *torqueLabel;
	UILabel *zeroToSixtyLabel;
	UILabel *quarterMileLabel;
	UIButton *raceButton;
	UIButton *acceptCarButton;
	
	UIScrollView *scrollView;
	UIView *largerView;
	
	UIImageView *carImage;
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
	
	AVAudioPlayer *audio;
	
}

@property (readwrite, retain) CarMake *make;
@property (readwrite, retain) CarModel *model;
@property (readwrite, retain) CarYear *year;
@property (readwrite, retain) CarData *carData;
@property (nonatomic, retain) IBOutlet UILabel *yearLabel;
@property (nonatomic, retain) IBOutlet UILabel *makeModelLabel;
//@property (nonatomic, retain) IBOutlet UILabel *modelLabel;
@property (nonatomic, retain) IBOutlet UILabel *horsePowerLabel;
@property (nonatomic, retain) IBOutlet UILabel *torqueLabel;
@property (nonatomic, retain) IBOutlet UILabel *zeroToSixtyLabel;
@property (nonatomic, retain) IBOutlet UILabel *quarterMileLabel;
@property (nonatomic, retain) IBOutlet UIButton *raceButton;
@property (nonatomic, retain) IBOutlet UIButton *acceptCarButton;
@property (nonatomic, retain) IBOutlet UIImageView *carImage;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activity;
@property (nonatomic, retain) IBOutlet UILabel *imageNotDownloadedLabel;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIView *largerView;

@property (readwrite, assign) id viewControllerHoldingNavigation;

-(IBAction)acceptThisCar:(id)sender;
-(IBAction)shouldDragClicked:(id)sender;

@end
