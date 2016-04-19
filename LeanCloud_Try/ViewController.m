//
//  ViewController.m
//  LeanCloud_Try
//
//  Created by JkWpq on 16/3/28.
//  Copyright © 2016年 JkWpq. All rights reserved.
//

#import "ViewController.h"

#define  QUERY_LIMIT 30
#define  ORDER_BY @"createdAt"

@interface ViewController ()
@property (nonatomic,strong) NSString *keyword;
@property (nonatomic,copy)   NSString *newid;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //homePageADV
    
    [self create:@"Current"];
//    [self update];
//    [self loadData:@"TestA"];
}


-(void)update{
    AVObject *todo = [AVObject objectWithoutDataWithClassName:@"TestA" objectId:@"56fd05e839b0570054e601e6"];
    
    int sex=1;
    if (sex == 0) {
        [todo setObject:@"张三"      forKey:@"name"];
        [todo setObject:@"男"        forKey:@"sex"];
        
    }
    else{
        [todo setObject:@"李四"      forKey:@"name"];
        [todo setObject:@"女"        forKey:@"sex"];
    }
    
    
    
    
    [todo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"%@",todo.objectId);
            // 存储成功
            [todo saveInBackground];
        } else {
            // 失败的话，请检查网络环境以及 SDK 配置是否正确
            NSLog(@"fail");
        }
    }];
}




#pragma mark -- create
-(void)create:(NSString*)class{
    
    AVObject *todo = [AVObject objectWithClassName:class];
//    [todo setObject:@"张三"      forKey:@"name"];
//    [todo setObject:@"男"        forKey:@"sex"];
    NSDictionary *dic =@{
    @"array": @[@{
            @"operation_tag": @"新手标",
            @"period": @"7天",
            @"starting_amount": @"10元",
            @"product_name": @"新手标J6",
            @"series":@"新手专享",
            @"annual_rate": @0.1
        }, @{
            @"operation_tag": @"热销",
            @"period": @"232天",
            @"starting_amount": @"1000元",
            @"product_name": @"永盈宝B144",
            @"series":@"正在热销",
            @"annual_rate": @0.118
        }, @{
            @"operation_tag": @"热销",
            @"period": @"177天",
            @"starting_amount": @"500元",
            @"product_name": @"安赢宝D177",
            @"series":@"正在热销",
            @"annual_rate": @0.095
        }, @{
             @"operation_tag": @"热销",
             @"period": @"113天",
             @"starting_amount": @"1000元",
             @"product_name": @"安心保O14",
             @"series":@"正在热销",
             @"annual_rate": @0.07
            
        },@{
            @"operation_tag": @"热销",
            @"period": @"86天",
            @"starting_amount": @"1000元",
            @"product_name": @"季度宝J39",
            @"series":@"正在热销",
            @"annual_rate": @0.082
        },@{
            @"operation_tag": @"热销",
            @"period": @"70天",
            @"starting_amount": @"1000元",
            @"product_name": @"天升我财L55",
            @"series":@"正在热销",
            @"annual_rate": @0.075

        },@{
            @"operation_tag": @"热销",
            @"period": @"730天",
            @"starting_amount": @"1000元",
            @"product_name": @"岁岁盈D33",
            @"series":@"正在热销",
            @"annual_rate": @0.125
        }],
    };
  
  
  //YueLi,Period

    [todo setObject:dic forKey:@"Current"];
    [todo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // 存储成功
            NSLog(@"success");
            NSLog(@"id:%@",todo.objectId);
        } else {
            // 失败的话，请检查网络环境以及 SDK 配置是否正确
            NSLog(@"fail");
        }
    }];
}


#pragma mark -- loadData
-(void)loadData:(NSString*)Query{
    AVQuery *q=[self getQuery:Query];
    [q findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(error){
            NSLog(@"%@",error);
        }else{
            NSDictionary* dic=[[objects objectAtIndex:0] objectForKey:@"localData"];
            
            NSLog(@"-----%@-----",[dic objectForKey:@"name"]);
            NSLog(@"-----%@-----",[dic objectForKey:@"sex"]);
            
        }
    }];
    
}

-(AVQuery*)getQuery:(NSString*)name{
    AVQuery *q = [AVQuery queryWithClassName:name];
    return q;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
