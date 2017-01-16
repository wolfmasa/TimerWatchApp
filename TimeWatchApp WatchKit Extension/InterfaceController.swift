//
//  InterfaceController.swift
//  TimeWatchApp WatchKit Extension
//
//  Created by JobaraMasashi on 2017/01/14.
//  Copyright © 2017年 ProjectJ. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    var timer: Timer!
    
    var hour: Int = 0
    var min: Int = 10
    var sec: Int = 0
    
    var hourDefault: Int = 0
    var minDefault: Int = 10
    var secDefault: Int = 0
    
    @IBOutlet var timerLabel: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    
    @IBAction func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
    }

    @IBAction func resetTimer() {
        hour = hourDefault
        min = minDefault
        sec = secDefault
    }

    @IBAction func openSetting() {
    }
    
    func updateView(){
        timerLabel.setText("\(hour):\(min):\(sec)")
    }
    
    func update(tm: Timer){
        sec += 1
        if sec >= 60 {
            min += 1
            sec = 0
        }
        if min >= 60{
            hour += 1
            min = 0
        }
        if hour >= 24{
            // do nothing
        }
        updateView()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
