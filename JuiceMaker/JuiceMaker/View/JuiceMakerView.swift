//
//  JuiceMakerView.swift
//  JuiceMaker
//
//  Created by prism, gray on 1/23/24.
//

import UIKit

protocol JuiceMakerViewDelegate {
    func juiceMakerViewPresentStockEditView()
    func juiceMakerViewJuiceOrderButtonTouchedUp(_ view: JuiceMakerView, juice: Juice)
}

class JuiceMakerView: UIView {
    var delegate: JuiceMakerViewDelegate?
    
    @IBOutlet var strawberryQuantity: UILabel!
    @IBOutlet var bananaQuantity: UILabel!
    @IBOutlet var pineappleQuantity: UILabel!
    @IBOutlet var kiwiQuantity: UILabel!
    @IBOutlet var mangoQuantity: UILabel!
    
    func updateFruitQuantityLabel(fruits: [Fruit: Int]) {
        for (fruit, quantity) in fruits {
            switch fruit {
            case .strawberry:
                strawberryQuantity.text = String(quantity)
            case .banana:
                bananaQuantity.text = String(quantity)
            case .pineapple:
                pineappleQuantity.text = String(quantity)
            case .kiwi:
                kiwiQuantity.text = String(quantity)
            case .mango:
                mangoQuantity.text = String(quantity)
            }
        }
    }
    
    @IBAction func touchUpStockEditButton(_ sender: UIBarButtonItem) {
        delegate?.juiceMakerViewPresentStockEditView()
    }
    
    @IBAction func touchUpJuiceOrderButton(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            delegate?.juiceMakerViewJuiceOrderButtonTouchedUp(self, juice: Juice.strawberryBanana)
        case 2:
            delegate?.juiceMakerViewJuiceOrderButtonTouchedUp(self, juice: Juice.mangoKiwi)
        case 3:
            delegate?.juiceMakerViewJuiceOrderButtonTouchedUp(self, juice: Juice.strawberry)
        case 4:
            delegate?.juiceMakerViewJuiceOrderButtonTouchedUp(self, juice: Juice.banana)
        case 5:
            delegate?.juiceMakerViewJuiceOrderButtonTouchedUp(self, juice: Juice.pineapple)
        case 6:
            delegate?.juiceMakerViewJuiceOrderButtonTouchedUp(self, juice: Juice.kiwi)
        case 7:
            delegate?.juiceMakerViewJuiceOrderButtonTouchedUp(self, juice: Juice.mango)
        default:
            break
        }
    }
}
