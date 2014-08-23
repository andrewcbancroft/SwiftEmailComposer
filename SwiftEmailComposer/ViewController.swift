import Foundation
import UIKit

class ViewController: UIViewController {
	let emailComposer = EmailComposer()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func sendEmailButtonTapped(sender: AnyObject) {
		self.emailComposer.present(inViewController: self)
	}
}