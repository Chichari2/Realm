//
//  NameSurnameViewController.swift
//  Weather
//
//  Created by Артем Вологдин on 28.02.22.
//

import UIKit

class NameSurnameViewController: UIViewController {

    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBAction func actionName(_ sender: Any) {
        nameLabel.text = "\(nameTextField.text!)"
        Persistanse.shared.userName = "\(nameTextField.text!)"
    }
    

    
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var surnameTextFieldLabel: UITextField!
    @IBAction func actionSurname(_ sender: Any) {
        surnameLabel.text = "\(surnameTextFieldLabel.text!)"
        Persistanse.shared.userSurname = "\(surnameTextFieldLabel.text!)"
    }
    
   
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        nameLabel.text = "aaa"
        
        nameLabel.text = Persistanse.shared.userName
        surnameLabel.text = Persistanse.shared.userSurname
        
//        print(Persistanse.shared.userName)
//        print(Persistanse.shared.userSurname)
    }
    

   

}
