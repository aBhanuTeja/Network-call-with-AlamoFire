//
//  NetworkMAnager.swift
//  API call using Aamofire
//
//  Created by Bhanuteja on 02/02/20.
//  Copyright © 2020 annam. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

class NetworkManager: NSObject {
    
    let myWindow: UIWindow? = nil
    static let shared = NetworkManager()
    private override init() {
    }
    
    func dataTaskWithGetRequest(urlrequest : String, completionHandler: @escaping (_ result: JSON, Bool) -> ()){
        print(urlrequest)
        let queue = DispatchQueue(label: "com.cnoon.manager-response-queue",
                                  qos: .userInitiated,
                                  attributes:.concurrent)
        AF.request(urlrequest, method: .get,
                   parameters: [:],
                   encoding: URLEncoding.default,
                   headers: nil)
            .responseJSON(queue: queue,
                          options: .allowFragments,
                          completionHandler: { (response: AFDataResponse<Any>) in
                            switch(response.result){
                            case .success(_):
                                if response.response?.statusCode == 200{
                                    do{
                                        //Play around here according to you JSON response
                                        let resultVal = try JSON(data: response.data!)
                                        print(resultVal)
                                        completionHandler(resultVal, true)
                                    }catch{
                                    }
                                }
                                else{
                                    print("It seems server error")
                                }
                                break
                            case .failure(_):
                                print("It seems server error")
                                break
                            }
            })
    }
    
    func dataTaskWithPostRequest(urlrequest : String, params: [String: Any]? = nil, completionHandler: @escaping (_ result: JSON, Bool) -> ()){
        print(urlrequest)
        print(params!)
        let queue = DispatchQueue(label: "com.cnoon.manager-response-queue",
                                  qos: .userInitiated,
                                  attributes:.concurrent)
        AF.request(urlrequest, method: .post,
                   parameters: params,
                   encoding: JSONEncoding.default, headers: nil)
            .responseJSON(queue: queue, options: .allowFragments,
                          completionHandler: { (response: AFDataResponse<Any>) in
                            print(response)
                            switch(response.result) {
                            case .success(_):
                                if response.response?.statusCode == 200{
                                    do{
                                        //Play around here according to you JSON response
                                        let resultVal = try JSON(data: response.data!)
                                        print(resultVal)
                                    }catch {
                                    }
                                }
                                else{
                                    print("It seems server error")
                                }
                                break
                            case .failure(_):
                                print("It seems server error")
                            }
            })
    }
}
