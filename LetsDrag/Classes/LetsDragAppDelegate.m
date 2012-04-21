//
//  LetsDragAppDelegate.m
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "LetsDragAppDelegate.h"
#import "XPathQuery.h";


@implementation LetsDragAppDelegate

@synthesize window;
@synthesize tabBarController, myMake, myModel, myYear, myData, carLayout, makes, localHost, version, makesTableView, allCars;
//@synthesize myNavigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application 
{
	nextTemp = 0;
	localHost = NO;
	version = @"1.1";
    
	myMake = nil;
	myModel = nil;
	myYear = nil;
	myData = nil;
	
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
	
	hud = [[LoadingView alloc] initWithWindow:window];
	[self hideLoadingScreen];
	
	//[self createFileForInitialCarData];
	[self copyCarsFileIfNeeded];
	[self readAllCars];
	
	
	if ([self checkIfMyCarSelected])
	{
		[self readMyCarData];
	}
	else
	{
		tabBarController.selectedIndex = 1;
	}
	
	[self loadLastUpdatedTime];
	
	NSDate *now = [NSDate date];
	double unixTime = [now timeIntervalSince1970];
	
	double timeSinceLastUpdated = unixTime - timeLastUpdated;
	
	if (timeSinceLastUpdated > (60 * 60 * 24))// * 7))
	{
		timeLastUpdated = unixTime;
		[self updateToLatestCars];
		[self writeLastUpdatedTime];
	}
	
	//[self writeTestCarData];
}

-(void)loadLastUpdatedTime
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	
    if (!documentsDirectory) 
	{
        NSLog(@"Documents directory not found!");
        //return NO;
    }
	
	NSString *fileLocation = [documentsDirectory stringByAppendingPathComponent:@"cul.data"];
	
	NSString *tempString = [[NSString alloc] initWithContentsOfFile:fileLocation encoding:NSASCIIStringEncoding error:nil];
	if (tempString)
	{
		timeLastUpdated = [tempString doubleValue];
	
		[tempString release];
	}
	
}

-(void)copyCarsFileIfNeeded
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	
    if (!documentsDirectory) 
	{
        NSLog(@"Documents directory not found!");
        //return NO;
    }
	
	NSString *fileLocation = [documentsDirectory stringByAppendingPathComponent:@"Cars.plst"];
	NSFileManager *fileManager = [[NSFileManager alloc] init];
	BOOL isDir = NO;
	
	if ([fileManager fileExistsAtPath:fileLocation isDirectory:&isDir])
	{
		return;
	}
	else
	{
		NSString *fileToCopy = [[NSBundle mainBundle] pathForResource:@"Cars" ofType:@"plst"];
		[fileManager copyItemAtPath:fileToCopy toPath:fileLocation error:nil];
	}
}

-(void)writeLastUpdatedTime
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	
    if (!documentsDirectory) 
	{
        NSLog(@"Documents directory not found!");
        //return NO;
    }
	
	NSString *fileLocation = [documentsDirectory stringByAppendingPathComponent:@"cul.data"];
	
	NSString *lastUpdated = [[NSString alloc] initWithFormat:@"%f", timeLastUpdated];
	[lastUpdated writeToFile:fileLocation atomically:YES encoding:NSASCIIStringEncoding error:nil];
	[lastUpdated release];
}

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/

