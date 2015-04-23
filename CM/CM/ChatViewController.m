//
//  ChatViewController.m
//  CM
//
//  Created by liangyu on 15-4-9.
//  Copyright (c) 2015年 cheng. All rights reserved.
//

#import "ChatViewController.h"
#import "ChartCell.h"
#import "ChartMessage.h"

@interface ChatViewController ()
@property (nonatomic,strong) NSMutableArray *cellFrames;

@end
static NSString *const cellIdentifier=@"QQChart";

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"QQ chat";
    self.view.backgroundColor=[UIColor whiteColor];
    
    //add UItableView
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-44) style:UITableViewStylePlain];
    
    [self.tableView registerClass:[ChartCell class] forCellReuseIdentifier:cellIdentifier];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO;
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chat_bg_default.jpg"]];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    [self.view addSubview:self.tableView];
    
    //add keyBorad
    
//    self.keyBordView=[[KeyBordVIew alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-108, self.view.frame.size.width, 44)];
//    self.keyBordView.delegate=self;
//    [self.view addSubview:self.keyBordView];
    //初始化数据
    
    [self initwithData];
}


-(void)initwithData
{
    
    self.cellFrames=[NSMutableArray array];
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"messages" ofType:@"plist"];
    NSArray *data=[NSArray arrayWithContentsOfFile:path];
    
    for(NSDictionary *dict in data){
        
        ChartCellFrame *cellFrame=[[ChartCellFrame alloc]init];
        ChartMessage *chartMessage=[[ChartMessage alloc]init];
        chartMessage.dict=dict;
        cellFrame.chartMessage=chartMessage;
        [self.cellFrames addObject:cellFrame];
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ChartCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    //    cell.delegate=self;
    cell.cellFrame=self.cellFrames[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.cellFrames[indexPath.row] cellHeight];
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
