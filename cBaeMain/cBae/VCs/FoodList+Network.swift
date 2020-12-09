//
//  FoodList+Network.swift
//  cBae
//
//  Created by muzna on 2020/12/09.
//

import UIKit
import Alamofire

typealias SpalshHander = ([UnsplashModel])->Void
extension FoodListController {
    
    func fetch(handler: @escaping SpalshHander) {
        
        let reqUrl = "https://api.unsplash.com/photos"
        
        let parameters: Parameters = [
            "client_id": secureId,
            "page": "3",
            "per_page": "20"
        ]
        
        let resp = AF.request(reqUrl, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil)
        
        resp.responseJSON { response in
            
            guard let dataOfResponse = response.data else{
                return
            }
            do {
                let final = try JSONDecoder().decode([UnsplashModel].self, from: dataOfResponse)
                print("final:\(final)")
                handler(final)
            } catch let error {
                // 주의 secureId가 틀린 경우에도 error로 진입하게 됨.
                print("Error result: \(error)")
                //wLog("decoding err:\(error.localizedDescription)")
            }
        }
    }
}
