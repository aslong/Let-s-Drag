//
//  CarYear.m
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CarYear.h"


@implementation CarYear

@synthesize displayName, yearID;

-(id)initWithDisplayName:(NSString *)newDisplayName andYearID:(int)newYearID
{
	if (self = [super init])
	{
		displayName = [newDisplayName retain];
		yearID = newYearID;
		
		return self;
	}
	
	return nil;
}

-(NSComparisonResult)sort:(CarYear *)yearToCompareWith
{
	return ((NSComparisonResult)(-(int)([self.displayName caseInsensitiveCompare:yearToCompareWith.displayName])));
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    displayName = [[coder decodeObjectForKey:@"CARYEARdisplayName"] retain];
    yearID = [coder decodeIntForKey:@"CARYEARmodelID"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:displayName forKey:@"CARYEARdisplayName"];
	[coder encodeInt:yearID forKey:@"CARYEARmodelID"];
}

-(void)dealloc
{
	[displayName release];
	[super dealloc];
}

@end
