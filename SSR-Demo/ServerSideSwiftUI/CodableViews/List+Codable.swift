import Foundation
import SwiftUI

struct CodableList: View, CodableViewVariant {
    var id: UUID = UUID()
    var views: [CodableView]
    
    enum CodingKeys: CodingKey {
        case views
    }
    
    var body: some View {
        List {
            ForEach(views, id: \.id) {
                ViewFactory.view(for: $0)
            }
        }
    }
}
