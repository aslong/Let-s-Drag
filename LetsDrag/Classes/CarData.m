//
//  CarData.m
//  LetsDrag
//
//  Created by andrew on 4/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CarData.h"


@implementation CarData

@synthesize horsePower, torque, zeroToSixty, quarterMile, theID;

-(id)init
{
	if (self = [super init])
	{
		return self;
	}
	
	return nil;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
	theID = [coder decodeIntForKey:@"CARDATAtheID"];
    horsePower = [coder decodeIntForKey:@"CARDATAhorsePower"];
    torque = [coder decodeIntForKey:@"CARDATAtorque"];
	zeroToSixty = [coder decodeFloatForKey:@"CARDATAzeroToSixty"];
	quarterMile = [coder decodeFloatForKey:@"CARDATAquarterMile"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeInt:theID forKey:@"CARDATAtheID"];
    [coder encodeInt:horsePower forKey:@"CARDATAhorsePower"];
	[coder encodeInt:torque forKey:@"CARDATAtorque"];
	[coder encodeFloat:zeroToSixty forKey:@"CARDATAzeroToSixty"];
	[coder encodeFloat:quarterMile forKey:@"CARDATAquarterMile"];
}


-(void)dealloc
{
	[super dealloc];
}

@end