-(void)readAllCars
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	
    if (!documentsDirectory) 
	{
        NSLog(@"Documents directory not found!");
        //return NO;
    }
	
	//NSString *fileLocation = [documentsDirectory stringByAppendingPathComponent:@"AllCars.plst"];
	NSString *fileLocation = [documentsDirectory stringByAppendingPathComponent:@"Cars.plst"];
	
	NSData* data = [NSData dataWithContentsOfFile:fileLocation];
	allCars = [[NSKeyedUnarchiver unarchiveObjectWithData:data] retain];
	
	NSArray *keys = [allCars allKeys];
	BOOL foundMake = NO;
	BOOL foundYear = NO;
	
	carLayout = [[NSMutableDictionary alloc] init];
	makes = [[NSMutableArray alloc] init];
	models = [[NSMutableArray alloc] init];
	years = [[NSMutableArray alloc] init];
	specs = [[NSMutableArray alloc] init];
	
	int j;
	for (j = 0; j < [keys count]; j++) 
	{
		NSMutableDictionary *car = [allCars objectForKey:[keys objectAtIndex:j]];
		
		CarYear *year = [car objectForKey:@"year"];
		CarMake *make = [car objectForKey:@"make"];
		CarModel *model = [car objectForKey:@"model"];
		CarData *carData = [car objectForKey:@"carData"];
		
		int i;
		foundMake = NO;
		
		NSArray *carLayoutKeys = [carLayout allKeys];
		for (i = 0; i < [carLayoutKeys count]; i++)
		{
			NSString *tempMake = [carLayoutKeys objectAtIndex:i];
			
			if ([tempMake isEqualToString:[NSString stringWithFormat:@"%i", make.makeID]])
			{
				foundMake = YES;
			}
		}
		
		if (!foundMake)
		{
			NSMutableDictionary *tempMakes = [[NSMutableDictionary alloc] init];
			[tempMakes setObject:[[NSMutableArray alloc] init] forKey:[NSString stringWithFormat:@"%i", model.modelID]];
			
			NSMutableArray *tempYears = [tempMakes objectForKey:[NSString stringWithFormat:@"%i", model.modelID]];
			[tempYears addObject:[NSString stringWithFormat:@"%i", year.yearID]];
			
			[carLayout setObject:tempMakes forKey:[NSString stringWithFormat:@"%i", make.makeID]];
			
			[makes addObject:make];
			[models addObject:model];
			[specs addObject:carData];
			
			foundYear = NO;
			
			int yearI;
			for (yearI = 0; yearI < [years count]; yearI++)
			{
				CarYear *tmpYear = [years objectAtIndex:yearI];
				
				if (tmpYear.yearID == year.yearID)
				{
					foundYear = YES;
				}
			}
			
			if (!foundYear)
			{
				[years addObject:year];
			}
			
						
			foundMake = NO;
		}
		else
		{
			
			NSMutableDictionary *tempMakes = [carLayout objectForKey:[NSString stringWithFormat:@"%i", make.makeID]];
			
			NSMutableArray *tempYears = [tempMakes objectForKey:[NSString stringWithFormat:@"%i", model.modelID]];
			
			if (tempYears == nil)
			{
				[tempMakes setObject:[[NSMutableArray alloc] init] forKey:[NSString stringWithFormat:@"%i", model.modelID]];
				tempYears = [tempMakes objectForKey:[NSString stringWithFormat:@"%i", model.modelID]];
			}
			
			[tempYears addObject:[NSString stringWithFormat:@"%i", year.yearID]];
			
			BOOL foundModel = NO;
			int mo;
			for (mo = 0; mo < [models count]; mo++)
			{
				CarModel *tempModel = [models objectAtIndex:mo];
				
				if (tempModel.modelID == model.modelID)
				{
					foundModel = YES;
					break;
				}
			}
			
			if (!foundModel)
			{
				[models addObject:model];
			}
			
			[specs addObject:carData];
			
			foundYear = NO;
			
			int yearI;
			for (yearI = 0; yearI < [years count]; yearI++)
			{
				CarYear *tmpYear = [years objectAtIndex:yearI];
				
				if (tmpYear.yearID == year.yearID)
				{
					foundYear = YES;
				}
			}
			
			if (!foundYear)
			{
				[years addObject:year];
			}
			
		}
		
		
	}
}

-(BOOL)checkIfMyCarSelected
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	
    if (!documentsDirectory) 
	{
        NSLog(@"Documents directory not found!");
        //return NO;
    }
	
	NSString *fileLocation = [documentsDirectory stringByAppendingPathComponent:@"MyCar.plst"];
	
	NSFileManager *fileManager = [[NSFileManager alloc] init];
	BOOL isDir = NO;
	
	return [fileManager fileExistsAtPath:fileLocation isDirectory:&isDir];
}

-(void)readMyCarData
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	
    if (!documentsDirectory) 
	{
        NSLog(@"Documents directory not found!");
        //return NO;
    }
	
	NSString *fileLocation = [documentsDirectory stringByAppendingPathComponent:@"MyCar.plst"];
	
	NSData* data = [NSData dataWithContentsOfFile:fileLocation];
	NSMutableDictionary *car = [NSKeyedUnarchiver unarchiveObjectWithData:data];
	
	CarYear *year = [car objectForKey:@"year"];
	CarMake *make = [car objectForKey:@"make"];
	CarModel *model = [car objectForKey:@"model"];
	CarData *carData = [car objectForKey:@"carData"];
	
	[year retain];
	[make retain];
	[model retain];
	[carData retain];
	
	myMake = make;
	myModel = model;
	myYear = year;
	myData = carData;
}

