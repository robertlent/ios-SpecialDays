/*
  ViewController.swift
  SpecialDays

  Created by Robert on 7/8/17.
  Copyright © 2017 Lent Coding. All rights reserved.
*/

import UIKit
import Social

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var output: UILabel!
    var timeframe = 0
    var daysSince = 0
    var daysUntil = 0
/*    @IBOutlet weak var holidayPicker: UIPickerView!

    var thanksgivingComponents = DateComponents()
    thanksgivingComponents.month = 11
    thanksgivingComponents.weekday = 5
    thanksgivingComponents.weekdayOrdinal = 3
    let thanksgiving = String(describing: Calendar.current.date(from: thanksgivingComponents)!)
    
    var importantDates:[(holidays: String, dates: String)] = [("New Year's Day", ""), ("Martin Luther King, Jr Day", ""), ("Memorial Day", ""), ("Independance Day", "07/05"), ("Veteran's Day", ""), ("Thanksgiving Day", "\(thanksgiving)"), ("Christmas", "12/25")] */
    
    @IBAction func changedDate(_ sender: UIDatePicker) {
        let date = datePicker.date
        let current = Calendar.current
        
        let year = current.component(.year, from: date)
        let month = current.component(.month, from: date)
        let day = current.component(.day, from: date)
        
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let dayOfWeek = formatter.string(from: date)
        
        if Calendar.current.isDateInToday(date)  {
            output.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            output.text = "\(dayOfWeek), \(month)/\(day)/\(year), is today."
            timeframe = 0
        } else if date < Date() {
            let days = current.dateComponents([.day], from: current.date(bySettingHour: 12, minute: 00, second: 00, of: current.startOfDay(for: date))!, to: current.date(bySettingHour: 12, minute: 00, second: 00, of: current.startOfDay(for: Date()))!)
            daysSince = days.day!
            output.textColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
            
            if daysSince == 1 {
                output.text = "\(dayOfWeek), \(month)/\(day)/\(year), was yesterday."
            } else {
                output.text = "\(dayOfWeek), \(month)/\(day)/\(year), was \(daysSince) days ago."
            }
            
            timeframe = 1
        } else {
            let days = current.dateComponents([.day], from: current.date(bySettingHour: 12, minute: 00, second: 00, of: current.startOfDay(for: Date()))!, to: current.date(bySettingHour: 12, minute: 00, second: 00, of: current.startOfDay(for: date))!)
            daysUntil = days.day!
            output.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            if daysUntil == 1 {
                output.text = "\(dayOfWeek), \(month)/\(day)/\(year), is tomorrow."
            } else {
                output.text = "\(dayOfWeek), \(month)/\(day)/\(year), is \(daysUntil) days away."
            }
            
            timeframe = 2
        }
    }
    
    @IBAction func pressedShare(_ sender: UIButton) {
        let shareAlert = UIAlertController(title: "Share", message: "Share this Special Day!", preferredStyle: .actionSheet)
        
        let shareFacebook = UIAlertAction(title: "Share on Facebook", style: .default, handler: {(shareAlert: UIAlertAction!) in
            let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
            
            switch self.timeframe {
            case 1:
                if self.daysSince != 1 {
                    post.setInitialText("My Special Day was \(self.daysSince) days ago! I can't believe how quickly times flies! - Shared from Lent Coding's Special Days iOS app.")
                    post.add(URL(string: "https://github.com/robertmlent/ios-SpecialDays"))
                } else {
                    post.setInitialText("My Special Day was yesterday! Did you know? - Shared from Lent Coding's Special Days iOS app.")
                    post.add(URL(string: "https://github.com/robertmlent/ios-SpecialDays"))
                }
            case 2:
                if self.daysUntil != 1 {
                    post.setInitialText("My Special Day is in \(self.daysUntil) days! I can't wait! - Shared from Lent Coding's Special Days iOS app.")
                    post.add(URL(string: "https://github.com/robertmlent/ios-SpecialDays"))
                } else {
                    post.setInitialText("My Special Day is tomorrow! I didn't think I would make it! - Shared from Lent Coding's Special Days iOS app.")
                    post.add(URL(string: "https://github.com/robertmlent/ios-SpecialDays"))
                }
            default:
                post.setInitialText("My Special Day is today! I feel like I've waited forever! - Shared from Lent Coding's Special Days iOS app.")
                post.add(URL(string: "https://github.com/robertmlent/ios-SpecialDays"))
            }
            post.add(UIImage(named: "iPad-ProApp-83.5@2x.png"))
            
            self.present(post, animated: true, completion: nil)
        })
        
        let shareTwitter = UIAlertAction(title: "Share on Twitter", style: .default, handler: {(shareAlert: UIAlertAction!) in
            let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
            
            switch self.timeframe {
            case 1:
                if self.daysSince != 1 {
                    post.setInitialText("My Special Day was \(self.daysSince) days ago! Time flies! - Shared from Lent Coding's Special Days iOS app.")
                    post.add(URL(string: "https://github.com/robertmlent/ios-SpecialDays"))
                } else {
                    post.setInitialText("My Special Day was yesterday! Did you know? - Shared from Lent Coding's Special Days iOS app.")
                    post.add(URL(string: "https://github.com/robertmlent/ios-SpecialDays"))
                }
            case 2:
                if self.daysUntil != 1 {
                    post.setInitialText("My Special Day is in \(self.daysUntil) days! I can't wait! - Shared from Lent Coding's Special Days iOS app.")
                    post.add(URL(string: "https://github.com/robertmlent/ios-SpecialDays"))
                } else {
                    post.setInitialText("My Special Day is tomorrow! I didn't think I would make it! - Shared from Lent Coding's Special Days iOS app.")
                    post.add(URL(string: "https://github.com/robertmlent/ios-SpecialDays"))
                }
            default:
                post.setInitialText("My Special Day is today! I feel like I've waited forever! - Shared from Lent Coding's Special Days iOS app.")
                post.add(URL(string: "https://github.com/robertmlent/ios-SpecialDays"))
            }
            post.add(UIImage(named: "iPad-ProApp-83.5@2x.png"))
            
            self.present(post, animated: true, completion: nil)
        })
        
        let cancelShare = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        shareAlert.addAction(shareFacebook)
        shareAlert.addAction(shareTwitter)
        shareAlert.addAction(cancelShare)
        
        self.present(shareAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changedDate(datePicker)
    }
    
}

