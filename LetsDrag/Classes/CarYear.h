//
//  CarYear.h
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CarYear : NSObject <NSCoding>
{
	NSString *displayName;
	int yearID;
}

@property (readwrite, retain) NSString *displayName;
@property (readwrite) int yearID;

-(id)initWithDisplayName:(NSString *)newDisplayName andYearID:(int)newYearID;
-(NSComparisonResult)sort:(CarYear *)yearToCompareWith;

@end
