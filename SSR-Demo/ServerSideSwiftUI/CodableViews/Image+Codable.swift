//
//  Image+Codable.swift
//  My360iDevApp
//
//  Created by Florian Harr on 8/21/21.
//

import Foundation
import Kingfisher
import SwiftUI

struct CodableImage: View, CodableViewVariant {
    var id: UUID = UUID()
    var url: String
    
    enum CodingKeys: CodingKey {
        case url
    }
    
    var body: some View {
        KFImage(URL(string: url)!)
    }
}
