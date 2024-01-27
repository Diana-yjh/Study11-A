//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class PointManager {
    static let shared = PointManager()

    var point: Int = 150
    
    private init() { }
    
    func buy(price: Int) {
        if self.point - price >= 0 {
            self.point -= price
        } else {
            print("포인트가 부족합니다.")
        }
    }
}

class MainViewController: UIViewController {
    @IBOutlet weak var yagomAcademyPoint: UILabel!
    @IBOutlet weak var transitionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainViewController - \(#function)")
        
        self.updatePoint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        print("MainViewController - \(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        print("MainViewController - \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        print("MainViewController - \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(false)
        print("MainViewController - \(#function)")
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        self.updatePoint()
    }
    
    func updatePoint() {
        yagomAcademyPoint.text = "\(PointManager.shared.point)"
    }
}