-(NSMutableArray *)getModelArraysForMake:(CarMake *)make
{
	NSMutableDictionary *modelIDs = [carLayout objectForKey:[NSString stringWithFormat:@"%i", make.makeID]];
	
	NSArray *modelKeys = [modelIDs allKeys];
	
	NSMutableArray *toReturn = [[NSMutableArray alloc] init];
	
	int i;
	for (i = 0; i < [models count]; i++)
	{
		CarModel *tempModel = [models objectAtIndex:i];
		int j;
		for (j = 0; j < [modelKeys count]; j++)
		{
			int modelKey = [[modelKeys objectAtIndex:j] intValue];
			if (tempModel.modelID == modelKey)
			{
				[toReturn addObject:tempModel];
				break;
			}
		}
	}
	
	return toReturn;
}

-(NSMutableArray *)getYearArraysForMake:(CarMake *)make andModel:(CarModel *)model
{
	NSMutableDictionary *modelIDs = [carLayout objectForKey:[NSString stringWithFormat:@"%i", make.makeID]];

	NSMutableArray *yearArray = [modelIDs objectForKey:[NSString stringWithFormat:@"%i", model.modelID]];
	
	NSMutableArray *toReturn = [[NSMutableArray alloc] init];
	
	int i;
	for (i = 0; i < [years count]; i++)
	{
		CarYear *tempYear = [years objectAtIndex:i];
		
		int j;
		for (j = 0; j < [yearArray count]; j++)
		{
			int yearKey = [[yearArray objectAtIndex:j] intValue];
			if (tempYear.yearID == yearKey)
			{
				[toReturn addObject:tempYear];
				break;
			}
		}
	}
	
	return toReturn;
}

-(NSMutableDictionary *)returnDataForCarMake:(CarMake *)make andModel:(CarModel *)model andYear:(CarYear *)year
{
	NSMutableDictionary *toReturn = [allCars objectForKey:[NSString stringWithFormat:@"%iModel%iMake%iYear", model.modelID, make.makeID, year.yearID]];	
	
	return toReturn;
}

-(void)prepFoldersForImageUsingCarMake:(CarMake *)make andModel:(CarModel *)model andYear:(CarYear *)year
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	NSString *documentsDirectory = [paths objectAtIndex:0];
	
	NSString *folderPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"/Images/%@/%i/%@", make.displayName, model.modelID, year.displayName]];
	
	NSFileManager *fileManager = [[NSFileManager alloc] init];
	BOOL isDir = YES;
	if (![fileManager fileExistsAtPath:folderPath isDirectory:&isDir])
	{
		[fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
	}
	
	[fileManager release];
}

-(UIImage *)returnImageForCarMake:(CarMake *)make andModel:(CarModel *)model andYear:(CarYear *)year
{
	NSString *carImagePath = [self pathForCarImageFile:make andModel:model andYear:year];
	
	UIImage *toReturn;
	
	NSFileManager *fileManager = [[NSFileManager alloc] init];
	
	if ([fileManager fileExistsAtPath:carImagePath])
	{
		toReturn = [[UIImage alloc] initWithContentsOfFile:carImagePath];
	}
	else
	{
		toReturn = nil;
	}
	
	[fileManager release];
	
	return toReturn;
}

-(NSString *)pathForCarImageFile:(CarMake *)make andModel:(CarModel *)model andYear:(CarYear *)year
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	NSString *documentsDirectory = [paths objectAtIndex:0];
	
	return [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"/Images/%@/%i/%@/%@%@%i.jpg", make.displayName, model.modelID, year.displayName, year.displayName, make.displayName, model.modelID]];//[NSString stringWithFormat:@"%@/Ads/Images/%@.png", userInfo.sessionID, ad.theID]];	
}

- (void)dealloc {
	
    [tabBarController release];
    [window release];
    [super dealloc];
}

- (void)applicationWillTerminate:(UIApplication *)application 
{
	[self deleteTempFolder];
}

