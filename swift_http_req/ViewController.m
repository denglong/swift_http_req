//
//  ViewController.m
//  swift_http_req
//
//  Created by denglong on 6/15/15.
//  Copyright (c) 2015 邓龙. All rights reserved.
//

#import "ViewController.h"
#import "ResponseController.h"

@interface ViewController ()<ToolDelegate>
{
    ResponseController *client;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    client = [ResponseController sharedManager];
    client.delegate = self;
    
    NSString *url = @"http://api.map.baidu.com/place/v2/search";
    NSDictionary *dic = @{@"q":@"宾馆", @"region":@"北京", @"output":@"json", @"ak":@"E4805d16520de693a3fe707cdc962045"};
    
    [client mothRequestPostUrl:url andDic:dic];
}

- (void)responseDicSussecd:(NSDictionary *)response {
    
}

- (void)responseDicFiled:(NSDictionary *)response {
    
}


@end
