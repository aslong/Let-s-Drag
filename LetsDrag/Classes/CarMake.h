//
//  CarMake.h
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CarMake : NSObject <NSCoding>
{
	NSString *displayName;
	int makeID;
}

@property (readwrite, retain) NSString *displayName;
@property (readwrite) int makeID;

-(id)initWithDisplayName:(NSString *)newDisplayName andMakeID:(int)newMakeID;
-(NSComparisonResult)sort:(CarMake *)makeToCompareWith;

@end