-(void)updateToLatestCars
{
	updateCars = [[UpdateUsersCars alloc] init];
	
	if (![updateCars downloadNewCars])
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Network Connection" message:@"To update car listings you must be connected to the internet." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
		[alert show];
		[alert release];
	}
}

-(void)updateToLatestCarsFailed
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Network Connection" message:@"To update car listings you must be connected to the internet." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
	[alert show];
	[alert release];
	
	[updateCars hideProgressBar];
	[updateCars release];
}

-(void)successfullyRetrievedNewCars
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	NSData *tempData = [NSData dataWithContentsOfFile:updateCars.filePath];
	
	if ([tempData length] > 3)
	{
		[updateCars.progressView performSelectorOnMainThread:@selector(setProgressLabel:) withObject:@"Parsing new cars" waitUntilDone:YES];
		[updateCars.progressView performSelectorOnMainThread:@selector(setProgress:) withObject:[NSNumber numberWithDouble:.50] waitUntilDone:YES];
		
		NSArray *xmlQuery = PerformXMLXPathQuery(tempData, @"//car");
		
		NSMutableDictionary *newCars = [self getArrayOfCarsFromXPathResult:xmlQuery];
		
		[updateCars.progressView performSelectorOnMainThread:@selector(setProgressLabel:) withObject:[NSString stringWithFormat:@"Adding %i new cars", [newCars count]] waitUntilDone:YES];
		[updateCars.progressView performSelectorOnMainThread:@selector(setProgress:) withObject:[NSNumber numberWithDouble:.75] waitUntilDone:YES];
		
		[self mergeNewCarsWithCurrentCars:newCars];
		
		[updateCars.progressView performSelectorOnMainThread:@selector(setProgressLabel:) withObject:@"Cars added successfully" waitUntilDone:YES];
		[updateCars.progressView performSelectorOnMainThread:@selector(setProgress:) withObject:[NSNumber numberWithDouble:1.0] waitUntilDone:YES];
	}
	else
	{
		[updateCars.progressView performSelectorOnMainThread:@selector(setProgressLabel:) withObject:@"No new cars" waitUntilDone:YES];
		[updateCars.progressView performSelectorOnMainThread:@selector(setProgress:) withObject:[NSNumber numberWithDouble:1.0] waitUntilDone:YES];
	}
	
	[updateCars hideProgressBar];
	[updateCars removeDataFile];
	[updateCars release];
	
	[pool release];
}

-(void)mergeNewCarsWithCurrentCars:(NSMutableDictionary *)newCars
{
	NSArray *keys = [newCars allKeys];
	
	int i;
	
	for (i = 0; i < [keys count]; i++)
	{
		NSMutableDictionary *car = [newCars objectForKey:[keys objectAtIndex:i]];
		
		CarYear *year = [car objectForKey:@"year"];
		CarMake *make = [car objectForKey:@"make"];
		CarModel *model = [car objectForKey:@"model"];
		
		[allCars setObject:car forKey:[NSString stringWithFormat:@"%iModel%iMake%iYear", model.modelID, make.makeID, year.yearID]];
	}
		
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
		
	if (!documentsDirectory) 
	{
		NSLog(@"Documents directory not found!");
		//return NO;
	}
		
	NSString *fileLocation = [documentsDirectory stringByAppendingPathComponent:@"Cars.plst"];
		
	NSData *data = [NSKeyedArchiver archivedDataWithRootObject:allCars];
	[data writeToFile:fileLocation atomically:YES];
		
	[allCars release];
	[carLayout release];
	[makes release];
	[models release];
	[years release];
	[specs release];
		
	[self readAllCars];
	
	if (makesTableView != nil)
	{
		[makesTableView.tableView reloadData];
	}
}

-(void)createFileForInitialCarData
{
	NSData *xmlData;
	
	if (localHost)
	{
		xmlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://127.0.0.1/~andrew/LetsDragBackend/CarManager.php?action=getAllCarsForVersion&version=1.0"]];
	}
	else
	{
		xmlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.hairymonkeysoftware.com/BackEndServer/LetsDrag/carList/CarManager.php?action=getAllCarsForVersion&version=1.0"]];
	}
	
	NSArray *xmlQuery = PerformXMLXPathQuery(xmlData, @"//car");
	NSMutableDictionary *cars = [self getArrayOfCarsFromXPathResult:xmlQuery];
	
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
	
    if (!documentsDirectory) 
	{
        NSLog(@"Documents directory not found!");
        //return NO;
    }
	
	NSString *fileLocation = [documentsDirectory stringByAppendingPathComponent:@"Cars.plst"];
	
	NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cars];
	[data writeToFile:fileLocation atomically:YES];

}

