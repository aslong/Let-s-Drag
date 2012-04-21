//
//  RequestCarViewController.h
//  LetsDrag
//
//  Created by Andrew Long on 6/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RequestCarViewController : UIViewController <UITextFieldDelegate>
{
	UITextField *yearTextField;
	UITextField *makeTextField;
	UITextField *modelTextField;
	UITextField *emailTextField;
	UITextField *noteTextField;
	
	UIButton *hideKeyboardButton;
	BOOL movedUpViewForKeyboard;
	CGRect frameOrigin;
	
	BOOL movedForYear, movedForModel, movedForMake, movedForEmail, movedForNote;
}

@property (nonatomic, retain) IBOutlet UITextField *yearTextField;
@property (nonatomic, retain) IBOutlet UITextField *makeTextField;
@property (nonatomic, retain) IBOutlet UITextField *modelTextField;
@property (nonatomic, retain) IBOutlet UITextField *emailTextField;
@property (nonatomic, retain) IBOutlet UITextField *noteTextField;

@property (nonatomic, retain) IBOutlet UIButton *hideKeyboardButton;

- (IBAction)requestCarClicked:(id)sender;
- (IBAction)hideKeyboardClicked:(id)sender;


@end
