//
//  AppExtensions.swift
//  WhatIcon
//
//  Created by Дмитрий Порошков on 23.04.16.
//  Copyright © 2016 Dmitriy Poroshkov. All rights reserved.
//

import Foundation
import UIKit;


extension UIButton {
    
    public func InitClassic(button: UIButton!) {
        button.layer.cornerRadius = 9;
        button.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.85);
        button.setTitleColor (UIColor.blackColor(), forState: UIControlState.Normal);
        
        button.addTarget(
            self,
            action: #selector(UIButton.ClassicPressedTouchDragOutside(_:)),
            forControlEvents: .TouchDragOutside
        );
        button.addTarget(
            self,
            action: #selector(UIButton.ClassicPressedTouchDragOutside(_:)),
            forControlEvents: .TouchUpInside
        );
        button.addTarget(
            self,
            action: #selector(UIButton.ClassicPressedTouchDragInside(_:)),
            forControlEvents: .TouchDragInside
        );
        button.addTarget(
            self,
            action: #selector(UIButton.ClassicPressedTouchDown(_:)),
            forControlEvents: .TouchDown
        );
    }
    
    func ClassicPressedTouchDragOutside(sender: UIButton!) {
        sender.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.85);
        sender.setTitleColor (UIColor.blackColor(), forState: UIControlState.Normal);
        print("ClassicPressedTouchDragOutside");
    }
    func ClassicPressedTouchUpInside(sender: UIButton!) {
        sender.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.85);
        sender.setTitleColor (UIColor.blackColor(), forState: UIControlState.Normal);

        print("ClassicPressedTouchUpInside");
    }
    func ClassicPressedTouchDragInside(sender: UIButton!) {
        sender.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.65);
        sender.setTitleColor (UIColor.blackColor().colorWithAlphaComponent(0.65), forState: UIControlState.Normal);
        print("ClassicPressedTouchDragInside");
    }
    func ClassicPressedTouchDown(sender: UIButton!) {
        sender.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.65);
        sender.setTitleColor (UIColor.blackColor().colorWithAlphaComponent(0.65), forState: UIControlState.Normal);
        print("ClassicPressedTouchDown");
    }
    
}

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
}