-(NSMutableDictionary *)getArrayOfCarsFromXPathResult:(NSArray *)result
{
	NSMutableDictionary *toReturn = [[NSMutableDictionary alloc] init];

	for (NSMutableDictionary *tempDict in result) 
	{
		NSArray *carInfo = [tempDict objectForKey:@"nodeChildArray"];
		
		NSString *carID;
		
		NSString *yearID;
		NSString *year;
		
		NSString *modelID;
		NSString *model;
		
		NSString *makeID;
		NSString *make;
		
		NSString *specID;
		NSString *horsePower;
		NSString *torque;
		NSString *zeroToSixty;
		NSString *quarterMile;
		
		for (NSMutableDictionary *tempDictCatInfo in carInfo)
		{
			NSString *tagName = [tempDictCatInfo objectForKey:@"nodeName"];
			
			if ([tagName isEqualToString:@"id"])
			{
				NSString *tagContent = [tempDictCatInfo objectForKey:@"nodeContent"];
				carID = tagContent;
			}
			else if ([tagName isEqualToString:@"year"])
			{
				NSArray *yearInfo = [tempDictCatInfo objectForKey:@"nodeChildArray"];
				for (NSMutableDictionary *tempDictCatInfo in yearInfo)
				{
					NSString *tagName = [tempDictCatInfo objectForKey:@"nodeName"];
					if ([tagName isEqualToString:@"id"])
					{
						NSString *tagContent = [tempDictCatInfo objectForKey:@"nodeContent"];
						yearID = tagContent;
					}
					else if ([tagName isEqualToString:@"display"])
					{
						NSString *tagContent = [tempDictCatInfo objectForKey:@"nodeContent"];
						year = tagContent;
					}
				}
			}
			else if ([tagName isEqualToString:@"model"])
			{
				NSArray *modelInfo = [tempDictCatInfo objectForKey:@"nodeChildArray"];
				for (NSMutableDictionary *tempDictCatInfo in modelInfo)
				{
					NSString *tagName = [tempDictCatInfo objectForKey:@"nodeName"];
					if ([tagName isEqualToString:@"id"])
					{
						NSString *tagContent = [tempDictCatInfo objectForKey:@"nodeContent"];
						modelID = tagContent;
					}
					else if ([tagName isEqualToString:@"display"])
					{
						NSString *tagContent = [tempDictCatInfo objectForKey:@"nodeContent"];
						model = tagContent;
					}
				}
			}
			else if ([tagName isEqualToString:@"make"])
			{
				NSArray *makeInfo = [tempDictCatInfo objectForKey:@"nodeChildArray"];
				for (NSMutableDictionary *tempDictCatInfo in makeInfo)
				{
					NSString *tagName = [tempDictCatInfo objectForKey:@"nodeName"];
					if ([tagName isEqualToString:@"id"])
					{
						NSString *tagContent = [tempDictCatInfo objectForKey:@"nodeContent"];
						makeID = tagContent;
					}
					else if ([tagName isEqualToString:@"display"])
					{
						NSString *tagContent = [tempDictCatInfo objectForKey:@"nodeContent"];
						make = tagContent;
					}
				}
			}
			else if ([tagName isEqualToString:@"specs"])
			{
				NSArray *specInfo = [tempDictCatInfo objectForKey:@"nodeChildArray"];
				for (NSMutableDictionary *tempDictCatInfo in specInfo)
				{
					NSString *tagName = [tempDictCatInfo objectForKey:@"nodeName"];
					if ([tagName isEqualToString:@"id"])
					{
						NSString *tagContent = [tempDictCatInfo objectForKey:@"nodeContent"];
						specID = tagContent;
					}
					else if ([tagName isEqualToString:@"hp"])
					{
						NSString *tagContent = [tempDictCatInfo objectForKey:@"nodeContent"];
						horsePower = tagContent;
					}
					else if ([tagName isEqualToString:@"tq"])
					{
						NSString *tagContent = [tempDictCatInfo objectForKey:@"nodeContent"];
						torque = tagContent;
					}
					else if ([tagName isEqualToString:@"zs"])
					{
						NSString *tagContent = [tempDictCatInfo objectForKey:@"nodeContent"];
						zeroToSixty = tagContent;
					}
					else if ([tagName isEqualToString:@"qm"])
					{
						NSString *tagContent = [tempDictCatInfo objectForKey:@"nodeContent"];
						quarterMile = tagContent;
					}
				}
			}
			
			
			
			//NSLog (@"Name - %@\nContent - %@", tagName, tagContent);
		}
		
		NSMutableDictionary *car = [[NSMutableDictionary alloc] init];
		
		CarYear *yearObject = [[CarYear alloc] init];
		yearObject.yearID = [yearID intValue];
		yearObject.displayName = year;
		
		CarMake *makeObject = [[CarMake alloc] init];
		makeObject.makeID = [makeID intValue];
		makeObject.displayName = make;
		
		CarModel *modelObject = [[CarModel alloc] init];
		modelObject.modelID = [modelID intValue];
		modelObject.displayName = model;
		
		CarData *carDataObject = [[CarData alloc] init];
		carDataObject.theID = [specID intValue];
		carDataObject.horsePower = [horsePower intValue];
		carDataObject.torque = [torque intValue];
		carDataObject.zeroToSixty = [zeroToSixty floatValue];
		carDataObject.quarterMile = [quarterMile floatValue];
		
		[car setObject:yearObject forKey:@"year"];
		[car setObject:makeObject forKey:@"make"];
		[car setObject:modelObject forKey:@"model"];
		[car setObject:carDataObject forKey:@"carData"];
		[car retain];
		
		[toReturn setObject:car forKey:[NSString stringWithFormat:@"%iModel%iMake%iYear", modelObject.modelID, makeObject.makeID, yearObject.yearID]];
	}
	
	return toReturn;
}

