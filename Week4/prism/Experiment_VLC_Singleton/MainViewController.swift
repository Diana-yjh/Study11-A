//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshYaaPoint()
        
        print("(Main)ViewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("(Main)ViewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("(Main)ViewDidAppear")
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        
        print("(Main)ViewIsAppearing")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("(Main)ViewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("(Main)ViewDidDisappear")
    }
    
    @IBOutlet var currentYaaPointLabel: UILabel!
    
    @IBAction func touchUpRefreshYaaPointButton() {
        refreshYaaPoint()
    }
    
    func refreshYaaPoint() {
        currentYaaPointLabel.text = String(PointManager.shared.point)
    }
    
}

