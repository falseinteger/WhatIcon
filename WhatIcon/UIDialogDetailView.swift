//
//  UIDialogDetailView.swift
//  WhatIcon
//
//  Created by Дмитрий Порошков on 22.04.16.
//  Copyright © 2016 Dmitriy Poroshkov. All rights reserved.
//

import UIKit

class UIDialogDetailView: UIDialogBaseView {

    var MainImage = UIImageView();
    var LabelInfo = UITextView();
    var ButtonCancel = UIButton();
    
    var NormalSize: CGFloat = 44;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        NormalSize = NormalSize * Statics.GetScal();
        
        BgViewInit(
            CGRect(
                x: 0,
                y: 0,
                width: (frame.width - NormalSize),
                height: frame.height - ((NormalSize - (NormalSize / 2)) * 6)
            ),
            bgColor: UIColor.whiteColor(),
            cornerRadius: 6
        );
        
        let someShrink = UIScreen.mainScreen().bounds.height > 480;
        print(UIScreen.mainScreen().bounds.height);
        
        //Размещений view по середине
        BgView.frame = CGRect(
            x: BgView.frame.origin.x,
            y: CenterY - ( (someShrink ? BgView.frame.height * 0.75 : BgView.frame.height) / 2) - (NormalSize / 2),
            width: BgView.frame.width,
            height: (someShrink ? BgView.frame.height * 0.75 : BgView.frame.height)
        );
        
        // bgview the center x and y
        let centerMainViewX = self.frame.width / 2;
        //let centerMainViewY = self.frame.height / 2;
        
        
        //Image
        MainImage = UIImageView(frame:
            CGRect(
                x: centerMainViewX - ((150 * Statics.GetScal()) / 2),
                y: BgView.frame.origin.y + (NormalSize / 2),
                width: (150 * Statics.GetScal()),
                height: (150 * Statics.GetScal()))
        );
        MainImage.contentMode = .ScaleAspectFit;
        MainImage.image = UIImage(named: "ic_test");
       
        MainView.addSubview(MainImage);
        
        
        //Label
        LabelInfo.frame = CGRect(
            x: centerMainViewX - ((BgView.frame.width - NormalSize) / 2),
            y: MainImage.frame.origin.y + MainImage.frame.height,
            width: BgView.frame.width - NormalSize,
            height: (BgView.frame.origin.x + BgView.frame.height) - (MainImage.frame.origin.x + MainImage.frame.height) + (NormalSize / 2)
        );
        LabelInfo.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        LabelInfo.textAlignment = .Center;
        LabelInfo.editable = false;
        LabelInfo.font = UIFont.systemFontOfSize(18);
        
        MainView.addSubview(LabelInfo);
        
        
        //Button
        ButtonCancel.frame = CGRect (
            x: (frame.width - (frame.width - NormalSize)) / 2,
            y: frame.height - NormalSize - (NormalSize / 2),
            width: frame.width - NormalSize,
            height: NormalSize
        );
        
        ButtonCancel.InitClassic(ButtonCancel);
        ButtonCancel.setTitle("Close".localized, forState: UIControlState.Normal);
        ButtonCancel.addTarget(self, action: #selector(UIDialogDetailView.pressed(_:)), forControlEvents: .TouchUpInside);
        
        MainView.addSubview(ButtonCancel);
        
        
        print("UIDialogDetailView init");
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func SetValue(item: ItemIcon){
        LabelInfo.text = item.nameIcon;
        MainImage.image = UIImage(named: item.nameImage);
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        super.drawRect(rect);
        print("UIDialogDetailView BgViewInit");
    }
    
    func pressed(sender: UIButton!) {
        Hide(true);
        print("UIDialogDetailView ButtonCancel pressed");
    }
    
    override func Show(animated: Bool, actionCompletion: () -> () = {}) {
        self.LabelInfo.setContentOffset(CGPointZero, animated: false);
        super.Show(animated, actionCompletion: actionCompletion);
    }
    
    override func Hide(animated :Bool, removeView: Bool = false, actionCompletion: () -> () = {}) {
        super.Hide(animated, removeView: removeView, actionCompletion: actionCompletion);
        
    }
 

}