-(void)setupCacheDirectory
{
	NSArray *filePaths = NSSearchPathForDirectoriesInDomains (NSCachesDirectory, NSUserDomainMask, YES); 
	
	NSString *directory = [filePaths objectAtIndex: 0];
	
	NSString *fileLocation = [directory stringByAppendingPathComponent:@"temp"];
	
	NSFileManager *fileManager = [[NSFileManager alloc] init];
	BOOL isDir = YES;
	if (![fileManager fileExistsAtPath:fileLocation isDirectory:&isDir])
	{
		[fileManager createDirectoryAtPath:fileLocation withIntermediateDirectories:YES attributes:nil error:nil];
	}
	
	[fileManager release];
	
}

-(void)moveTempFileToCarImage:(NSString *)tempFile
					 usingCarMake:(CarMake *)make
						carModel:(CarModel *)model
						 year:(CarYear *)year
{
	NSFileManager *fileManager = [[NSFileManager alloc] init];
	
	[self prepFoldersForImageUsingCarMake:make andModel:model andYear:year];
	
	[fileManager moveItemAtPath:tempFile toPath:[self pathForCarImageFile:make andModel:model andYear:year] error:nil];
	
	[fileManager release];
}

-(NSString *)getNextTempFileName
{
	@synchronized (self)
	{
		
		
		[self setupCacheDirectory];
		
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
		
		NSString *documentsDirectory = [paths objectAtIndex:0];
		
		NSFileManager *fileManager = [[NSFileManager alloc] init];
		
		///nextTemp++;
		NSString *toReturn = [[NSString alloc] initWithString:[documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"temp/%dtemp", ++nextTemp]]];
		
		[fileManager createFileAtPath:toReturn contents:nil attributes:nil];
		
		[fileManager release];
		
		return toReturn;//[documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/Ads/Images/%@.png", userInfo.sessionID, ad.theID]];
	}
}

-(void)deleteTempFolder
{
	NSArray *filePaths = NSSearchPathForDirectoriesInDomains (NSCachesDirectory, NSUserDomainMask, YES); 
	
	NSString *directory = [filePaths objectAtIndex: 0];
	
	NSString *fileLocation = [directory stringByAppendingPathComponent:@"temp"];
	
	NSFileManager *fileManager = [[NSFileManager alloc] init];
	
	[fileManager removeItemAtPath:fileLocation error:nil];
	
	[fileManager release];
}


-(void)showLoadingScreen
{
	[hud show];
}

-(void)hideLoadingScreen
{
	[hud hide];
}


@end

