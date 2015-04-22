//
//  ChatViewController.m
//  CM
//
//  Created by liangyu on 15-4-9.
//  Copyright (c) 2015年 cheng. All rights reserved.
//

#import "ChatViewController.h"
#import "ChartMessage.h"
@interface ChatViewController (){
    NSMutableArray *chatRecord;
}

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Screen_W, Screen_H -44) style:UITableViewStylePlain];
    
//    self.tableView.separatorColor = [UIColor clearColor];
//    self.tableView.separatorStyle = UITableViewCellEditingStyleNone;
    self.tableView.allowsSelection = NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"chat_bg_default.jpg"]];
    [self.view addSubview:self.tableView];
    [self loadBaseData];
    // Do any additional setup after loading the view.
}

- (void)loadBaseData {
    chatRecord =[NSMutableArray array];
    ChartMessage *message = [[ChartMessage alloc]init];
    NSString *path=[[NSBundle mainBundle] pathForResource:@"messages" ofType:@"plist"];
    NSArray *data=[NSArray arrayWithContentsOfFile:path];
    for(NSDictionary *dict in data){
        message.content = dict[@"content"];
        message.icon = dict[@"icon"];
        message.type = [dict[@"type"] intValue];
        [chatRecord addObject:message];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return chatRecord.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    return cell;
}


- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
