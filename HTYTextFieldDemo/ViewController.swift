//
//  ViewController.swift
//  HTYTextFieldDemo
//
//  Created by  on 11/3/15.
//  Copyright © 2015 Hanton. All rights reserved.
//

import UIKit
import HTYTextField

class ViewController: UIViewController {
  
  @IBOutlet weak var emailTextField: HTYTextField!
  @IBOutlet weak var passwordTextField: HTYTextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    emailTextField.rightPlaceholder = "XXX@XXX.XX"
    passwordTextField.rightPlaceholder = "6-12 digits"
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
}

