//
//  CarMake.m
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CarMake.h"


@implementation CarMake

@synthesize displayName, makeID;

-(id)initWithDisplayName:(NSString *)newDisplayName andMakeID:(int)newMakeID
{
	if (self = [super init])
	{
		displayName = [newDisplayName retain];
		makeID = newMakeID;
		return self;
	}
	
	return nil;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    displayName = [[coder decodeObjectForKey:@"CARMAKEdisplayName"] retain];
    makeID = [coder decodeIntForKey:@"CARMAKEmakeID"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:displayName forKey:@"CARMAKEdisplayName"];
	[coder encodeInt:makeID forKey:@"CARMAKEmakeID"];
}

-(NSComparisonResult)sort:(CarMake *)makeToCompareWith
{
	return [self.displayName caseInsensitiveCompare:makeToCompareWith.displayName];
}

-(void)dealloc
{
	[displayName release];
	[super dealloc];
}

@end
