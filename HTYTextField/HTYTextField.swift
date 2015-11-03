//
//  HTYBounceTextField.swift
//  HTYBounceTextFieldDemo
//
//  Created by  on 10/28/15.
//  Copyright © 2015 Hanton. All rights reserved.
//

import UIKit

public class HTYTextField: UITextField {
  
  public var rightPlaceholder: String = "" {
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
  
  required public init?(coder aDecoder: NSCoder) {
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
  
  // MARK: - UITextField Observing
  
  override public func willMoveToSuperview(newSuperview: UIView!) {
    if newSuperview != nil {
      NSNotificationCenter.defaultCenter().addObserver(self, selector: "didBeginEditing:", name:UITextFieldTextDidBeginEditingNotification, object: self)
      
      NSNotificationCenter.defaultCenter().addObserver(self, selector: "didEndEditing:", name:UITextFieldTextDidEndEditingNotification, object: self)
    } else {
      NSNotificationCenter.defaultCenter().removeObserver(self)
    }
  } 
  
  public func didBeginEditing(notification: NSNotification) {
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
  
  public func didEndEditing(notification: NSNotification) {
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
