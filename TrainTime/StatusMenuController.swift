import Cocoa

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    var timer: Timer?
    
    override func awakeFromNib() {
        statusItem.title = "Time until next train: ??"
        statusItem.menu = statusMenu
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTrainTime), userInfo: nil, repeats: true)
    }
    
    func updateTrainTime() {
        let nextTime = nextTrainTime(times: trainTimesAscending)
        let timeRemaining = timeUntil(time: nextTime)
        statusItem.title = "Time until next train: \(timeRemaining)"
    }
    
    @IBAction func quitClicked(_ sender: Any) {
        timer?.invalidate()
        NSApplication.shared().terminate(self)
    }
}
