//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class PointManager {
    static let shared = PointManager()
    
    var point: Int = 50
    
    private init() {
        
    }
}

class MainViewController: UIViewController {
    
    @IBOutlet var viewPoint: UILabel!
    @IBOutlet var restoreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPoint.text = String(PointManager.shared.point)
        print("MainView ViewDidLoad()")
        
    }
    
    @IBAction func restoreButtonClick(_ sender: Any) {
        print("restore Button Clicked")
        viewPoint.text = String(PointManager.shared.point)
    }
}

