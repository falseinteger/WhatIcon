//
//  MainCollectionViewController.swift
//  WhatIcon
//
//  Created by Дмитрий Порошков on 22.04.16.
//  Copyright © 2016 Dmitriy Poroshkov. All rights reserved.
//

import UIKit
import CoreData;
import iAd;

private let reuseIdentifier = "MainCell"

class MainCollectionViewController: UICollectionViewController {

    var dialog: UIDialogDetailView = UIDialogDetailView();
    
    let typeIcon = "wash";
    
    var ListSection = Dictionary<String,String>();
    var Items = Dictionary<String, [ItemIcon]>();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(MainCollectionViewCellHeader.self, forCellWithReuseIdentifier: "MainCellHeader")
        

        // Do any additional setup after loading the view.
        
        dialog = UIDialogDetailView(frame: view.bounds);
        navigationController?.view.addSubview(dialog);
        
        let result = Statics.GetDateIconsBy(typeIcon);
        Items = result.0;
        ListSection = result.1;
        
        self.canDisplayBannerAds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return Items.count
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return Items[Array(Items.keys)[section]]!.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MainCollectionViewCell;
    
        let item = Items[Array(Items.keys)[indexPath.section]]![indexPath.row];
        // Configure the cell
        cell.LoadView(item.nameImage);
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "MainCellHeader", forIndexPath: indexPath) as! MainCollectionViewCellHeader
            
             let item = ListSection[Items[Array(Items.keys)[indexPath.section]]![indexPath.row].section];
            
            headerView.LoadView(item!)
            return headerView
            
//        case UICollectionElementKindSectionFooter:
//            let footerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "Footer", forIndexPath: indexPath) as! UICollectionReusableView
//            
//            footerView.backgroundColor = UIColor.greenColor();
//            return footerView
            
        default:
            return UICollectionReusableView();
        }
    }

    // MARK: UICollectionViewDelegate

    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
    }

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        dialog.SetValue(Items[Array(Items.keys)[indexPath.section]]![indexPath.row])
        dialog.Show(true);
        
        return true
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(96 * Statics.GetScal(), 96 * Statics.GetScal())
    }
    
    func collectionView(collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                                 minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10 * Statics.GetScal();
    }
    
    func collectionView(collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                                 minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10 * Statics.GetScal();
    }
    
    func collectionView(collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                                 insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5 * Statics.GetScal(), left: 5 * Statics.GetScal(), bottom: 5 * Statics.GetScal(), right: 5 * Statics.GetScal());
    }
    

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */


}
