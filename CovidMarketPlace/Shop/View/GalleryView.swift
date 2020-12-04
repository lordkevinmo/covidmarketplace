//
//  GalleryView.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 04/12/2020.
//

import UIKit

class GalleryView: UIPageViewControllerWithOverlayIndicator {
    private var currentIndex: Int = 0
    private var sliderViews = [SliderViewController]()
    
    var pageControl = UIPageControl()
    
    var sliderImageList: [ProductGallery] = [] {
        didSet {
            if sliderImageList.count > 0 {
                pageControl.isHidden = sliderImageList.count == 1
                
                for (idx, gallery) in sliderImageList.enumerated() {
                    let view = SliderViewController(with: gallery.image, idx: idx)
                    sliderViews.append(view)
                }
            } else {
                pageControl.isHidden = true
                sliderViews += [SliderViewController(with: nil, idx: 0)]
            }
        }
    }
    
    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //decoratePageControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupPageController()
    }

}

// MARK: Methods
extension GalleryView {
    /// Add configuration to page control instance
    private func decoratePageControl() {
        
        pageControl.pageIndicatorTintColor = UIColor.systemGray
        pageControl.currentPageIndicatorTintColor = UIColor.colorPrimary
        pageControl.numberOfPages = sliderViews.count
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            pageControl.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupPageController() {
        dataSource = self
        delegate = self
        
        if let sliderVC = sliderViews.first {
            setViewControllers([sliderVC], direction: .forward, animated: true, completion: nil)
        }
    }
}

extension GalleryView: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentVC = viewController as? SliderViewController else { return nil }
        
        var index = currentVC.index
        
        if index == 0 {
            return nil
        }
        
        index -= 1
        
        return sliderViews[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentVC = viewController as? SliderViewController else { return nil }
        
        var index = currentVC.index
        
        if index >= sliderImageList.count - 1 {
            return nil
        }
        
        index += 1
        
        return sliderViews[index]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return sliderImageList.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstVC = viewControllers?.first,
            let index = sliderViews.firstIndex(of: firstVC as! SliderViewController) else {
                return 0
        }
        return index
    }
}

extension GalleryView: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if finished {
            if completed {
                let cvc = pageViewController.viewControllers!.first as! SliderViewController
                let newIndex = cvc.index
                pageControl.currentPage = newIndex
                currentIndex = newIndex
                pageControl.tintColor = .black
                pageControl.currentPageIndicatorTintColor = UIColor.colorAccent
                pageControl.pageIndicatorTintColor = .black
            }
        }
    }
}
