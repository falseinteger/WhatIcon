//
//  AboutViewController.swift
//  WhatIcon
//
//  Created by Дмитрий Порошков on 08.05.16.
//  Copyright © 2016 Dmitriy Poroshkov. All rights reserved.
//

import UIKit;
import MessageUI;

class AboutViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var MainImage: UIImageView!
    @IBOutlet weak var LabelInfo: UILabel!
    
    let nsObjectShortVersion: AnyObject? = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"]
    let nsObjectVersion: AnyObject? = NSBundle.mainBundle().infoDictionary?["CFBundleVersion"] as? String
    
    override func viewDidLoad() {
        
        MainImage.layer.cornerRadius = 8;
        
        LabelInfo.text =
            "Version".localized + (nsObjectShortVersion as! String) +
            "\r\n" +
            "Build".localized + (nsObjectVersion as! String);
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell!;
        switch cell.reuseIdentifier! {
        case "writedeveloper":
            launchEmail();
        case "recommendfriends":
            displayShareSheet("RecommendFriends".localized);
        case "websitevk":
            UIApplication.sharedApplication().openURL(NSURL(string: "https://vk.com/whaticon")!)
        case "websitefb":
            UIApplication.sharedApplication().openURL(NSURL(string: "https://fb.com/whaticon")!)
        default: break
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        
    }

    @IBAction func ButtonClose(sender: AnyObject) {
        navigationController?.dismissViewControllerAnimated(true, completion: nil);
    }
    
    
    func displayShareSheet(shareContent:String) {
        let activityViewController = UIActivityViewController(activityItems: [shareContent as NSString], applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: {})
    }
    
    func launchEmail() {
        
        let emailTitle = "Feedback".localized
        let messageBody = "MessageBody".localized
        let toRecipents = ["teamWhaticon@gmail.com"]
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setSubject(emailTitle)
        mc.setMessageBody(messageBody, isHTML: false)
        mc.setToRecipients(toRecipents)
        
        self.presentViewController(mc, animated: true, completion: nil)
    }
    
    func mailComposeController(controller:MFMailComposeViewController, didFinishWithResult result:MFMailComposeResult, error:NSError?) {
        switch result {
        case MFMailComposeResultCancelled:
            print("Mail cancelled")
        case MFMailComposeResultSaved:
            print("Mail saved")
        case MFMailComposeResultSent:
            print("Mail sent")
        case MFMailComposeResultFailed:
            print("Mail sent failure: \(error!.localizedDescription)")
        default:
            break
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
