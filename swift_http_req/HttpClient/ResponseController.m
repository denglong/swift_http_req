//
//  ResponseController.m
//  HttpClientDemo
//
//  Created by 邓龙 on 15/5/15.
//  Copyright (c) 2015年 www.beequick.cn. All rights reserved.
//

#import "ResponseController.h"
#import "swift_http_req-swift.h"

@interface ResponseController ()

@end

@implementation ResponseController

+ (ResponseController *)sharedManager {
    
    static ResponseController *sharedMyManager = nil;
    
    @synchronized(self) {
        if (sharedMyManager == nil)
            
            sharedMyManager = [[self alloc] init];
    }
    return sharedMyManager;
}

//Get请求
- (void)mothRequestUrl:(NSString *)url {
    RequestController *request = [[RequestController alloc] init];
    [request requestGetData:url];
}

//不带NSDATA的post请求
- (void)mothRequestPostUrl:(NSString *)url andDic:(NSDictionary *)dic {
    RequestController *request = [[RequestController alloc] init];
    [request requestPostData:url dic:dic];
}

//带data的post请求
- (void)mothRequestPostHabeDataUrl:(NSString *)url {
    RequestController *request = [[RequestController alloc] init];
    [request requestPostHaveData:url];
}

/**
 * Method name: getResponseList
 * Description: 获取并处理请求后返回值
 * Parameter: dict
 * Parameter: 无
 */
- (void)getResponseList:(NSDictionary *)dict {
    NSInteger code = [[dict objectForKey:@"status"] integerValue];
    if (code == 200) {
        [self.delegate responseDicSussecd:dict];
    }
    else
    {
       [self.delegate responseDicFiled:dict];
    }
}

@end
