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
    
    @IBOutlet var timerView: WKInterfaceTimer!
    
    var gameMin: Int = 10
    var gameSec: Int = 0
    var restMin: Int = 0
    var restSec: Int = 0
    var targetDate: Date = Date(timeIntervalSinceNow: TimeInterval(0))
    var suspendedTime: TimeInterval? = nil
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        resetTimer()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    @IBAction func stopTimer() {
        suspendedTime = targetDate.timeIntervalSinceNow
        timerView.stop()
    }
    
    @IBAction func startTimer() {

        timerView.start()
        if(suspendedTime != nil){
            //一時停止中なら、新しい時間を設定することで、一時停止を実現する
            targetDate = targetDate.addingTimeInterval(suspendedTime! - targetDate.timeIntervalSinceNow)
            suspendedTime = nil
        }
        else{
            targetDate = Date(timeIntervalSinceNow: TimeInterval(60 * gameMin + gameSec + 1) )
        }
        timerView.setDate(targetDate)
    }
    
    @IBAction func resetTimer() {
        
        timerView.stop()
        targetDate = Date(timeIntervalSinceNow: TimeInterval(60 * gameMin + gameSec + 1) )
        suspendedTime = nil
        timerView.setDate(targetDate)
    }

    @IBAction func openSetting() {
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func contextsForSegue(withIdentifier segueIdentifier: String) -> [Any]? {
        return [gameMin, gameSec, restMin, restSec]
    }

}
