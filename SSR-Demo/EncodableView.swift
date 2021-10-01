import Foundation
import SwiftUI

struct EncodableView: View {
    var encodableView: some View {
        CodableVStack (views: [
            .image(CodableImage(url: "https://devcommunitysummit.org/img/speakers/thumbs/florian_harr.jpg")),
            .text(CodableText(alignment: .center, content: "Florian Harr")),
            .text(CodableText(alignment: .center, content: "SwiftUI.View: Codable - Transforming SwiftUI to JSON (and vice-versa) for a fully backend driven UI"))
        ])
    }
    
    var body: some View {
        encodableView.onTapGesture {
            encodeView()
        }
    }
    
    func encodeView() {
        let encodedView = try? JSONEncoder().encode(encodableView as! CodableVStack)
        let encodedViewJSON = NSString(data: encodedView!, encoding: String.Encoding.utf8.rawValue)
        print(encodedViewJSON ?? "")
    }
}
