//
//  ProductsVC.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 13/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit

class ProductsVC: UIViewController
{
    //outlet
    @IBOutlet weak var allProductWidgetView: UIView!
    @IBOutlet weak var sliderView: UIView!
    //variable
    var mAllProductsWidget: AllProductsWidget?
}

extension ProductsVC
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.configureUI()
        
        // Do any additional setup after loading the view.
    }
    
    // navigation to search
    @IBAction func searchButton(_ sender: Any)
    {
        let vc = UIStoryboard.init(name: "Search", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchProductsVC") as? SearchProductsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func configureUI()
    {
        let aSliderView : SliderView =  SliderView(frame: CGRect(x: 0, y: 0,width: UIScreen.main.bounds.width  ,height: 220))
        aSliderView.isProduct = false
        self.sliderView.addSubview(aSliderView)
        
        self.mAllProductsWidget =  AllProductsWidget(frame: CGRect(x: 0, y: 10,width: UIScreen.main.bounds.width  ,height: 210))
        self.mAllProductsWidget?.delegate = self
        self.allProductWidgetView.addSubview(self.mAllProductsWidget!)
    }
}
extension ProductsVC: UserActionDelegate
{
    
    /// for heights for collectionview
    ///
    /// - Parameter selectedCategory: to check for cell selectedCategory
    
    func heightForCollection(for height: Int)
    {
        print("product height")
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.allProductWidgetView?.frame.size.height = CGFloat(height)
            self.allProductWidgetView?.sizeToFit()
            self.allProductWidgetView?.layoutIfNeeded()
        })
        
    }
    
    /// for heights for Tableview
    ///
    /// - Parameter selectedCategory: to check for cell selectedCategory
    
    func heightForTableview(for height: Int)
    {
        
    }
    
    
    /// for share tap
    ///
    /// - Parameter selectedCategory: to check for cell selectedCategory
    
    func selectedCategory(for category: Categories)
    {
        print("user selected category")
        
        
    }
    
    /// for  add to favourite tap
    ///
    /// - Parameter post: to check for cell post
    func addToFavourite(for product: Products)
    {
        //        if getId.contains(post.uuid) {
        //           self.getId.removeAll { $0 == post.uuid }
        //        }
        //        else
        //        {
        //            self.getId.append(post.uuid)
        //        }
    }
}

