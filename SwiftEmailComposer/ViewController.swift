import Foundation
import UIKit

class ViewController: UIViewController {
    let emailComposer = EmailComposer()
    
    @IBAction func sendEmailButtonTapped(sender: AnyObject) {
        let configuredMailComposeViewController = emailComposer.configuredMailComposeViewController()
        if emailComposer.canSendMail() {
            presentViewController(configuredMailComposeViewController, animated: true, completion: nil)
        } else {
            showSendMailErrorAlert()
        }
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
}