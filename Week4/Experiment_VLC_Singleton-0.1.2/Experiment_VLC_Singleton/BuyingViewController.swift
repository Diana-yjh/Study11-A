//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class BuyingViewController: UIViewController {
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print("viewDidLoad in BuyingViewController")
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("viewWillAppear in BuyingViewController")
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("viewDidAppear in BuyingViewController")
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        print("viewWillDisappear in BuyingViewController")
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        print("viewDidDisappear in BuyingViewController")
//    }
    
    //MARK: - Step2
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad in BuyingViewController")
    }
    
    @IBAction func buyButton(_ sender: Any) {
        PointManager.shared.point -= 10
        dismiss(animated: true)
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
