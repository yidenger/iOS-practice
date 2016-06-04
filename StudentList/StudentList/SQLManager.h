//
//  SQLManager.h
//  StudentList
//
//  Created by seth on 16/6/4.
//  Copyright © 2016年 seth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "StudentModel.h"

@interface SQLManager : NSObject{
    sqlite3 *db;
}

+(SQLManager *)shareManager;

//查询
-(StudentModel *)searchWithIdNum:(StudentModel *)model;

//插入
-(int)insert:(StudentModel *)model;

//查询全部
-(NSArray *)searchAll;

@end
