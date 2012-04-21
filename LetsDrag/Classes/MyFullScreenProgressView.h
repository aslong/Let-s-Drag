//
//  MyFullScreenProgressView.h
//  LetsDrag
//
//  Created by andrew on 5/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyFullScreenProgressView : UIViewController 
{
	UIProgressView *progressView;
	UILabel *label;
}

@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, retain) IBOutlet UIProgressView *progressView;

-(void)setProgressLabel:(NSString *)newText;
-(void)setProgress:(NSNumber *)newProgress;

-(void)hideProgressView;

@end
