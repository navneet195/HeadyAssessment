//
//  FeatureWidget.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 13/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//


import UIKit

class FeatureWidget: UIView
{
    // MARK: - Properties
    
    // variable
    var selectedCategory:Categories?
    let reuseIdentifier = "FeatureCell" // also enter this string as the cell identifier in the storyboard
    weak var delegate: UserActionDelegate?
    
    // outlet
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadViewFromNib ()
        return
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib ()
    }
}


extension FeatureWidget
{
    override func layoutSubviews() {
        
        categoryCollectionView.register(UINib(nibName: reuseIdentifier , bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.reloadData()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top:5, left:5, bottom:5, right: 5)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 17
        categoryCollectionView!.collectionViewLayout = layout
        categoryCollectionView.isScrollEnabled = false
        collectionWillFinishLoading()
        
    }
    
    func collectionWillFinishLoading()
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 , execute:
            {
                // Put your code which should be executed with a delay here
                self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: self.categoryCollectionView.contentSize.height+40)
                self.superview?.setHeightContrainwith(height: self.categoryCollectionView.contentSize.height+40)
                self.delegate?.heightForCollection(for: Int(self.categoryCollectionView.contentSize.height)+40)
        })
    }
    
    func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "FeatureWidget", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        
    }
    
    func loadProductWidget(selectedCategory:Categories)
    {
        self.selectedCategory = selectedCategory
        categoryCollectionView.reloadData()
        collectionWillFinishLoading()
    }
    
  
}
extension FeatureWidget: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
{
    
    // MARK: - Collectionview DataSource & Delegate
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.selectedCategory?.cate_products?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! FeatureCell
        
        let product:Products = (self.selectedCategory?.cate_products![indexPath.row])!
        let titleName = product.product_name
        cell.lblItemName.text = titleName
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((UIScreen.main.bounds.width-20) / 2)-14
        return CGSize(width: width , height: width)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let mProductDetailVC = UIStoryboard.init(name: "ProductDetail", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductDetailVC") as? ProductDetailVC
        let product:Products = (self.selectedCategory?.cate_products![indexPath.row])!
        mProductDetailVC?.product = product
        mProductDetailVC?.relevantProduct = Algorithms.shared.getAllRelevantProduct(product_id: product.product_id, products: self.selectedCategory?.cate_products)
        self.parentViewController?.navigationController?.pushViewController(mProductDetailVC!, animated: true)
        
    }
    
}

