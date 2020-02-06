//
//  ViewController.swift
//  API call using Aamofire
//
//  Created by Bhanuteja on 02/02/20.
//  Copyright © 2020 annam. All rights reserved.
//

import UIKit
import ObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getWebserviceCall()
//        postWebserviceCall()
    }
}

//MARK: GET WebserviceCall
extension ViewController{
    func getWebserviceCall(){
        let requestURL = "https://api.stackexchange.com/2.2/questions?order=desc&sort=votes&site=stackoverflow"
        NetworkManager.shared.dataTaskWithGetRequest(urlrequest: requestURL) { (result, status) in
            if status{
                DispatchQueue.main.async {
                    let response = result.dictionaryObject!
                    let dicresponse = response as [String: AnyObject]
                    let data = Mapper<GETDetailsResponse>().map(JSONObject: dicresponse)
                    print(data?.quotaMax ?? 0)
                }}}
    }
}

//MARK: POST WebserviceCall
extension ViewController{
    func postWebserviceCall(){
        //Provide your request 'body' here in Dictionary format
        let parameterDictionary = ["userName": "bhanuAnnam",
                                   "password": "password"]
        NetworkManager.shared.dataTaskWithPostRequest(urlrequest: "http://localhost:4567/login",
                                                      params: parameterDictionary) { (result, status) in
            DispatchQueue.main.async {
                if status{
                    let response = result.dictionaryObject!
                    _ = response as [String: AnyObject]
                    //we can parse this response same as 'getWebserviceCall' response
                }}}}
}
