import Foundation
import SwiftUI

extension TextAlignment {
    enum JSONTextAlignment: String, Codable {
        case leading
        case center
        case trailing
        
        init(from textAlignment: TextAlignment) {
            switch textAlignment {
            case .center:
                self = .center
            case .leading:
                self = .leading
            case .trailing:
                self = .trailing
            }
        }
    }
    
    init(from json: JSONTextAlignment) {
        switch json {
        case .center:
            self = .center
        case .leading:
            self = .leading
        case .trailing:
            self = .trailing
        }
    }
}

extension TextAlignment: Codable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(JSONTextAlignment(from: self))
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(JSONTextAlignment.self)
        self.init(from: value)
    }
}
