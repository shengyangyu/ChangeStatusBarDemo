//
//  MeViewController.m
//  ChangeStatusBarDemo
//
//  Created by shengyangyu on 2018/5/22.
//  Copyright © 2018年 shengyangyu. All rights reserved.
//

#import "MeViewController.h"

#import "ThemeManager.h"

@interface MeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *themeBtn;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([ThemeManager manager].currentTheme == FSAppThemeBlack) {
        [self.themeBtn setTitle:@"黑色" forState:UIControlStateNormal];
    }
    else {
        [self.themeBtn setTitle:@"白色" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeTheme:(UIButton *)sender {
    
    if ([ThemeManager manager].currentTheme == FSAppThemeBlack) {
        [ThemeManager manager].currentTheme = FSAppThemeWhite;
        [sender setTitle:@"白色" forState:UIControlStateNormal];
    }
    else {
        [ThemeManager manager].currentTheme = FSAppThemeBlack;
        [sender setTitle:@"黑色" forState:UIControlStateNormal];
    }
    [self setNeedsStatusBarAppearanceUpdate];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
