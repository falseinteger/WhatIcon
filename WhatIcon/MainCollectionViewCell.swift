//
//  MainCollectionViewCell.swift
//  WhatIcon
//
//  Created by Дмитрий Порошков on 22.04.16.
//  Copyright © 2016 Dmitriy Poroshkov. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var MainImage: UIImageView!
    func LoadView(nameImage: String)
    {
        MainImage.contentMode = .ScaleAspectFit;
        MainImage.image = UIImage(named: nameImage);
        self.layer.cornerRadius = 8.0;
    }
    
}
