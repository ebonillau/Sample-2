//
//  AddBagControl.swift
//  Sample 2
//
//  Created by Enrique Bonilla on 26/02/21.
//

import UIKit

class AddBagControl: UIControl, ViewLoadable {
    
    @IBOutlet weak var addToBagButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minussButton: UIButton!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var bottomStackView: UIStackView!
    
    static var nibName: String = "AddBagControl"
    
    var bagClousure: BagClousure?

    // MARK: Hide Add and Minus Buttons Logic
    
    var stepperValue: Int = 0 {
        didSet {
            let isHidden = stepperValue > 0
            addToBagButton.isHidden = isHidden
            bottomStackView.isHidden = !isHidden
            stepLabel.text = "\(stepperValue)"
        }
    }
    
    
    @IBAction func addToBagButton(_ sender: UIButton) {
        stepperValue = 1
        bagClousure?(stepperValue)
    }
    
    @IBAction func incrementButton(_ sender: UIButton) {
        guard stepperValue < 5 else { return }
        stepperValue += 1
        bagClousure?(stepperValue)
    }
    
    @IBAction func decrementButton(_ sender: UIButton) {
        guard stepperValue > 0 else { return }
        stepperValue -= 1
        bagClousure?(stepperValue)
    }
    
    typealias BagClousure = (Int) -> ()
    
    func configure(bagClousure: @escaping BagClousure) {
        stepperValue = 0
        self.bagClousure = bagClousure
    }
    
}

struct AddBagViewModel {
    let title: String
    let stepValue: Int
    let showStepper: Bool
    
    init(title: String, stepValue: Int) {
        self.title = title
        self.stepValue = stepValue
        self.showStepper = stepValue > 0
    }
}

extension AddBagControl {
    func onAddToBag() -> AddBagViewModel {
        
    }
}
