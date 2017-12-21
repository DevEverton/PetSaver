//
//  CadastrarVC.swift
//  PetSaver
//
//  Created by Everton Carneiro on 20/12/17.
//  Copyright © 2017 Everton. All rights reserved.
//

import UIKit

class CadastrarVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var textViewTopConstraint: NSLayoutConstraint!
    
    var textViewinputText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.removeTabbarItemsText()
        setupTextView()
        
        
    }
    
    func setupTextView(){
        descriptionTextView.layer.cornerRadius = 8
        descriptionTextView.text = "Breve descrição sobre o pet"
        descriptionTextView.textColor = .lightGray
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        descriptionTextView.text = textViewinputText
        descriptionTextView.textColor = .black
        UIView.animate(withDuration: 0.3) {
            self.textViewTopConstraint.constant = 38
            self.view.layoutIfNeeded()
        }
    }
    

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            UIView.animate(withDuration: 0.3) {
                self.view.endEditing(true)
                self.textViewTopConstraint.constant = 80
                self.view.layoutIfNeeded()
                self.textViewinputText = self.descriptionTextView.text

            }
            return false
        }
        return true
    }
    
    
    
    @IBAction func addPicture(_ sender: Any) {
    }
    
    @IBAction func registerPet(_ sender: Any) {
    }
    

}
