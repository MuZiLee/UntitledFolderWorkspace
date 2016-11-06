//
//  ViewController.m
//  SQLite3ProFile
//
//  Created by 李飞恒 on 16/11/7.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)insertAction:(id)sender {
    //把一个文件名称传递给他，它会自动检测这个文件是否存在，如果不存在的话，会自动创建相应的文件（这里为数据库文件，刚创建为空）。
    sqlite3 *db;
    
    /**
     *  打开数据库
     *
     *  @param const 文件名(需要转为C语言)
     *  @param sqlist 实例对象
     *
     *  @return boot 是否打开成功
     */
    
    NSString *path = @"/Users/LIFEIHENG/Desktop/lists.sqlite";
    
    const char *cfileName = path.UTF8String;
    
    int rusult = sqlite3_open(cfileName, &db);
    
    if (rusult == SQLITE_OK) {
        NSLog(@"OK");
        
    } else {
        NSLog(@"O NO");
    }
    
    
}

- (IBAction)execList:(id)sender
{
    /**
     *  创建表
     *
     *  @param 数据库的句柄 db
     *  @param sql语句
     *  @param callback (是一个函数指针,如果把callback前面的*改成^则就是一个block代码段)
     *  @param 可以写NULL
     *  @param 错误信息
     */
    //    sqlite3_exec();
    
    sqlite3 *db;
    NSString *path = @"/Users/LIFEIHENG/Desktop/lists.db";
    
    const char *cfileName = path.UTF8String;
    int result = sqlite3_open(cfileName, &db);
    
    if (result != SQLITE_OK) {
        NSLog(@"打开数据库失败");
        return;
    }
    
    const char *sql = [self createTableIfNotExists:@"myListB"];
    char *errmsg = NULL;
    result = sqlite3_exec(db, sql, NULL, NULL, &errmsg);
    if (result == SQLITE_OK) {
        NSLog(@"创表成功");
    } else if (result == SQLITE_ERROR) {
        NSLog(@"创表错误:%s",errmsg);
    }
    
    
}

/**
 *  创建表
 *
 *  @param tableName 表名
 *
 *  @return 创建表的SQL语句
 */
- (const char *)createTableIfNotExists:(NSString *)tableName
{
    //一个表等于一个model的容器,一条数据等于一个model
    //紧跟着的就是参数,类似于model中的属性,创建完表之后,仅仅只是一个表,表中还没有任何参数
    NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (id integer PRIMARY KEY AUTOINCREMENT, name, age, url, v);",tableName];
    
    return [sql UTF8String];
}



- (IBAction)deleteAction:(id)sender {
    
}
- (IBAction)updateAction:(id)sender {
    
}
- (IBAction)selectAction:(id)sender {
    
}

@end
