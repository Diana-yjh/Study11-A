//
//  ViewController.swift
//  CoreGraphicsExamples
//
//  Created by Jaehun Lee on 5/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var burgerView: BurgerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        burgerView.layer.borderWidth = 1
    }
}

