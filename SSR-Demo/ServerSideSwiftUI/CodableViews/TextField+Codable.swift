import Foundation
import SwiftUI

struct CodableTextField: View, CodableViewVariant {
    var id: UUID = UUID()
    var title: String
    var lineLimit: Int?
    var alignment: TextAlignment
    @State var binding: String = ""
    
    enum CodingKeys: CodingKey {
        case title
        case alignment
        case lineLimit
    }
    
    public var body: some View {
        TextField(title, text: $binding)
            .lineLimit(lineLimit)
            .multilineTextAlignment(alignment)
    }
}
