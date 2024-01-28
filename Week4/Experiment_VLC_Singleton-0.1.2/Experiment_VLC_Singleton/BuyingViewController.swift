//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class BuyingViewController: UIViewController {
    let pointManager = PointManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Buying View Did Load")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Buying view Did Appear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Buying View Will Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Buying view Will Disappear")
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        rollBackScreen()
    }
    
    @IBAction func putBuyProductButton(_ sender: UIButton) {
        pointManager.point -= 50
//        dismiss(animated: true, completion: nil)
        rollBackScreen()
    }
    
    func rollBackScreen() {
        dismiss(animated: true, completion: nil)
    }
    
}
