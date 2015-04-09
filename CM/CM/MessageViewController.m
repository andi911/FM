//
//  MessageViewController.m
//  CM
//
//  Created by liangyu on 15-4-7.
//  Copyright (c) 2015年 cheng. All rights reserved.
//

#import "MessageViewController.h"
#import "News.h"
#import "NewsCustomerTableViewCell.h"
#import "ChatViewController.h"
@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNewsData];
    [self loadSegmentController];
}

- (void)loadNewsData {
    News *customer = [[News alloc]init];
    customer.headImage = [UIImage imageNamed:@"headImage.jpg"];
    customer.name = @"为你读诗";
    customer.lastContent = @"周末准备干什么去？";
    customer.lastTime = @"9:31";
    [self.newsList addObject:customer];
}


- (void) loadSegmentController{
    NSArray *segmentedData = [[NSArray alloc]initWithObjects:NSLocalizedString(@"Message", nil),NSLocalizedString(@"Phone", nil), nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedData];
    segmentedControl.tintColor = [UIColor colorWithWhite:0.94 alpha:1];
    segmentedControl.selectedSegmentIndex = 0;//默认选中的按钮索引
    /*下面的代码实同正常状态和按下状态的属性控制,比如字体的大小和颜色等*/
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:12],NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName,nil];
    
    [segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:27/255.0f green:166/255.0f blue:225/255.0f alpha:1] forKey:NSForegroundColorAttributeName];
    
    [segmentedControl setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
    
    //设置分段控件点击相应事件
    [segmentedControl addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segmentedControl;
}

- (void)doSomethingInSegment:(id)sender {
    NSLog(@"do some thing");
}

#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"newsCell";
    NewsCustomerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[NewsCustomerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.selectionStyle = UITableViewCellAccessoryNone;
    News *customer = [[News alloc]init];
    customer = [self.newsList objectAtIndex:indexPath.row];
    cell.headImage.image = customer.headImage;
    cell.text.text = customer.name;
    cell.subtext.text = customer.lastContent;
    cell.time.text = customer.lastTime;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatViewController *chat = [[ChatViewController alloc]init];
    [self pushNewViewController:chat];
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
