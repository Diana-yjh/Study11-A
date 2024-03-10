//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class BuyingViewController: UIViewController {
    
    
    override func loadView() {
        super.loadView()
        print("BuyingView loadView()")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ByuingView viewDidLoad()")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("BuyingView viewWillAppear()")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("BuyingView viewDidApper()")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("BuyingView viewWillDisappear()")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("BuyingView viewDidDisappear()")
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buyButton(_ sender: Any) {
        PointManager.shared.point -= 50
        dismiss(animated: true, completion: nil)
    }
}
