//
//  PriceTagView.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 13/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//
import UIKit


class PriceTagView: UIView {
    
    // MARK: Properties
 
    var price: Int? { didSet { updatePrice() } }
    var priceType: Variants.PriceType? { didSet { updatePriceType() } }
    
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var priceTypeLabel: UILabel!
    
    
    // MARK: Lifecycle
    // outlet
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadViewFromNib ()
        return
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib ()
    }
    
    
    
    func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PriceTagView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
      
        self.addSubview(view)
        updatePrice()
        priceTypeLabel.font = .systemFont(ofSize: 16, weight: .light)
        priceTypeLabel.textColor = UIColor.black.withAlphaComponent(0.23)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    // MARK: Private functions
    
    private func updatePrice() {
        guard let price = price else {
            priceLabel.text = ""
            return
        }
        priceLabel.text = "1"
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        formatter.locale = .init(identifier: "US")
        
        let formattedPrice = formatter.string(from: NSNumber(value: price)) ?? ""
        let dotIndex = formattedPrice.range(of: ".")!.upperBound
        let firstPartRange = NSRange(formattedPrice.startIndex...dotIndex, in: formattedPrice)
        let secondPartRange = NSRange(dotIndex..<formattedPrice.endIndex, in: formattedPrice)
        let attributedText = NSMutableAttributedString(string: formattedPrice)
        attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 20, weight: .semibold), range: firstPartRange)
        attributedText.addAttribute(.foregroundColor, value: UIColor.black.withAlphaComponent(0.69), range: firstPartRange)
        attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 16, weight: .regular), range: secondPartRange)
        attributedText.addAttribute(.foregroundColor, value: UIColor.black.withAlphaComponent(0.49), range: secondPartRange)
        priceLabel.attributedText = attributedText
    }
    
    private func updatePriceType() {
        guard let priceType = priceType else {
            priceTypeLabel.text = "per unit"
            return
        }
        priceTypeLabel.text = priceType.localizedDescription
    }
    
}

extension Variants {
    enum PriceType {
        case unit
        
        var localizedDescription: String {
            switch self {
            case .unit:
                return "per unit"
            }
        }
    }
}
