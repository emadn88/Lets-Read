//
//  MainPageViewController.swift
//  Lets Read
//
//  Created by Emad Abd on 27/05/2022.
//

import UIKit
import AVFoundation
var player: AVAudioPlayer?


class MainPageViewController: UIPageViewController {
    
    weak var mainDelegate: MainPageViewControllerDelegate?
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        // The view controllers will be shown in this order
        return [self.newColoredViewController("P1"),
            self.newColoredViewController("P2"),
            self.newColoredViewController("P3"),
        self.newColoredViewController("P4"),
        self.newColoredViewController("P5"),
        self.newColoredViewController("P6"),
        self.newColoredViewController("P7"),
        self.newColoredViewController("P8")]
        
//        self.newColoredViewController("P9"),
//        self.newColoredViewController("P10")
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        if let initialViewController = orderedViewControllers.first {
            scrollToViewController(viewController: initialViewController)
        }
        
        mainDelegate?.mainPageViewController(mainPageViewController: self, didUpdatePageCount: orderedViewControllers.count)
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "page-flip", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    

    /**
     Scrolls to the next view controller.
     */
    func scrollToNextViewController() {
        if let visibleViewController = viewControllers?.first,
            let nextViewController = pageViewController(self, viewControllerAfter: visibleViewController) {
                    scrollToViewController(viewController: nextViewController)
        }
    }
    
    /**
     Scrolls to the view controller at the given index. Automatically calculates
     the direction.
     
     - parameter newIndex: the new index to scroll to
     */
    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = viewControllers?.first,
            let currentIndex = orderedViewControllers.firstIndex(of: firstViewController) {
            let direction: UIPageViewController.NavigationDirection = newIndex >= currentIndex ? .forward : .reverse
                let nextViewController = orderedViewControllers[newIndex]
                scrollToViewController(viewController: nextViewController, direction: direction)
        }
    }
    
    func newColoredViewController(_ color: String) -> UIViewController {
        
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "\(color)ViewController")
        
    }
    
    /**
     Scrolls to the given 'viewController' page.
     
     - parameter viewController: the view controller to show.
     */
    private func scrollToViewController(viewController: UIViewController,
                                        direction: UIPageViewController.NavigationDirection = .forward) {
        setViewControllers([viewController],
            direction: direction,
            animated: true,
            completion: { (finished) -> Void in
                // Setting the view controller programmatically does not fire
                // any delegate methods, so we have to manually notify the
                // 'mainDelegate' of the new index.
                self.notifyMainDelegateOfNewIndex()
        })
    }
    
    /**
     Notifies '_tutorialDelegate' that the current page index was updated.
     */
    private func notifyMainDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.firstIndex(of: firstViewController) {
            mainDelegate?.mainPageViewController(mainPageViewController: self, didUpdatePageIndex: index)
            
        }
    }
    
}

// MARK: UIPageViewControllerDataSource

extension MainPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
                return nil
            }
            
            let previousIndex = viewControllerIndex - 1
            
            // User is on the first view controller and swiped left to loop to
            // the last view controller.
            guard previousIndex >= 0 else {
                playSound()

                return orderedViewControllers.last
            }
            
            guard orderedViewControllers.count > previousIndex else {
                return nil
            }
            
           playSound()
            return orderedViewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
                return nil
            }
            
            let nextIndex = viewControllerIndex + 1
            let orderedViewControllersCount = orderedViewControllers.count
            
            // User is on the last view controller and swiped right to loop to
            // the first view controller.
            guard orderedViewControllersCount != nextIndex else {
                return orderedViewControllers.first
                playSound()
            }
            
            guard orderedViewControllersCount > nextIndex else {
                return nil
            }
            
            playSound()

            return orderedViewControllers[nextIndex]
    }
    
}

extension MainPageViewController: UIPageViewControllerDelegate {
    
    private func pageViewController(pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool) {
        notifyMainDelegateOfNewIndex()
    }
    
}

protocol MainPageViewControllerDelegate: AnyObject {
    
    /**
     Called when the number of pages is updated.
     
     - parameter MainPageViewController: the MainPageViewController instance
     - parameter count: the total number of pages.
     */
    func mainPageViewController(mainPageViewController: MainPageViewController,
        didUpdatePageCount count: Int)
    
    /**
     Called when the current index is updated.
     
     - parameter mainPageViewController: the MainPageViewController instance
     - parameter index: the index of the currently visible page.
     */
    func mainPageViewController(mainPageViewController: MainPageViewController,
        didUpdatePageIndex index: Int)
    
}
