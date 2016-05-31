//
//  Statics.swift
//  WhatIcon
//
//  Created by Дмитрий Порошков on 24.04.16.
//  Copyright © 2016 Dmitriy Poroshkov. All rights reserved.
//

import Foundation;
import UIKit;

class Statics {
    
    static func GetScal() -> CGFloat
    {
        return UIScreen.mainScreen().bounds.width / 320;
    }
    
    static func GetDateIconsBy(type: String) -> (Dictionary<String, [ItemIcon]>, Dictionary<String, String>)
    {
        let data = NSData(contentsOfURL: NSBundle.mainBundle().URLForResource("data." + type, withExtension: "json")!)
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            if let dictionary = object as? [String: AnyObject] {
                return readJSONObjectIconsAndSections(dictionary,type: type)
            }
            return (Dictionary<String, [ItemIcon]>(), Dictionary<String, String>());
        } catch {
            print("can't load data");
            return (Dictionary<String, [ItemIcon]>(), Dictionary<String, String>());
        }
    }
    
    static func readJSONObjectIconsAndSections(object: [String: AnyObject], type: String) -> (Dictionary<String, [ItemIcon]>, Dictionary<String, String>) {
        
        guard let version = object["Version"] as? String else { return (Dictionary<String, [ItemIcon]>(), Dictionary<String, String>()); }
        
        if(version != "1") {
            return (Dictionary<String, [ItemIcon]>(), Dictionary<String, String>());
        }
        
        let sections = object["Sections"] as? [[String: AnyObject]]
        
        var dataSections = Dictionary<String, String>();
        
        for item in sections! {
            guard
                let section = item["section"] as? String,
                let sectionName = item["sectionName"] as? String
                else { break }
            
            dataSections[section] = sectionName;
        }
        
        let icons = object["Icons"] as? [[String: AnyObject]]
        
        var data = Dictionary<String, [ItemIcon]>();
        
        for item in icons! {
            guard
                let section = item["section"] as? String,
                let nameIcon = item["nameIcon"] as? String,
                let nameImage = item["nameImage"] as? String
                else { break }
            
            let newItem = ItemIcon(nameIcon: nameIcon, nameImage: nameImage, section: section );
            if(data[section] != nil) {
                data[section]?.append(newItem);
            } else {
                data[section] = [newItem];
            }
        }
        
        return (data, dataSections);
    }
    
}