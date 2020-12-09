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
        addCollectionView()
        
        //기본 cell을 사용할때는 아래처럼
        //col.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        //커스텀 Cell경우. 주의 nibName에는 실제 파일명이 들어가야 함. 여기는 identifier가 아님.
        col.register(UINib(nibName: "StarCell", bundle: nil), forCellWithReuseIdentifier: "scell")
        
        col.dataSource = self
      
        fetch()
    }
    func fetch() {
        
        let reqUrl = "https://api.unsplash.com/photos"
        //let secureId = "asdfasdfasdfasdfasdf"
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
    

     let col: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
         flowLayout.scrollDirection = .horizontal
         flowLayout.minimumLineSpacing = 0// (horizontal 경우 각각 cell간의 좌우 간격, veritcal인 경우 상하간격).
         flowLayout.minimumInteritemSpacing = 0 // hori 경우 상하간격, verti 경우 좌우간격.
         //flowLayout.sectionInset = UIEdgeInsets(top: 2, left: 20, bottom: 5, right: 20) //Section간의 간역설정시 필요.
         
         let cv = UICollectionView(frame: .init(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: flowLayout)
         flowLayout.itemSize = CGSize(width: 100, height: 100)
         
         cv.translatesAutoresizingMaskIntoConstraints = false
         cv.backgroundColor = .red
         return cv
     }()
}
extension XibViewController {
 
    func addCollectionView() {
        view.addSubview(col)
        
        NSLayoutConstraint.activate( [
        
            col.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            col.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            col.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            col.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}

extension XibViewController: UICollectionViewDataSource {
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scell", for: indexPath) as! StarCell
        cell.backgroundColor = .blue
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension XibViewController: UICollectionViewDelegate{}

