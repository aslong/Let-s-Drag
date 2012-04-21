//
//  CarModel.h
//  LetsDrag
//
//  Created by andrew on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CarModel : NSObject <NSCoding>
{
	NSString *displayName;
	int modelID;
}

@property (readwrite, retain) NSString *displayName;
@property (readwrite) int modelID;

-(id)initWithDisplayName:(NSString *)newDisplayName andModelID:(int)newModelID;
-(NSComparisonResult)sort:(CarModel *)modelToCompareWith;

@end
