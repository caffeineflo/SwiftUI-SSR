//
//  ContentView.swift
//  SSR-Demo
//
//  Created by Florian Harr on 9/29/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var localJSONFileSource = LocalJSONFileSource()
    
    var body: some View {
        if let codableView = localJSONFileSource.codableView {
            ViewFactory.view(for: codableView)
        }
    }
}
