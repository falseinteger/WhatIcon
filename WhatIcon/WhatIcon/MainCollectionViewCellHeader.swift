//
//  MainCollectionViewCellHeader.swift
//  WhatIcon
//
//  Created by Дмитрий Порошков on 25.04.16.
//  Copyright © 2016 Dmitriy Poroshkov. All rights reserved.
//

import UIKit

class MainCollectionViewCellHeader: UICollectionReusableView {

    @IBOutlet weak var LabelTitle: UILabel!
    
    func LoadView(title: String)
    {
        LabelTitle.text = title;
    }
}
