//
//  LandingView.swift
//  CovidMarketPlace
//
//  Created by Moïse AGBENYA on 11/11/2020.
//

import UIKit

class LandingView: UIPageViewController {
    
    static let storyboardID = "landing-screeen"
    // all pages case
    var landings : [Landings] = Landings.allCases
    // current value of index
    var currentIndex = 0
    
    var pages: [UIViewController] {
        get {
            var views = [UIViewController]()
            for landing in landings {
                views.append(LandingContentRouter.assembleModule(with: landing))
            }
            return views
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        initView()
    }
}

// MARK: - Methods
extension LandingView {
    private func initView() {
        if let firstView = pages.first {
            setViewControllers([firstView], direction: .forward, animated: true, completion: nil)
        }
        
    }
}

// MARK: - Implementtation of UIPAgeviewControllerDatasource
extension LandingView: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentView = viewController as? LandingContentView else { return nil }
        
        var index = currentView.landing.index
        
        if index == .zero {
            return nil
        }
        
        index -= 1
        
        return pages[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentView = viewController as? LandingContentView else { return nil }
        
        var index = currentView.landing.index
        
        if index >= pages.count - 1 {
            return nil
        }
        
        index += 1
        
        return pages[index]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstView = viewControllers?.first,
              let index = pages.firstIndex(of: firstView as! LandingContentView) else {
            return .zero
        }
        
        return index
    }
}

// MARK: - Implementtation of UIPAgeviewControllerDelegate
extension LandingView: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if finished {
            if completed {
                let cvc = pageViewController.viewControllers!.first as! LandingContentView
                let newIndex = cvc.landing.index
                //pageControl.currentPage = newIndex
                currentIndex = newIndex
                //pageControl.tintColor = .black
                //pageControl.currentPageIndicatorTintColor = UIColor.colorAccent
                //pageControl.pageIndicatorTintColor = .black
            }
        }
    }
}
