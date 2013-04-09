//
//  GuessNumViewController.m
//  guessNum
//
//  Created by yejianfeng on 13-4-4.
//  Copyright (c) 2013年 yejianfeng. All rights reserved.
//

#import "GuessNumViewController.h"

@interface GuessNumViewController ()
@property (weak, nonatomic) IBOutlet UILabel *guessHint;   // 猜测提示
@property (weak, nonatomic) IBOutlet UILabel *guessResult;  // ？以及最终的数据
- (IBAction)guessAgain:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *guessNum;  // 输入的猜测数字

- (IBAction)guessNow:(id)sender;

@end

@implementation GuessNumViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.number = arc4random() % 100 + 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)guessNow:(id)sender {
    NSInteger inputNum = [self.guessNum.text intValue];
    
    self.guessHint.hidden = NO;
    if (inputNum > self.number) {
        self.guessHint.text = [NSString stringWithFormat: @"%d比?大", inputNum];
    } else if (inputNum < self.number) {
        self.guessHint.text = [NSString stringWithFormat: @"%d比?小", inputNum];
    } else {
        self.guessHint.text = @"恭喜你正确";
        self.guessResult.text = [NSString stringWithFormat: @"%d", inputNum];
    }
}

- (IBAction)guessAgain:(id)sender {
    // 获取一个100以内的数字
    self.number = arc4random() % 100 + 1;
    
    // 输入框置空
    self.guessNum.text = @"";
    
    // 隐藏提示框
    self.guessHint.hidden = YES;
    
    // 设置问号
    self.guessResult.text = @"?";
}

- (BOOL) textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.guessNum) {
        [theTextField resignFirstResponder];
    }
    return YES;
}


@end
