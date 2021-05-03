import UIKit
import SwiftUI
import os.log
/*
class RadioViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Radio"
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        os_log("RadioViewController (%p) will transition to width %f", self, size.width)
    }

}*/


class RadioViewController: UINavigationController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
struct RadioView: View{
    var body: some View{
        Text("Radio View")
    }
}


 extension RadioViewController{
    func initRadioViewController() -> UINavigationController {
    let vc = UIHostingController(rootView: Text("UIKit is PooPoo!"))
    vc.tabBarItem = UITabBarItem(title: "Radio",
                                 image: UIImage(systemName: "dot.radiowaves.left.and.right"),
                                 tag: 2)
    let uiNC = UINavigationController(rootViewController: vc)
    uiNC.navigationBar.topItem?.title = "Radio"
    uiNC.navigationBar.prefersLargeTitles = true
    uiNC.navigationItem.largeTitleDisplayMode = .automatic
    return uiNC
    }
    
}
