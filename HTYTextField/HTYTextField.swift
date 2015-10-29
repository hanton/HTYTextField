//
//  HTYBounceTextField.swift
//  HTYBounceTextFieldDemo
//
//  Created by  on 10/28/15.
//  Copyright © 2015 Hanton. All rights reserved.
//

import UIKit

class HTYTextField: UITextField {
  
  var rightPlaceholder: String = "" {
    didSet {
      rightPlaceholderLabel.text = rightPlaceholder
    }
  }
  
  private var fakePlaceholderLabel: UILabel!
  private var rightPlaceholderLabel: UILabel!
  private var translateX: CGFloat!
    {
    get {
      let attributes = [NSFontAttributeName: font!]
      let rightPlaceholderTextSize = rightPlaceholderLabel.text!.sizeWithAttributes(attributes)
      let rightPlaceholderTextWidth = rightPlaceholderTextSize.width
      let translateX = CGRectGetWidth(textRectForBounds(bounds)) - rightPlaceholderTextWidth
      return translateX
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    fakePlaceholderLabel = UILabel(frame: placeholderRectForBounds(bounds))
    fakePlaceholderLabel.font = font
    fakePlaceholderLabel.text = placeholder
    fakePlaceholderLabel.textColor = .lightGrayColor()
    fakePlaceholderLabel.alpha = 1.0
    addSubview(fakePlaceholderLabel)
    
    rightPlaceholderLabel = UILabel(frame: placeholderRectForBounds(bounds))
    rightPlaceholderLabel.font = font
    rightPlaceholderLabel.text = rightPlaceholder
    rightPlaceholderLabel.textColor = .lightGrayColor()
    rightPlaceholderLabel.alpha = 0.0
    addSubview(rightPlaceholderLabel)
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    NSNotificationCenter.defaultCenter().addObserver(self,
      selector: Selector("didBeginEditing:"),
      name: UITextFieldTextDidBeginEditingNotification,
      object: nil)
    NSNotificationCenter.defaultCenter().addObserver(self,
      selector: Selector("didEndEditing:"),
      name: UITextFieldTextDidEndEditingNotification,
      object: nil)
  }
  
  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self,
      name: UITextFieldTextDidBeginEditingNotification,
      object: nil)
    NSNotificationCenter.defaultCenter().removeObserver(self,
      name: UITextFieldTextDidEndEditingNotification,
      object: nil)
  }
  
  func didBeginEditing(notification: NSNotification) {
    placeholder = nil
    
    if notification.object === self {      
      UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .CurveEaseIn, animations: { () -> Void in
        if self.text!.isEmpty {
          self.fakePlaceholderLabel.transform = CGAffineTransformTranslate(self.fakePlaceholderLabel.transform, self.translateX, 0.0)
          self.fakePlaceholderLabel.alpha = 0.0
          
          self.rightPlaceholderLabel.transform = CGAffineTransformTranslate(self.rightPlaceholderLabel.transform, self.translateX, 0.0)
          self.rightPlaceholderLabel.alpha = 1.0
        }
        }, completion: nil)

    }
  }
  
  func didEndEditing(notification: NSNotification) {
    if notification.object === self {
      UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .CurveEaseIn, animations: { () -> Void in
        if self.text!.isEmpty {
          self.fakePlaceholderLabel.transform = CGAffineTransformTranslate(self.fakePlaceholderLabel.transform, -self.translateX, 0.0)
          self.fakePlaceholderLabel.alpha = 1.0
          
          self.rightPlaceholderLabel.transform = CGAffineTransformTranslate(self.rightPlaceholderLabel.transform, -self.translateX, 0.0)
          self.rightPlaceholderLabel.alpha = 0.0
        }
        }, completion: nil)
    }
  }
  
}
