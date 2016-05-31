//
//  ViewController.m
//  MoonCheckCode
//
//  Created by seth on 16/5/31.
//  Copyright © 2016年 seth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, weak)UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor greenColor];
    [self addButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addButton{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect frame = CGRectMake(0, 0, 120, 50);
    CGPoint center = self.view.center;
    
    btn.frame = frame;
    btn.center = center;
    btn.backgroundColor = [UIColor blueColor];
    btn.layer.cornerRadius = 3;
    
    [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.btn = btn;
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = btn.frame;
    btn2.center = CGPointMake(btn.center.x, btn.center.y + 120);
    btn2.backgroundColor = [UIColor blueColor];
    btn2.layer.cornerRadius = 3;
    [btn2 setTitle:@"测试按钮" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    
    
}

-(void)btnClick{
    
    NSLog(@"you click the button...");
    [self openCountdown];
    
    
}

-(void)btn2Click{
    NSLog(@"you click the button 2...");
}

/**
 *  打开倒计时效果
 */
-(void)openCountdown{

    __block NSInteger time = 29;//倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 *NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
    
        if (time <= 0) {//倒计时结束，关闭
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮的样式
                [self.btn setTitle:@"重新获取" forState:UIControlStateNormal];
                [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                self.btn.userInteractionEnabled = YES;
                
                
            });
        }
        else{//倒计时未结束
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮读秒的效果
                [self.btn setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                [self.btn setTitleColor:[UIColor colorWithRed:201/255.0 green:227/255.0 blue:235/255.0 alpha:1] forState:UIControlStateNormal];
                self.btn.userInteractionEnabled = NO;
            });
            time--;
            
        }
    
    });

    dispatch_resume(_timer);


}




















@end
