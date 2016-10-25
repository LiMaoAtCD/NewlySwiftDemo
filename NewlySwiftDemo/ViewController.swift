//
//  ViewController.swift
//  NewlySwiftDemo
//
//  Created by limao on 2016/10/25.
//  Copyright © 2016年 limao. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NetworkWrapper.defaultWrapper.Get(parameters: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



let networkUrl = "http://localhost:3000/hello"
//let header = ["":""]
let header: [String: String]? = nil
class NetworkWrapper: NSObject {
    
    
    static let defaultWrapper = NetworkWrapper()
    
    private override init() {
    }
    
    
    func Get(parameters: Parameters?) {
        Alamofire.request(networkUrl, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: header).responseObject { (response: DataResponse<BaseResponse>?) in
            print(response?.debugDescription)
            let user = response?.result.value?.user
            print("user:" + "\(user)")
        }
    }
}

class BaseResponse: Mappable {
    required init?(map: Map) {
        
    }
    
    var user: String?
    
    func mapping(map: Map) {
        user <- map["user"]
    }
    
}

