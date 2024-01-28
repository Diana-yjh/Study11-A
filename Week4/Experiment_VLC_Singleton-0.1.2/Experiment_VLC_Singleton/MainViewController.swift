//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class PointManager {
    // PointManager 클래스를 싱글턴 패턴으로 변경하고, shared 라는 이름의 단일 인스턴스를 만들어봅시다.
    static let shared = PointManager()
    var point: Int = 50

    //혹시라도 Init함수를 호출해 Instance를 또 생성해 주는 것을 막기위해 private 접근 제어
    private init() {
        
    }
}

class MainViewController: UIViewController {
    @IBOutlet weak var yayaPoint: UILabel!
    let pointManager = PointManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Root View Did Load")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Root View Did Appear")
        //yayaPoint.text = String(pointManager.point)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Root View Will Appear")
        yayaPoint.text = String(pointManager.point)
    }
    
    @IBAction func buyProduct(_ sender: UIButton) {
        guard let buyingViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyingViewController") as? BuyingViewController else {
            return
        }
        buyingViewController.modalPresentationStyle = .fullScreen
        self.present(buyingViewController, animated: true)
    }
    
    
}

