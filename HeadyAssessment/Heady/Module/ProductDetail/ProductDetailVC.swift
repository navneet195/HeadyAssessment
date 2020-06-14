//
//  ProductDetailVC.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 13/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit
class ProductDetailVC: UIViewController {
    
    // MARK: Properties
    
    // variable
    var product : Products?
    var relevantProduct: [Products]?
    var mRelevantProductVC : RelevantProductVC?
    
    // outlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var heightConstrainRelevantProduct: NSLayoutConstraint!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var productVariantsView: UIView!
    @IBOutlet weak var releatedProductView: UIView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var productNameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var priceTagViewContainer: UIView!
    @IBOutlet private weak var quantityControllerContainer: UIView!
    
}

extension ProductDetailVC
{
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI()
    {
        productNameLabel.text = product?.product_name
        titleLabel.text = product?.product_name
        
        let aSliderView : SliderView =  SliderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 210))
        aSliderView.isProduct = true
        self.sliderView.addSubview(aSliderView)
        
        let mPriceTagView = PriceTagView()
        if (product?.variants?.count ?? 0 > 0)
        {
            let variants:Variants = (product?.variants![0])!
            mPriceTagView.price = variants.price
        }
        else
        {
            mPriceTagView.price = 1
        }
        
        self.priceTagViewContainer.addSubview(mPriceTagView)
        let mQuantityControllerView = QuantityControllerView()
        self.quantityControllerContainer.addSubview(mQuantityControllerView)
        
        mRelevantProductVC = RelevantProductVC(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
        mRelevantProductVC?.delegate = self
        mRelevantProductVC?.allProducts = relevantProduct
        self.releatedProductView.addSubview(mRelevantProductVC!)
        
        
        let mProductVariantsView : ProductVariantsView =  ProductVariantsView(frame: CGRect(x: 0, y: 0,width: UIScreen.main.bounds.width, height: 200))
        self.productVariantsView.addSubview(mProductVariantsView)
        
        
        
    }
    // MARK: Event listener
    @IBAction private func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}

extension ProductDetailVC: UserActionDelegate
{
    /// for heights for Tableview
    ///
    /// - Parameter selectedCategory: to check for cell selectedCategory
    
    func heightForTableview(for height: Int)
    {
        print("sub categories height")
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.heightConstrainRelevantProduct.constant = CGFloat(height)
            self.mRelevantProductVC?.frame.size.height = CGFloat(height)
            self.mRelevantProductVC?.sizeToFit()
            self.mRelevantProductVC?.layoutIfNeeded()
        })
    }
    
    func heightForCollection(for height: Int) {
        
    }
    
    func selectedCategory(for category: Categories) {
        
    }
    
    func addToFavourite(for product: Products) {
        
    }
}


