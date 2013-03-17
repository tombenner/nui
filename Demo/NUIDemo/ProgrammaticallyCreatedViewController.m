//
//  ProgrammaticallyRenderedViewController.m
//  NUIDemo
//
//  Created by Tom Benner on 12/30/12.
//  Copyright (c) 2012 Tom Benner. All rights reserved.
//

#import "ProgrammaticallyCreatedViewController.h"

@interface ProgrammaticallyCreatedViewController ()<UITextFieldDelegate>

@end

@implementation ProgrammaticallyCreatedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self programmaticallyRenderControls];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)programmaticallyRenderControls
{
    UIButton *largeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [largeButton setTitle:@"Large Button" forState:UIControlStateNormal];
    [largeButton setNuiClass:@"Button:LargeButton"];
    [largeButton setFrame:CGRectMake(20, 20, 133, 50)];
    [self.view addSubview:largeButton];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(20, 89, 74, 37)];
    [self.view addSubview:button];
    
    UIButton *smallButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [smallButton setTitle:@"Small" forState:UIControlStateNormal];
    [smallButton setNuiClass:@"Button:SmallButton"];
    [smallButton setFrame:CGRectMake(20, 145, 57, 24)];
    [self.view addSubview:smallButton];
    
    UILabel *largeLabel = [[UILabel alloc] initWithFrame:CGRectMake(167, 25, 133, 40)];
    [largeLabel setText:@"Large Label"];
    [largeLabel setNuiClass:@"Label:LargeLabel"];
    [self.view addSubview:largeLabel];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(110, 92, 62, 32)];
    [label setText:@"Label"];
    [self.view addSubview:label];
    
    UILabel *smallLabel = [[UILabel alloc] initWithFrame:CGRectMake(92, 146, 52, 21)];
    [smallLabel setText:@"Small"];
    [smallLabel setNuiClass:@"Label:SmallLabel"];
    [self.view addSubview:smallLabel];
    
    UITextField *largeTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 189, 159, 31)];
    [largeTextField setPlaceholder:@"Large Field"];
    [largeTextField setNuiClass:@"TextField:LargeTextField"];
    [largeTextField setReturnKeyType:UIReturnKeyDone];
    [largeTextField setDelegate:self];
    [self.view addSubview:largeTextField];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 257, 93, 31)];
    [textField setPlaceholder:@"Text Field"];
    [textField setReturnKeyType:UIReturnKeyDone];
    [textField setDelegate:self];
    [self.view addSubview:textField];
    
    NSArray *items = [NSArray arrayWithObjects: @"Segmented", @"Control", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    [segmentedControl setFrame:CGRectMake(20, 318, 190, 30)];
    [segmentedControl setSelectedSegmentIndex:0];
    [self.view addSubview:segmentedControl];
    
    UISwitch *uiSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(223, 319, 79, 27)];
    [uiSwitch setOn:YES];
    [self.view addSubview:uiSwitch];
}

@end
