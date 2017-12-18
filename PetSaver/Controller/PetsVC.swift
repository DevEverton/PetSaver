//
//  PetsVC.swift
//  PetSaver
//
//  Created by Everton Carneiro on 18/12/17.
//  Copyright © 2017 Everton. All rights reserved.
//

import UIKit

private let cellIdentifier = "petCell"

class PetsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let petCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        petCell.backgroundColor = .white
        petCell.layer.cornerRadius = 8
        return petCell
    }



}


extension PetsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 300)
    }
    
}











