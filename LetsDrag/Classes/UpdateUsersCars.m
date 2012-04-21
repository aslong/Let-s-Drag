//
//  UpdateUsersCars.m
//  LetsDrag
//
//  Created by andrew on 5/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "UpdateUsersCars.h"
#import "LetsDragAppDelegate.h"


@implementation UpdateUsersCars

@synthesize filePath, progressView;

-(id)init
{
	if (self = [super init])
	{
		return self;
	}
	
	return nil;
}

-(void)showProgressBar
{
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	
	progressView = [[MyFullScreenProgressView alloc] initWithNibName:@"FullScreenProgressView" bundle:[NSBundle mainBundle]];
	
	[shared.window addSubview:progressView.view];
	
	//[progressView release];
}

-(void)hideProgressBar
{
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	
	[progressView hideProgressView];
}

-(BOOL)downloadNewCars
{
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	UIDevice *device = [UIDevice currentDevice];
	
	if (shared.localHost)
	{
		theUrl = [NSString stringWithFormat:@"http://127.0.0.1/~andrew/LetsDragBackend/UserManager.php?action=getLatestCars&uuid=%@&version=%@&numCars=%i", device.uniqueIdentifier, shared.version, [shared.allCars count]];
	}
	else
	{
		theUrl = [NSString stringWithFormat:@"http://www.hairymonkeysoftware.com/BackEndServer/LetsDrag/carList/UserManager.php?action=getLatestCars&uuid=%@&version=%@&numCars=%i", device.uniqueIdentifier, shared.version, [shared.allCars count]];
	}
	
	// create the request
	NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:theUrl]
												cachePolicy:NSURLRequestUseProtocolCachePolicy
											timeoutInterval:60.0];
	// create the connection with the request
	// and start loading the data
	theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
	writeDataToFileHandler = nil;
	dataDownloadingLength = 0;
	currentDownloadedLength = 0;
	if (theConnection) 
	{
		[self showProgressBar];
		
		[progressView performSelectorOnMainThread:@selector(setProgressLabel:) withObject:@"Downloading new cars" waitUntilDone:YES];
		[progressView performSelectorOnMainThread:@selector(setProgress:) withObject:[NSNumber numberWithDouble:.20] waitUntilDone:YES];
		
		// Create the NSMutableData that will hold
		// the received data
		// receivedData is declared as a method instance elsewhere
		//[receivedData release];
		//receivedData = [[NSMutableData data] retain];
		
		//notificationName = newNotificationName;
		
		filePath = [[shared getNextTempFileName] retain];
		removedDataFile = NO;
		
		downloadFailed = NO;
		//writeDataToFileStream = [[NSOutputStream alloc] initToFileAtPath:filePath append:YES];
		dataDoneDownloading = NO;
		[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
		return YES;
	} 
	else 
	{
		// inform the user that the download could not be made
		dataDoneDownloading = YES;
		downloadFailed = YES;
		return NO;
	}
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // this method is called when the server has determined that it
    // has enough information to create the NSURLResponse
	
    // it can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    // receivedData is declared as a method instance elsewhere
    //[receivedData setLength:0];
	[writeDataToFileHandler release];
	
	writeDataToFileHandler = [[NSFileHandle fileHandleForWritingAtPath:filePath] retain];
	[writeDataToFileHandler seekToEndOfFile];
	
	dataDownloadingLength = [response expectedContentLength];
	currentDownloadedLength = 0;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // append the new data to the receivedData
    // receivedData is declared as a method instance elsewhere
	currentDownloadedLength += [data length];
	// [receivedData appendData:data];
	[writeDataToFileHandler writeData:data];
	//[writeDataToFileStream write:(uint8_t *)[data bytes] maxLength:[data length]];
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    // release the connection, and the data object
    [theConnection release];
	theConnection = nil;
    // receivedData is declared as a method instance elsewhere
    //[receivedData release];
	
	dataDownloadingLength = 0;
	currentDownloadedLength = 0;
	dataDoneDownloading = YES;
	downloadFailed = YES;
	
    // inform the user
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
	
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
	
	[writeDataToFileHandler closeFile];
	[writeDataToFileHandler release];
	writeDataToFileHandler = nil;
	
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	[NSThread detachNewThreadSelector:@selector(updateToLatestCarsFailed) toTarget:shared withObject:nil];
	
	[self removeDataFile];
	[self hideProgressBar];
	
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // do something with the data
    // receivedData is declared as a method instance elsewhere
    //NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
	
	[writeDataToFileHandler closeFile];
	[writeDataToFileHandler release];
	writeDataToFileHandler = nil;
	
	currentDownloadedLength = dataDownloadingLength;
	dataDoneDownloading = YES;
	downloadFailed = NO;
	
    // release the connection, and the data object
    [theConnection release];
	theConnection = nil;
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
	
	[progressView performSelectorOnMainThread:@selector(setProgressLabel:) withObject:@"Done Downloading new cars" waitUntilDone:YES];
	[progressView performSelectorOnMainThread:@selector(setProgress:) withObject:[NSNumber numberWithFloat:.35] waitUntilDone:YES];
	
	LetsDragAppDelegate *shared = [[UIApplication sharedApplication] delegate];
	[NSThread detachNewThreadSelector:@selector(successfullyRetrievedNewCars) toTarget:shared withObject:nil];
	//[shared successfullyRetrievedNewCars];
	
}

-(void)cancelDownloading
{
	/*if (writeDataToFileHandler != nil)
	 {
	 [writeDataToFileHandler closeFile];
	 [writeDataToFileHandler release];
	 }*/
	
	[self removeDataFile];
	
	if (theConnection != nil)
	{
		[theConnection cancel];
	}
}

-(void)removeDataFile
{
	if (!removedDataFile)
	{
		NSFileManager *fileManager = [[NSFileManager alloc] init];
		
		[fileManager removeItemAtPath:filePath error:nil];
		
		[fileManager release];
		
		removedDataFile = YES;
	}
}

- (void)dealloc {
	if (!dataDoneDownloading)
	{
		[self cancelDownloading];
	}
    [super dealloc];
}

@end
