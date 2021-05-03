import UIKit
import SwiftUI

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    private lazy var listenNowViewController = makeListenNowViewController()
    private lazy var browseViewController = makeBrowseViewController()
    private lazy var radioViewController = RadioViewController().initRadioViewController()
    private lazy var libraryViewController = makeLibraryViewController()
    private lazy var searchViewController = makeSearchViewController()
    public var currentViewNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [listenNowViewController,
                           browseViewController,
                           radioViewController,
                           libraryViewController,
                           searchViewController]
        self.selectedIndex = 1
        self.delegate = self
        
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let selectedIndex = tabBarController.selectedIndex
        print(selectedIndex)
        Settings.instance.tabSelection = selectedIndex
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedIndex = Settings.instance.tabSelection
    }

}

private extension TabBarController {

    private func makeListenNowViewController() -> UINavigationController {
        let vc = ListenNowViewController()
        vc.tabBarItem = UITabBarItem(title: "Listen Now",
                                     image: UIImage(systemName: "play.circle.fill"),
                                     tag: 0)
        return UINavigationController(rootViewController: vc)
    }

    private func makeBrowseViewController() -> UINavigationController {
        let vc = BrowseViewController()
        vc.tabBarItem = UITabBarItem(title: "Browse",
                                     image: UIImage(systemName: "square.grid.2x2.fill"),
                                     tag: 1)
        return UINavigationController(rootViewController: vc)
    }

    private func makeRadioViewController() -> UINavigationController {
        return RadioViewController().initRadioViewController()
    }

    private func makeLibraryViewController() -> UINavigationController {
        let vc = LibraryViewController()
        vc.tabBarItem = UITabBarItem(title: "Library",
                                     image: UIImage(systemName: "rectangle.stack.fill"),
                                     tag: 3)
        return UINavigationController(rootViewController: vc)
    }

    private func makeSearchViewController() -> UINavigationController {
        let vc = SearchViewController()
        vc.tabBarItem = UITabBarItem(title: "Search",
                                     image: UIImage(systemName: "magnifyingglass"),
                                     tag: 4)
        return UINavigationController(rootViewController: vc)
    }

}
