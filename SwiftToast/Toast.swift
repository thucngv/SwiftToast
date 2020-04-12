//
//  Toast.swift
//  SwiftToast
//
//  Created by Thuc Nguyen on 4/13/20.
//  Copyright © 2020 Thuc Nguyen. All rights reserved.
//

import Foundation
import UIKit

public final class Toast {
    private var _textColor: UIColor
    private var _backgroundColor: UIColor
    private var _label: PaddingLabel
    private let _controller: UIViewController
    
    required init(_ controller: UIViewController, label: PaddingLabel, font: UIFont, textColor: UIColor, backgroundColor: UIColor) {
        _controller = controller
        _label = label
        _textColor = textColor
        _backgroundColor = backgroundColor
    }
    
    
    public static func makeText(_ controller: UIViewController, text: String, font: UIFont = UIFont.systemFont(ofSize: 17), theme: Toast.theme = .system, textColor: UIColor = .white, backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.8)) -> Toast
    {
        var labelWidth: CGFloat = 0
        let screenWidth = UIScreen.main.bounds.size.width
        if (UIDevice.current.userInterfaceIdiom != .phone || screenWidth >= 420)
        {
            labelWidth = 400
        }else
        { labelWidth = screenWidth * 0.835 }
        
        let constraintRect = CGSize(width: labelWidth - 14, height: .greatestFiniteMagnitude)
        let rect = text.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        let labelHeight = ceil(rect.height) + 18
        
        let label = PaddingLabel.init(withInsets: 7, 7, 7, 7, CGRect(x: (controller.view.frame.size.width - labelWidth) / 2, y: controller.view.frame.size.height-100, width: labelWidth, height: labelHeight ))
        
        var bgColor = backgroundColor
        var txtColor = textColor
        if(theme == .system)
        {
            if controller.traitCollection.userInterfaceStyle == .light {
                bgColor = UIColor.black.withAlphaComponent(0.8)
                txtColor = .white
            } else {
                bgColor = UIColor.white.withAlphaComponent(0.8)
                txtColor = .black
            }
        }
        else if(theme == .dark)
        {
            bgColor = UIColor.black.withAlphaComponent(0.8)
            txtColor = .white
        }
        else if(theme == .light)
        {
            bgColor = UIColor.white.withAlphaComponent(0.8)
            txtColor = .black
        }
        
        label.backgroundColor = bgColor
        label.textColor = txtColor
        
        label.font = font
        label.textAlignment = .center
        label.text = text
        label.alpha = 1.0
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.clipsToBounds = true
        label.layer.cornerRadius = labelHeight / 2
        
        return Toast(controller, label: label, font: font, textColor: textColor, backgroundColor: backgroundColor)
    }
    
    public func show(){
        _controller.view.addSubview(_label)
        UIView.animate(withDuration: 0.5, delay: 3.0, options: .curveEaseOut, animations: {self._label.alpha = 0.0}, completion: {(isCompleted) in self._label.removeFromSuperview() })
    }
    
    public enum theme {
        case system
        case dark
        case light
        case custom
    }
}
