import Foundation
import UIKit

public protocol FormValidationProtocol: AnyObject {
    var button: UIButton { get set }
    var fields: [UITextField] { get set }
    var handler: () -> Void { get set }
}

public class FormValidation: FormValidationProtocol {

    public var button: UIButton
    public var fields: [UITextField]
    public var handler: () -> Void
    
    public init(button: UIButton, fields: [UITextField], handler: @escaping () -> Void) {
        self.button = button
        self.fields = fields
        self.handler = handler
        
        button.addTarget(self, action: #selector(buttonClicked(_:)),for: .touchUpInside)
        
       fields.forEach {
            $0.addTarget(self, action: #selector(checkFieldValidity(_:)), for: .editingChanged)
            $0.addTarget(self, action: #selector(checkFieldValidity(_:)), for: .editingDidEnd)
        }
    }
    
    @objc func buttonClicked(_ sender: AnyObject?) {
        
        fields.forEach(checkFieldValidity)
        
        let isFormValid = fields.allSatisfy({ isFieldValid(field: $0)})
        
        if(isFormValid) {
            self.handler()
        }
    }
    
    @objc func checkFieldValidity(_ textField: UITextField) {
        if !isFieldValid(field: textField) {
            textField.layer.borderColor = UIColor.systemRed.cgColor
        } else {
            if(textField.isEditing) {
                textField.layer.borderColor = UIColor.blue.cgColor
            } else {
                textField.layer.borderColor = UIColor.gray.cgColor
            }
        }
    }
    
    func isFieldValid(field: UITextField) -> Bool {
        return !(field.text?.isEmpty ?? true)
    }
    
}
