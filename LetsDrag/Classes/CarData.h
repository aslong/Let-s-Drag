//
//  CarData.h
//  LetsDrag
//
//  Created by andrew on 4/28/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CarData : NSObject <NSCoding>
{
	int theID;
	int horsePower;
	int torque;
	float zeroToSixty;
	float quarterMile;
}

@property (readwrite, assign) int theID;
@property (readwrite, assign) int horsePower;
@property (readwrite, assign) int torque;
@property (readwrite, assign) float zeroToSixty;
@property (readwrite, assign) float quarterMile;

@end
