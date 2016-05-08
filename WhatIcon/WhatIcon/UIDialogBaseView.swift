//
//  UIDialogBaseView.swift
//  WhatIcon
//
//  Created by Дмитрий Порошков on 22.04.16.
//  Copyright © 2016 Dmitriy Poroshkov. All rights reserved.
//

import UIKit

class UIDialogBaseView: UIView {

    var BgView = UIView();
    var VisualEffectView = UIVisualEffectView();
    var CenterX : CGFloat = 0.0;
    var CenterY : CGFloat = 0.0;
    var MainView = UIView();
    var StartPostion = CGRect();
    var EndPostion = CGRect();
    
    override init(frame: CGRect) {
        
        CenterX = frame.width / 2;
        CenterY = frame.height / 2;
        
        StartPostion = CGRect(x: 0,y: frame.height,width: frame.width,height: frame.height);
        EndPostion = frame;
        
        super.init(frame: frame);
        
        self.opaque = false;
        self.alpha = 0;
        self.backgroundColor = UIColor.clearColor();
        self.autoresizingMask = [.FlexibleWidth, .FlexibleHeight];
        
        
        VisualEffectView.opaque = false;
        VisualEffectView.backgroundColor = UIColor.clearColor();
        VisualEffectView.frame = self.frame;
        VisualEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight];
        addSubview(VisualEffectView);
        
        
        MainView = UIView(frame: StartPostion);
        MainView.opaque = false;
        MainView.backgroundColor = UIColor.clearColor();
        addSubview(MainView);
       
       
        print("UIDialogBaseView init");

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        print("UIDialogBaseView drawRect");
    }
    
    func BgViewInit(frame: CGRect, bgColor: UIColor, cornerRadius: CGFloat, showShadow: Bool = false, offestByLocationY: CGFloat = 40)
    {

        BgView = UIView(frame:
            CGRect(
                x: CenterX - (frame.width / 2) - self.frame.origin.x,
                y: CenterY - (frame.height / 2) - (offestByLocationY * Statics.GetScal()) - self.frame.origin.y,
                width: frame.width,
                height: frame.height
            )
        );
        
        BgView.backgroundColor = bgColor;
        BgView.layer.cornerRadius = cornerRadius;
        
        if(showShadow) {
            BgView.layer.shadowOffset = CGSize (width: 0, height: 1.0);
            BgView.layer.shadowColor = UIColor.blackColor().CGColor;
            BgView.layer.shadowOpacity = 0.25;
        }
        
        self.MainView.addSubview(BgView);
        
        print("UIDialogBaseView BgViewInit");
    }
    
    
    func Show(animated :Bool, actionCompletion: () -> () = {})
    {
        self.alpha = 1;
        if(!animated) {
            self.alpha = 1;
            self.VisualEffectView.effect = UIBlurEffect(style: .Dark);
            self.MainView.frame = self.EndPostion;
            actionCompletion();
        }
        else {
            UIView.animateWithDuration(0.5, animations: {
                self.VisualEffectView.effect = UIBlurEffect(style: .Dark);
                self.MainView.frame = self.EndPostion
                }, completion: {
                    (value: Bool) in
                    actionCompletion();
                    
            });
        }
        print("UIDialogBaseView Show");
    }
    
    func Hide(animated :Bool, removeView: Bool = false, actionCompletion: () -> () = {})
    {
        if(!animated) {
            self.alpha = 0;
            self.VisualEffectView.effect = nil;
            self.MainView.frame = self.StartPostion;
            if(removeView) {
                actionCompletion();
                self.removeFromSuperview();
            }
        }
        else {
            UIView.animateWithDuration(0.5, animations: {
                self.VisualEffectView.effect = nil;
                self.MainView.frame = self.StartPostion;
             }, completion: {
                (value: Bool) in
                self.alpha = 0;
                actionCompletion();
                if(removeView) {
                    self.removeFromSuperview();
                }
            });
        }
        print("UIDialogBaseView Hide");
    }

}
