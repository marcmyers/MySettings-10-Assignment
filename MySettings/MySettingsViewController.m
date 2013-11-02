//
//  MySettingsViewController.m
//  MySettings
//
//  Created by Marc A Myers on 11/1/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import "MySettingsViewController.h"

@interface MySettingsViewController ()

@end

@implementation MySettingsViewController

@synthesize eventTitle;
@synthesize eventComments;
@synthesize where;

NSMutableArray *locations;
NSString *locationSelected;

-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
    
}

- (void)viewDidLoad
{
    //Create an array containing the location values
    locations = [[NSMutableArray alloc] init];
    [locations addObject:@"Home"];
    [locations addObject:@"Work"];
    [locations addObject:@"Other"];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

//Number of components in the Picker view
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
    
}

//Number of items(rows) in the Picker view
- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component {
    return [locations count];
    
}

//Populating the Picker view
- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return [locations objectAtIndex:row];
    
}

//—-the item selected by the user—-
- (void)pickerView:(UIPickerView *)thePickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    locationSelected = [locations objectAtIndex:row];
    
}

- (void)dealloc {
    /*
    Commented out, causes errors
	[locations release];
    [locationSelected release];
    [eventTitle release];
    [eventComments release];
    [where release];
    [super dealloc];
     */
    
}

- (IBAction) loadSettings: (id) sender{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    eventTitle.text = [defaults objectForKey:@"event_title"];
    eventComments.text = [defaults objectForKey:@"event_comments"];
	
	//—-find the index of the array for the color saved—-
    locationSelected = [[NSString alloc] initWithString:
							 [defaults objectForKey:@"where"]];
	
    int selIndex = [locations indexOfObject:locationSelected];
	
    //—-display the saved color in the Picker view—-
    [where selectRow:selIndex inComponent:0 animated:YES];
    
}

-(IBAction) saveSettings: (id) sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:eventTitle.text forKey:@"event_title"];
    [defaults setObject:eventComments.text forKey:@"event_comments"];
    [defaults setObject:locationSelected forKey:@"where"];
	[defaults synchronize];
	
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Settings Value Saved"
                          message:@"Settings Saved"
                          delegate:nil
                          cancelButtonTitle:@"Done"
                          otherButtonTitles:nil];
    [alert show];
    //[alert release]; Commented out, causes errors
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
