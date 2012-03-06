//
//  ViewController.m
//  AUISelectiveBordersView
//
//  Created by Adam Siton on 1/26/12.
//

#import "ViewController.h"
#import "UIView+AUISelectiveBorder.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Setting selective borders to the left view controls
    leftLabel.selectiveBorderFlag = AUISelectiveBordersFlagTop;
    leftLabel.selectiveBordersColor = [UIColor redColor];
    leftLabel.selectiveBordersWidth = 3.0;
    
    leftView.selectiveBorderFlag = AUISelectiveBordersFlagTop | AUISelectiveBordersFlagLeft;
    leftView.selectiveBordersColor = [UIColor blueColor];
    leftView.selectiveBordersWidth = 3.0;

    leftButton.selectiveBorderFlag = AUISelectiveBordersFlagTop | AUISelectiveBordersFlagRight;
    leftButton.selectiveBordersColor = [UIColor redColor];
    leftButton.selectiveBordersWidth = 3.0;
    
    leftImageView.selectiveBorderFlag = AUISelectiveBordersFlagBottom | AUISelectiveBordersFlagLeft | AUISelectiveBordersFlagRight;
    leftImageView.selectiveBordersColor = [UIColor blueColor];
    leftImageView.selectiveBordersWidth = 3.0;
    
    // Setting regular borders to the right view controls
    rightLabel.layer.borderColor = [UIColor redColor].CGColor;
    rightLabel.layer.borderWidth = 3.0;
    
    rightView.layer.borderColor = [UIColor blueColor].CGColor;
    rightView.layer.borderWidth = 3.0;
    
    rightButton.layer.borderColor = [UIColor redColor].CGColor;
    rightButton.layer.borderWidth = 3.0;
    
    rightImageView.layer.borderColor = [UIColor blueColor].CGColor;
    rightImageView.layer.borderWidth = 3.0;
}

-(IBAction)testResizeButtonClicked:(id)sender {
    // Change the frame of the leftView
    leftView.frame = CGRectInset(leftView.frame, 10, 10);
}

-(IBAction)testAddingSubviewsButtonClicked:(id)sender {
    // Add subview that covers the view
    UIView *subView = [[UIView alloc] initWithFrame:leftView.bounds];
    subView.backgroundColor = [UIColor greenColor];
    [leftView addSubview:subView];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
