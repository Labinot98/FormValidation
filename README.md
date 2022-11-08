# FormValidation

## Installation

To install this package, import `url here` in SPM.

## Usage example

``` swift

class RegisterViewController: UIViewController {
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    var formValidationDelegate: FormValidationProtocol?

        override func viewDidLoad() {
            super.viewDidLoad()
            
            formValidationDelegate = FormValidation( 
                                            button: signUpButton,
                                            fields: [
                                             fullNameTextField, lastNameTextField,
                                            emailAddressTextField, passwordTextField
                                            ],
                                            handler: onSubmit
                                        )
        }
        
        private func onSubmit() {
                // Make Action
        }
}

```
