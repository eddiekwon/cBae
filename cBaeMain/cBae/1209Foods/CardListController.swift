//
//  FoodListController.swift
//  cBae
//
//  Created by muzna on 2020/12/09.
//

import UIKit

enum AppSize {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}
private let reuseIdentifier = "Cell"

class CardListController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCollectionView()
        //커스텀 Cell경우. 주의 nibName에는 실제 파일명이 들어가야 함. 여기는 identifier가 아님.
        col.register(UINib(nibName: "StarCell", bundle: nil), forCellWithReuseIdentifier: "scell")
        
        col.dataSource = self  
    }
    
    let col: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 0// (horizontal 경우 각각 cell간의 좌우 간격, veritcal인 경우 상하간격).
        flowLayout.minimumInteritemSpacing = 0 // hori 경우 상하간격, verti 경우 좌우간격.
        //flowLayout.sectionInset = UIEdgeInsets(top: 2, left: 20, bottom: 5, right: 20) //Section간의 간역설정시 필요.
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        flowLayout.itemSize = CGSize(width: AppSize.width/2, height: AppSize.width/2)
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .red
        return cv
    }()
}
extension CardListController {
    
    func addCollectionView() {
        view.addSubview(col)
        
        NSLayoutConstraint.activate( [
            
            col.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            col.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            col.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            col.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1)
            //col.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}

extension CardListController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
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

extension CardListController: UICollectionViewDelegate{}
 
