//
//  XibCollectionViewControoler.swift
//  cBae
//
//  Created by muzna on 2020/12/07.
//

import UIKit
import Alamofire

class XibViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    }
    func fetch() {
        
        let reqUrl = "https://api.unsplash.com/photos"
        
        let parameters: Parameters = [
            "client_id": secureId, // security , 씨케
            "page": "3",
            "per_page": "20"
        ]
        
        let resp = AF.request(reqUrl, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil)
        
        resp.responseJSON { response in
           // print(json.data)
            
            guard let dataOfResponse = response.data else{
                return
            }
            do {
                let final = try JSONDecoder().decode([UnsplashModel].self, from: dataOfResponse)
                print("final:\(final)")

            } catch let error {
                print("Error result: \(error)")
                //wLog("decoding err:\(error.localizedDescription)")
            }
            
//            guard let dataOfResponse = response.data else{
//                return
//            }
//            do {
//                let final = try JSONDecoder().decode(UnsplashModel.self, from: dataOfResponse)
//
//                print("final:\(final)")
////                completion(final)
//
//            } catch let error {
//                print("decoding err:\(error.localizedDescription)")
//            }
            
        }
}
}
