import UIKit
import IHProgressHUD

extension UIViewController {
    func showLoadingView(status: String? = nil) {
        IHProgressHUD.show(withStatus: status)
        IHProgressHUD.set(defaultStyle: .dark)
    }
    
    func dismissLoading() {
        IHProgressHUD.dismiss()
    }
}
