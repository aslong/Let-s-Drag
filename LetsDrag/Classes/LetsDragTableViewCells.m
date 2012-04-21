//
//  LetsDragTableViewCells.m
//  LetsDrag
//
//  Created by andrew on 5/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LetsDragTableViewCells.h"


@implementation LetsDragTableViewCells

- (void) setCellColor: (UIColor*)color
{
    cellColor = color;
}

- (void) spreadBackgroundColor: (UIView*)that withColor: (UIColor*)bkColor
{
    NSEnumerator *enumerator = [that.subviews objectEnumerator];
    id anObject;
    
    while (anObject = [enumerator nextObject]) {
        if( [anObject isKindOfClass: [ UIView class] ] )
        {
            ((UIView*)anObject).backgroundColor = bkColor;
            [ self spreadBackgroundColor:anObject withColor:bkColor];
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if( !self.selected && NULL != cellColor)
    {
        [ self spreadBackgroundColor:self withColor:cellColor ];
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}


@end
