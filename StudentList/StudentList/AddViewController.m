//
//  AddViewController.m
//  StudentList
//
//  Created by seth on 16/6/4.
//  Copyright © 2016年 seth. All rights reserved.
//

#import "AddViewController.h"
#import "StudentModel.h"
#import "SQLManager.h"

@interface AddViewController ()

@property(nonatomic, weak)UITextField *idNumTF;

@property(nonatomic, weak)UITextField *nameTF;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonSystemItemDone target:self action:@selector(addDone)];

    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupView{

    UILabel *idLabel = [[UILabel alloc]init];
    idLabel.text = @"学号";
    idLabel.textColor = [UIColor blackColor];
    idLabel.frame = CGRectMake(20, 150, 80, 40);
    [self.view addSubview:idLabel];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"姓名";
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.frame = CGRectMake(CGRectGetMinX(idLabel.frame), CGRectGetMaxY(idLabel.frame) + 50, 80, 40);
    [self.view addSubview:nameLabel];
    
    UITextField *idTF  = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(idLabel.frame), CGRectGetMinY(idLabel.frame), 150, 40)];
    idTF.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:idTF];
    self.idNumTF = idTF;
    UITextField *nameTF = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMinX(idTF.frame), CGRectGetMinY(nameLabel.frame), 150, 40)];
    nameTF.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:nameTF];
    self.nameTF = nameTF;
    
    
}

-(void)addDone{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    StudentModel *model = [[StudentModel alloc]init];
    model.idNum = self.idNumTF.text;
    model.name = self.nameTF.text;
    
    //插入数据库
    [[SQLManager shareManager]insert:model];
}

@end
