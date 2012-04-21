//
//  CarModel.m
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CarModel.h"


@implementation CarModel
@synthesize displayName, modelID;

-(id)initWithDisplayName:(NSString *)newDisplayName andModelID:(int)newModelID
{
	if (self = [super init])
	{
		displayName = [newDisplayName retain];
		modelID = newModelID;
		return self;
	}
	
	return nil;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    displayName = [[coder decodeObjectForKey:@"CARMODELdisplayName"] retain];
    modelID = [coder decodeIntForKey:@"CARMODELmodelID"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:displayName forKey:@"CARMODELdisplayName"];
	[coder encodeInt:modelID forKey:@"CARMODELmodelID"];
}

-(NSComparisonResult)sort:(CarModel *)modelToCompareWith
{
	return [self.displayName caseInsensitiveCompare:modelToCompareWith.displayName];
}

-(void)dealloc
{
	[displayName release];
	[super dealloc];
}


@end
