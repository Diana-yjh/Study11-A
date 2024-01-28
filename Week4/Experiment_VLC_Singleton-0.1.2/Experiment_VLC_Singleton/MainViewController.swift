//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class PointManager {
    static let shared = PointManager()
    
    private init() {}
    
    var point: Int = 50
}
/* 화면 Presentation 방식
 1. Auto: 자동(현재는 화면 부분만 채우는 modal형식)
 2. FullScreen: 화면 전체를 덮는 풀스크린
 3. Current Context: 현재는 FullScreen과 다를바가 없음
 4. Page Sheet: 현재는 화면 부분만 채움(1과 동일)
 5. Form Sheet: 1, 4와 동일
*/
//View가 어느 시점에 메모리에 올라가는지
//왜 두 번째 View가 먼저 올라오고 첫 번째 View가 사라지는지

//loadView()
//https:|//developer.apple.com/documentation/uikit/uiviewcontroller/1621454-loadview
class MainViewController: UIViewController {
    @IBOutlet var pointLabel: UILabel!
    
//    override func loadView() {
//        super.loadView()
//        print("loadView in MainViewController")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print("viewDidLoad in MainViewController")
//
//        let view = self.storyboard?.instantiateViewController(withIdentifier: "BuyingViewController") as? BuyingViewController
//        view.modalPresentationStyle = .pageSheet
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("viewWillAppear in MainViewController")
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        print("viewDidAppear in MainViewController")
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        print("viewWillDisappear in MainViewController")
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        print("viewDidDisappear in MainViewController")
//    }
    
    //MARK: - Step 2
    override func loadView() {//
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad in MainViewController")
        
        pointLabel.text = String(PointManager.shared.point)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    @IBAction func refreshPoint(_ sender: UIButton) {
        pointLabel.text = String(PointManager.shared.point)
    }
}

