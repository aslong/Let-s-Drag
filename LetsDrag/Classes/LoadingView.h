//
//  LoadingView.h
//  RocketronMobile
//
//  Created by andrew on 1/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoadingView : UIViewController {

	UIView *backgroundView;
	
}

-(id)initWithView:(UIView *)viewToLoad;
-(id)initWithWindow:(UIView *) window;
-(id)initWithWindowLandscape:(UIView *) window;
-(void)show;
-(void)hide;

@end
