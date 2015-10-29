//
//  ViewController.swift
//  HTYTextFieldDemo
//
//  Created by  on 10/29/15.
//  Copyright © 2015 Hanton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var emailTextField: HTYTextField!
  @IBOutlet weak var passwordTextField: HTYTextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

    emailTextField.rightPlaceholder = "xxx@xxx.xx"
    passwordTextField.rightPlaceholder = "6~12 digits"
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    view.endEditing(true)
  }

}

