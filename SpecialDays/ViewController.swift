//
//  ViewController.swift
//  DaysUntil
//
//  Created by Robert on 7/8/17.
//  Copyright © 2017 Lent Coding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var output: UILabel!
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
        } else if date < Date() {
            let days = current.dateComponents([.day], from: current.date(bySettingHour: 12, minute: 00, second: 00, of: current.startOfDay(for: date))!, to: current.date(bySettingHour: 12, minute: 00, second: 00, of: current.startOfDay(for: Date()))!)
            let daysSince = days.day!
            output.textColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
            
            if daysSince == 1 {
                output.text = "\(dayOfWeek), \(month)/\(day)/\(year), was yesterday."
            } else {
                output.text = "\(dayOfWeek), \(month)/\(day)/\(year), was \(daysSince) days ago."
            }
        } else {
            let days = current.dateComponents([.day], from: current.date(bySettingHour: 12, minute: 00, second: 00, of: current.startOfDay(for: Date()))!, to: current.date(bySettingHour: 12, minute: 00, second: 00, of: current.startOfDay(for: date))!)
            let daysUntil = days.day!
            output.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            if daysUntil == 1 {
                output.text = "\(dayOfWeek), \(month)/\(day)/\(year), is tomorrow."
            } else {
                output.text = "\(dayOfWeek), \(month)/\(day)/\(year), is \(daysUntil) days away."
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changedDate(datePicker)
    }
    
}

