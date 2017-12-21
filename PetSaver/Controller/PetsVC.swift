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
    
    var lastContentOffset: CGFloat = 0

    
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
        petCell.date.text = "22/12/2017"
        

        return petCell
    }
 
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffset < scrollView.contentOffset.y) {
            // moved to top
            UIView.animate(withDuration: 0.5, animations: {
                self.topViewHeighConstraint.constant = 20
                self.titleLabel.text = ""
                self.view.layoutIfNeeded()
            })
        } else if (self.lastContentOffset > scrollView.contentOffset.y) {
            // moved to bottom
            UIView.animate(withDuration: 0.5, animations: {
                self.topViewHeighConstraint.constant = 70
                self.titleLabel.text = "Buscar"
                self.view.layoutIfNeeded()

            })
            
        } else {
            // didn't move
        }
    }


}

//TODO: Fix autolayout of topbar and tabBar for iPhone X


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











