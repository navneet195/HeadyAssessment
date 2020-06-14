//
//  HomeVC.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 10/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit
class HomeVC: UIViewController
{
    //outlet
    @IBOutlet weak var subProductView: UIView!
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var categoryView: UIView!
    
    //variable
    var mProductView : FeatureWidget?
    var mSubProductView : SubProductView?
    private var postService = PostNetworkService(appStore: appDelegate().store)
    private var getId = [String]()
    private var heghtCache: [Int: CGFloat] = [:]
    
}

extension HomeVC
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        /// service call for product data
        apiCallConfigure()
        navigationController?.navigationBar.isHidden = true
    }
    
    // navigation to search
    @IBAction func searchButton(_ sender: Any)
    {
        let vc = UIStoryboard.init(name: "Search", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchProductsVC") as? SearchProductsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}



private extension HomeVC
{
    /// service call for product data
    func apiCallConfigure()
    {
        
        let task = postService.getAPICallConfigureTask { (object, response, error) in
            guard error == nil else { return }
            Algorithms.shared.responceData = object
            DispatchQueue.main.async {
                self.configureUI()
            }
        }
        task.resume()
    }
    
    func configureUI()
    {
        let mCategoryView : CategoryView =  CategoryView(frame: CGRect(x: 0, y: 0,width: UIScreen.main.bounds.width, height: 100 ))
        mCategoryView.loadCategoryWidget(allData:Algorithms.shared.responceData!)
        mCategoryView.delegate = self
        self.categoryView.addSubview(mCategoryView)
        
        self.mProductView =  FeatureWidget(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 10))
        self.mProductView?.delegate = self
        self.mProductView!.loadProductWidget(selectedCategory: (Algorithms.shared.responceData?.categories![0])!)
        self.productView.addSubview(self.mProductView!)
        
        mSubProductView = SubProductView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 10))
        mSubProductView?.delegate = self
        self.subProductView.addSubview(mSubProductView!)
        
    }
}

extension HomeVC: UserActionDelegate
{
    
    /// for heights for collectionview
    ///
    /// - Parameter selectedCategory: to check for cell selectedCategory
    
    func heightForCollection(for height: Int)
    {
        print("product height")
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.mProductView?.frame.size.height = CGFloat(height)
            self.mProductView?.sizeToFit()
            self.mProductView?.layoutIfNeeded()
        })
        
    }
    
    /// for heights for Tableview
    ///
    /// - Parameter selectedCategory: to check for cell selectedCategory
    
    func heightForTableview(for height: Int)
    {
        print("sub categories height")
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.mSubProductView?.frame.size.height = CGFloat(height)
            self.mSubProductView?.sizeToFit()
            self.mSubProductView?.layoutIfNeeded()
        })
    }
    
    
    /// for share tap
    ///
    /// - Parameter selectedCategory: to check for cell selectedCategory
    
    func selectedCategory(for category: Categories)
    {
        print("user selected category")
        self.mProductView!.loadProductWidget(selectedCategory: category)
        
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


