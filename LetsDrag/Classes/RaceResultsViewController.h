//
//  RaceResultsViewController.h
//  LetsDrag
//
//  Created by andrew on 4/21/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface RaceResultsViewController : UIViewController 
{
	id viewControllerHoldingNavigation;
	NSMutableDictionary *car;
	UILabel *winLoseLabel;
	
	UIImageView *winView;
	UIImageView *loseView;
	UIImageView *tieView;
	
	UIView *loadingView;
	
	AVAudioPlayer *audio;
}

@property (readwrite, assign) id viewControllerHoldingNavigation;
@property (readwrite, retain) NSMutableDictionary *car;
@property (readwrite, retain) IBOutlet UILabel *winLoseLabel;
@property (readwrite, retain) IBOutlet UIImageView *winView;
@property (readwrite, retain) IBOutlet UIImageView *loseView;
@property (readwrite, retain) IBOutlet UIImageView *tieView;
@property (readwrite, retain) IBOutlet UIView *loadingView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andCar:(NSMutableDictionary *)newCar;

@end
