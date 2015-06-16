//
//  RequestController.swift
//  HttpClientDemo
//
//  Created by 邓龙 on 15/5/15.
//  Copyright (c) 2015年 www.beequick.cn. All rights reserved.
//

import UIKit

class RequestController: UIViewController, ToolProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //get请求代理实现
    func requestGetData(url:String) {
        var dl = HttpClient()
        dl.delegate = self
        dl.getDataDic(url)
    }
    
    //post不带data请求代理实现
    func requestPostData(url:String, dic:NSDictionary) {
        var dl=HttpClient()
        dl.delegate = self
        dl.postDataDic(url, dic: dic)
    }
    
    //post带data请求代理实现
    func requestPostHaveData(url:String) {
        var dl=HttpClient()
        dl.delegate = self
        dl.postHaveData(url)
        
    }

    //实现httpClient中得代理，成功调用此方法
    func didResponse(dict: NSDictionary) {
        var response = ResponseController.sharedManager()
        response.getResponseList(dict as [NSObject : AnyObject])
    }
}
