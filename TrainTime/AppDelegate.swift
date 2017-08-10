//
//  AppDelegate.swift
//  TrainTime
//
//  Created by DeKlerk, Jean on 8/10/17.
//  Copyright © 2017 DeKlerk, Jean. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var statusMenu: NSMenu!
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)

    @IBAction func quitClicked(_ sender: Any) {
        NSApplication.shared().terminate(self)
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.title = "WeatherBar"
        statusItem.menu = statusMenu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

