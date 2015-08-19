//
//  ActivityLsitTableViewController.m
//  LessonUI_18_KVO检测图片下载
//
//  Created by lanou3g on 15/7/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ActivityLsitTableViewController.h"
#import "ActivityCell.h"
#import "Activity.h"
#define ActivityListAPI @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/activitylist.php"

@interface ActivityLsitTableViewController ()

@property (nonatomic,retain) NSMutableArray * activityArray;

@end

@implementation ActivityLsitTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.URL对象
    NSURL * url = [NSURL URLWithString:ActivityListAPI];
    //2.创建请求对象
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    //防止block里循环引用
    __weak ActivityLsitTableViewController * activityTC = self;
    //3.连接对象
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //创建存放model对象的数组模型
        self.activityArray = [NSMutableArray array];
        
        //解析数据
        NSMutableDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        //创建数组
        NSMutableArray * eventsArray = dic[@"events"];
        //遍历数组
        for (NSDictionary * dict in eventsArray) {
            Activity * activity = [[Activity alloc]init];
            [activity setValuesForKeysWithDictionary:dict];
            [activityTC.activityArray  addObject:activity];
        }
        [activityTC.tableView reloadData];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.activityArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activityCell" forIndexPath:indexPath];
    
    Activity * activity = self.activityArray[indexPath.row];
    
    cell.activity = activity;
    //如果activity为nil图片还没有下载下来,此时要去下载图片
    if (activity.picture == nil) {
        [activity loadImage];
        NSLog(@"%@",activity.picture);
        //注册观察者
        [activity addObserver:self forKeyPath:@"picture" options:NSKeyValueObservingOptionNew context:(__bridge void *)(indexPath)];//MRC下是indexPath retain
        NSLog(@"%@",activity.picture);
    } else {
        cell.imgView.image = activity.picture;
        NSLog(@"%@",activity.picture);
    }
    
    return cell;
}

//2.实现观察者的回调方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //图片有了,观察者应该实现在次方法中实现刷新相应的cell上的imageView
    //1.获取picture改变后的新值,即得到那个下载完成了的picture
    UIImage *image = [change objectForKey:@"new"];
    //2.获取注册观察者时,传过来的context
    NSIndexPath * indexpath = (__bridge NSIndexPath *)context;
    //3.获取当前屏幕上正在显示的cell
    NSArray * showArray = [self.tableView indexPathsForVisibleRows];
    //4.判断当前activity对象(或其picture)是否对应当前showArray中正在显示的cell
    if ([showArray containsObject:indexpath]) {
        //根据indexpath获得cell
        ActivityCell * cell = (ActivityCell *)[self.tableView cellForRowAtIndexPath:indexpath];
        //给获得cell赋值
        cell.imgView.image = image;
    }
    
    //手动刷新某些行
    [self.tableView reloadRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationRight];
    
    //移除观察者
    [object removeObserver:self forKeyPath:@"picture" context:(__bridge void *)(indexpath)];
    
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
