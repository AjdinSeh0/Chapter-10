import UIKit

class ContactsViewController: UIViewController {

    @IBOutlet weak var sgmtEditMode: UISegmentedControl!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtZip: UITextField!
    @IBOutlet weak var txtCell: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var lblBirthday: UILabel!
    
    
    @IBOutlet weak var btnChange: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.changeEditMode(self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotifications()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardNotifications()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeEditMode(_ sender: Any) {
        let textFields: [UITextField] = [txtName, txtAddress, txtCity, txtState,
                                         txtZip, txtPhone, txtCell, txtEmail]

        if sgmtEditMode.selectedSegmentIndex == 0 {
            for textField in textFields {
                textField.isEnabled = false
                textField.borderStyle = .none
            }
            btnChange.isHidden = true
        } else if sgmtEditMode.selectedSegmentIndex == 1 {
            for textField in textFields {
                textField.isEnabled = true
                textField.borderStyle = .roundedRect
            }
            btnChange.isHidden = false
        }
    }

    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidShow(notification:)),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    func unregisterKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func keyboardDidShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else {
            return
        }

        let keyboardSize = keyboardFrame.cgRectValue.size
        var contentInset = self.scrollView.contentInset
        contentInset.bottom = keyboardSize.height

        self.scrollView.contentInset = contentInset
        self.scrollView.scrollIndicatorInsets = contentInset
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        var contentInset = self.scrollView.contentInset
        contentInset.bottom = 0

        self.scrollView.contentInset = contentInset
        self.scrollView.scrollIndicatorInsets = .zero
    }
}
