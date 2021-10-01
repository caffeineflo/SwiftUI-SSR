import Foundation
import SwiftUI

// NSObject Class to define allowed button actions on
class ButtonActions: NSObject {
    @objc
    public class func printThis() {
        print("Button Action performed")
    }
}

struct CodableButton: View, CodableViewVariant {
    var id: UUID = UUID()
    var action: String
    var content: String
    
    var allowedActions: [String] = ["printThis"]
    
    enum CodingKeys: CodingKey {
        case action
        case content
    }
    
    var body: some View {
        Button(content) {
            if allowedActions.contains(action) {
                ButtonActions.perform(Selector(action))
            }
        }
    }
}
