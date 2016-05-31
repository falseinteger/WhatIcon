//
//  ItemIcon.swift
//  WhatIcon
//
//  Created by Дмитрий Порошков on 24.04.16.
//  Copyright © 2016 Dmitriy Poroshkov. All rights reserved.
//

import Foundation


class ItemIcon {
    
    var nameIcon: String;
    var nameImage: String ;
    var section: String;
    
    init(nameIcon: String, nameImage: String, section: String)
    {
        self.nameIcon = nameIcon;
        self.nameImage = nameImage;
        self.section = section;
    }
}