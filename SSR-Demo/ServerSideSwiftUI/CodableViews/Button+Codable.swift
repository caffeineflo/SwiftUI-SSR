import Foundation
import SwiftUI

// NSObject Class to define allowed button actions on
class ButtonActions: NSObject {
    @objc
    public class func printThis() {
        print("Button Action performed")
    }
    
    @objc
    public class func openURL(_ url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
}

struct CodableButton: View, CodableViewVariant {
    var id: UUID = UUID()
    var action: String
    var content: String
    var parameter: String?
    
    var allowedActions: [String] = [
        "printThis",
        "openURL:"
    ]
    
    enum CodingKeys: CodingKey {
        case action
        case content
        case parameter
    }
    
    var body: some View {
        Button(content) {
            if allowedActions.contains(action) {
                if let parameter = parameter {
                    ButtonActions.perform(Selector(action), with: parameter)
                } else {
                    ButtonActions.perform(Selector(action))
                }
            }
        }
    }
}
