//
//  CadastrarVC.swift
//  PetSaver
//
//  Created by Everton Carneiro on 20/12/17.
//  Copyright © 2017 Everton. All rights reserved.
//

import UIKit

class CadastrarVC: UIViewController, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var tipoTextField: UITextField!
    @IBOutlet weak var generoTextField: UITextField!
    @IBOutlet weak var porteTextField: UITextField!
    @IBOutlet weak var idadeTextField: UITextField!
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var scrollViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    
    var textViewinputText = ""
    var lastContentOffset: CGFloat = 0

    var tipoPicker = UIPickerView()
    var generoPicker = UIPickerView()
    var portePicker = UIPickerView()
    var idadePicker = UIPickerView()
    
    
    let tipo = ["Cão", "Gato"]
    let genero = ["Macho", "Fêmea"]
    let porte = ["Pequeno", "Médio", "Grande"]
    let idade = ["De 0 a 3 meses", "De 3 a 6 meses", "De 6 meses a 1 ano", "Mais de 1 ano"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.removeTabbarItemsText()
        setupTextView()
        setUpPickerViews()

    }

    func setUpPickerViews() {
        pickerViewDelegate(tipoPicker)
        pickerViewDelegate(generoPicker)
        pickerViewDelegate(portePicker)
        pickerViewDelegate(idadePicker)
        
        tipoTextField.inputView = tipoPicker
        generoTextField.inputView = generoPicker
        porteTextField.inputView = portePicker
        idadeTextField.inputView = idadePicker
        
        changeColor(of: tipoPicker, to: .white)
        changeColor(of: generoPicker, to: .white)
        changeColor(of: portePicker, to: .white)
        changeColor(of: idadePicker, to: .white)
        
    }
    
    func changeColor(of pickerView: UIPickerView, to color: UIColor) {
        pickerView.backgroundColor = color
        
    }
    
    func pickerViewDelegate(_ pickerView: UIPickerView){
        pickerView.dataSource = self
        pickerView.delegate =  self
    }
    
    func setupTextView(){
        descriptionTextView.text = "Breve descrição sobre o pet"
        descriptionTextView.textColor = .lightGray
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        descriptionTextView.text = textViewinputText
        descriptionTextView.textColor = .black

    }
    

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            textViewinputText = descriptionTextView.text
            return false
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffset < scrollView.contentOffset.y) {
            // moved to top
            UIView.animate(withDuration: 0.5, animations: {
                self.topViewHeightConstraint.constant = 20
                self.scrollViewTopConstraint.constant = 0
                self.titleLabel.text = ""
                self.view.layoutIfNeeded()
            })
        } else if (self.lastContentOffset > scrollView.contentOffset.y) {
            // moved to bottom
            UIView.animate(withDuration: 0.5, animations: {
                self.topViewHeightConstraint.constant = 70
                self.scrollViewTopConstraint.constant = 46
                self.titleLabel.text = "Cadastrar"
                self.view.layoutIfNeeded()
                
            })
            
        } else {
            // didn't move
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView {
        case tipoPicker:
            return tipo.count
        case generoPicker:
            return genero.count
        case portePicker:
            return porte.count
        case idadePicker:
            return idade.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView {
        case tipoPicker:
            return tipo[row]
        case generoPicker:
            return genero[row]
        case portePicker:
            return porte[row]
        case idadePicker:
            return idade[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView {
        case tipoPicker:
            tipoTextField.text = tipo[row]
        case generoPicker:
            generoTextField.text = genero[row]
        case portePicker:
            porteTextField.text = porte[row]
        case idadePicker:
            idadeTextField.text = idade[row]
        default:
            break
        }
        
        self.view.endEditing(false)

    }
    

    @IBAction func addPicture(_ sender: Any) {
    }
    
    @IBAction func registerPet(_ sender: Any) {
    }
    

}
