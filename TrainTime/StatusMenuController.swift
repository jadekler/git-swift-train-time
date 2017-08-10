import Cocoa

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    var timer: Timer?
    var x = 0
    
    override func awakeFromNib() {
        statusItem.title = "TrainTime: ??"
        statusItem.menu = statusMenu
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTrainTime), userInfo: nil, repeats: true)
    }
    
    func updateTrainTime() {
        statusItem.title = "TrainTime: \(x)"
        x += 1
    }
    
    @IBAction func quitClicked(_ sender: Any) {
        timer?.invalidate()
        NSApplication.shared().terminate(self)
    }
}
