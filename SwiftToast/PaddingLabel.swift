//
//  PaddingLabel.swift
//  SwiftToast
//
//  Created by Thuc Nguyen on 4/13/20.
//  Copyright © 2020 Thuc Nguyen. All rights reserved.
//

import Foundation
import UIKit

class PaddingLabel: UILabel {
    var topInset: CGFloat
    var bottomInset: CGFloat
    var rightInset: CGFloat
    var leftInset: CGFloat
    
    required init(withInsets top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat, _ frame: CGRect) {
        self.topInset = top
        self.bottomInset = bottom
        self.leftInset = left
        self.rightInset = right
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize{
        get{
            var contentSize = super.intrinsicContentSize
            contentSize.height += (topInset + bottomInset)
            contentSize.width += (leftInset + rightInset)
            return contentSize
        }
    }
}
