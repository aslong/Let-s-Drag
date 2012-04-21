//
//  UpdateUsersCars.h
//  LetsDrag
//
//  Created by andrew on 5/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyFullScreenProgressView.h"

@interface UpdateUsersCars : NSObject 
{
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
	
	MyFullScreenProgressView *progressView;
}

@property (readonly) NSString *filePath;
@property (readonly) MyFullScreenProgressView *progressView;

-(BOOL)downloadNewCars;
-(void)hideProgressBar;

@end
