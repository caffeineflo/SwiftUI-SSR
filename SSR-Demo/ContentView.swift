import SwiftUI

struct ContentView: View {
    @StateObject var localJSONFileSource = LocalJSONFileSource()
    
    var body: some View {
        if let codableView = localJSONFileSource.codableView {
            ViewFactory.view(for: codableView)
        }
    }
}
