//
//  HomeViewController.m
//  StudentList
//
//  Created by seth on 16/6/4.
//  Copyright © 2016年 seth. All rights reserved.
//

#import "HomeViewController.h"
#import "AddViewController.h"
#import "StudentModel.h"
#import "SQLManager.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addStudent)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

-(void)viewWillAppear:(BOOL)animated{

    if (!_studentArr) {
        _studentArr = [NSMutableArray array];
    }
    
    NSArray *stuArr = [[SQLManager shareManager]searchAll];
    NSLog(@"select count: %ld", [stuArr count]);
    _studentArr = [[NSMutableArray alloc]initWithArray:stuArr];
    NSLog(@"student count: %ld", [_studentArr count]);
    [self.tableView reloadData];

}

-(void)addStudent{
    AddViewController *addVC = [[AddViewController alloc]init];
    addVC.navigationItem.title = @"添加";
    [self.navigationController pushViewController:addVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.studentArr count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"studentListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        StudentModel *stuModel = (StudentModel *)(self.studentArr[indexPath.row]);
        NSLog(@"indexPath.row: %ld, id: %@", indexPath.row, stuModel.idNum);
        cell.textLabel.text = stuModel.name;
        cell.detailTextLabel.text = stuModel.idNum;
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
