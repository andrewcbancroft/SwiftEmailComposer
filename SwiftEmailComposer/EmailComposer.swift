import Foundation
import MessageUI

class EmailComposer: NSObject, MFMailComposeViewControllerDelegate {
	
	func present(inViewController presentingViewController: UIViewController) {
		let mailComposeViewController = configuredMailComposeViewController()
		if MFMailComposeViewController.canSendMail() {
			presentingViewController.presentViewController(mailComposeViewController, animated: true, completion: nil)
		} else {
			self.showSendMailErrorAlert()
		}
	}
	
	func configuredMailComposeViewController() -> MFMailComposeViewController {
		let mailComposerVC = MFMailComposeViewController()
		mailComposerVC.mailComposeDelegate = self
		
		mailComposerVC.setToRecipients(["someone@somewhere.com"])
		mailComposerVC.setSubject("Sending you an in-app e-mail...")
		mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)
		
		return mailComposerVC
	}
	
	func showSendMailErrorAlert() {
		let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
		sendMailErrorAlert.show()
	}
	
	// MARK: MFMailComposeViewControllerDelegate Method
	func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
		controller.dismissViewControllerAnimated(true, completion: nil)
	}

}