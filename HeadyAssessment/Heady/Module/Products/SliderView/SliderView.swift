//
//  SliderView.swift
//  HeadyAssessment
//
//  Created by Navnit Baldha on 13/06/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit
import LIHImageSlider

class SliderView: UIView, LIHSliderDelegate {

    static let images: [UIImage] = [UIImage(named: "01")!, UIImage(named: "02")!, UIImage(named: "03")!, UIImage(named: "04")!, UIImage(named: "05")!]
    static let images_product: [UIImage] = [UIImage(named: "06")!, UIImage(named: "07")!, UIImage(named: "08")!, UIImage(named: "09")!, UIImage(named: "10")!]
    
   
    @IBOutlet weak var mainView: UIView!
    private var sliderVc1: LIHSliderViewController!
    var imageList : [UIImage]?
    var isProduct : Bool = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib ()
        return
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib ()
    }
    override func layoutSubviews() {
        
        var slider2: LIHSlider
        if (!isProduct)
        {
            slider2 = LIHSlider(images: SliderView.images)
        }
        else
        {
            slider2 = LIHSlider(images: SliderView.images_product)
        }
      
            //customizations
        slider2.transitionInterval = 3.0
        slider2.transitionStyle = UIPageViewController.TransitionStyle.scroll
        slider2.slidingOrientation = UIPageViewController.NavigationOrientation.horizontal
        slider2.sliderNavigationDirection = UIPageViewController.NavigationDirection.reverse
        slider2.showPageIndicator = true
        
        self.sliderVc1  = LIHSliderViewController(slider: slider2)
        sliderVc1.view.frame = self.mainView.bounds
        sliderVc1.delegate = self
        self.mainView.addSubview(self.sliderVc1.view)
      
    }
    
    func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "SliderView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
        layoutSubviews()
        
    }
    
    // delegate method
    func itemPressedAtIndex(index: Int) {
        
    }
}
