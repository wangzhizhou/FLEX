//
//  FLEXCodeTargetViewController.m
//  FLEX
//
//  Created by joker on 2019/1/30.
//

#import "FLEXCodeTargetViewController.h"
#import "UIView+Swizzling.h"

@interface FLEXCodeTargetViewController ()
@property (nonatomic) UITextView *textView;
@end

@implementation FLEXCodeTargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donePressed:)];

    
    self.textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.textView];
    
    self.textView.text = [self.selectedView.stackInfo componentsJoinedByString:@"\n"];
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    CGRect frame = self.textView.frame;
    frame.size = size;
    self.textView.frame = frame;
}

- (void)donePressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.delegate globalsViewControllerDidFinish:self];
}

@end
