//
//  ViewController.swift
//  Sample 2
//
//  Created by Enrique Bonilla on 26/02/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var containerUIStackView: UIStackView!
    @IBOutlet weak var viewContainer: UIView!
    
    lazy var addBagControl: AddBagControl = {
        let control = AddBagControl.loadFromNib()
        control.configure(bagClousure: { (stepValue) in
            print("Step Value \(stepValue)")
        })
        return control
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.containerUIStackView.addArrangedSubview(addBagControl)
    }


}

