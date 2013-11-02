//
//  MySettingsViewController.h
//  MySettings
//
//  Created by Marc A Myers on 11/1/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MySettingsViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate> {
    IBOutlet UITextField *eventTitle;
    IBOutlet UITextField *eventComments;
    IBOutlet UIPickerView *where;
}

@property (nonatomic, retain) UITextField *eventTitle;
@property (nonatomic, retain) UITextField *eventComments;
@property (nonatomic, retain) UIPickerView *where;

-(IBAction) loadSettings: (id) sender;
-(IBAction) saveSettings: (id) sender;
-(IBAction) doneEditing: (id) sender;


@end
