//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class BuyingViewController: UIViewController {
    @IBOutlet weak var buyButton: UIButton!
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("BuyingViewController - \(#function)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        print("BuyingViewController - \(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        print("BuyingViewController - \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        print("BuyingViewController - \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(false)
        print("BuyingViewController - \(#function)")
    }
    
    @IBAction func buyButtonTapped(_ sender: UIButton) {
        PointManager.shared.buy(price: 50)
        dismiss(animated: true)
    }
}
