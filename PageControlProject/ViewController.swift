//
//  ViewController.swift
//  PageControlProject
//
//  Created by Omer Keskin on 11.07.2024.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    private var pageViewController: UIPageViewController!
    private var pageControl: UIPageControl!

    private let pageData: [(backgroundColor: UIColor, labelColor: UIColor, labelText: String, imageName: String)] = [
        (.red, .white, "Page 1", "mcqueen"),
        (.blue, .yellow, "Page 2", "sally"),
        (.green, .red, "Page 3", "mater"),
        (.yellow, .black, "Page 4", "hudson")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self

        if let firstPage = viewControllerAtIndex(0) {
            pageViewController.setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        }

        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)

 
        pageControl = UIPageControl()
        pageControl.numberOfPages = pageData.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        view.addSubview(pageControl)

        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func viewControllerAtIndex(_ index: Int) -> PageViewController? {
        guard index >= 0 && index < pageData.count else {
            return nil
        }

        let pageVC = PageViewController()
        pageVC.pageIndex = index
        pageVC.backgroundColor = pageData[index].backgroundColor
        pageVC.labelColor = pageData[index].labelColor
        pageVC.labelText = pageData[index].labelText
        pageVC.imageName = pageData[index].imageName
        return pageVC
    }



    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let pageVC = viewController as? PageViewController else {
            return nil
        }

        var index = pageVC.pageIndex
        if index == 0 {
            return viewControllerAtIndex(pageData.count - 1)
        }
        index -= 1
        return viewControllerAtIndex(index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let pageVC = viewController as? PageViewController else {
            return nil
        }

        var index = pageVC.pageIndex
        index += 1
        if index == pageData.count {
            return viewControllerAtIndex(0)
        }
        return viewControllerAtIndex(index)
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed,
           let visibleViewController = pageViewController.viewControllers?.first as? PageViewController {
            pageControl.currentPage = visibleViewController.pageIndex
        }
    }
}

