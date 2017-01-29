//
//  TimerSettingInterfaceController.swift
//  TimeWatchApp
//
//  Created by JobaraMasashi on 2017/01/29.
//  Copyright © 2017年 ProjectJ. All rights reserved.
//

import WatchKit
import Foundation


class TimerSettingInterfaceController: WKInterfaceController {

    var gameMin: Int = 0
    var gameSec: Int = 0
    var restMin: Int = 0
    var restSec: Int = 0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        /**
        let ary: [Any]? = context!
        gameMin = ary[0]
        gameSec = ary[1]
        restMin = ary[2]
        restSec = ary[3]
        **/
    }
    

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
