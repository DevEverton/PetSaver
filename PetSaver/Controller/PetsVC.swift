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
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var topViewHeighConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.removeTabbarItemsText()

    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let petCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PetCell
        
        petCell.backgroundColor = .white
        petCell.layer.cornerRadius = 8
        petCell.userName.text = "Carla Lisboa"
        petCell.userLocation.text = "Parauapebas - PA"
        petCell.userProfilePicture.image = #imageLiteral(resourceName: "perfilCarla").circle
        petCell.petPicture.image = #imageLiteral(resourceName: "gato")
        petCell.petDescription.text = "Gatinhos para adoção, bairro União"
        

        return petCell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.5) {
            self.topViewHeighConstraint.constant = 35
            self.titleLabel.textAlignment = .center
            self.titleLabel.frame = CGRect(x: 5, y: 5, width: self.topView.frame.width, height: self.topView.frame.height)
            self.titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        }

    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.5) {
            self.topViewHeighConstraint.constant = 70
            self.titleLabel.textAlignment = .left
            self.titleLabel.frame = CGRect(x: 5, y: 5, width: self.topView.frame.width, height: self.topView.frame.height)
        }
    }
    



}

extension PetsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height - 150)
    }
    
}

extension UIImage {
    var circle: UIImage {
        let square = size.width < size.height ? CGSize(width: size.width, height: size.width) : CGSize(width: size.height, height: size.height)
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.image = self
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContext(imageView.bounds.size)
        imageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
}

extension UIViewController {
    
    func removeTabbarItemsText() {
        if let items = tabBarController?.tabBar.items {
            for item in items {
                item.title = ""
                item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
            }
        }
    }
    
}











