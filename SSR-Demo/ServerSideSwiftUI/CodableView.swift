import Foundation
import SwiftUI

protocol CodableViewVariant: Codable {
    var id: UUID { get }
}

@dynamicMemberLookup
enum CodableView {
    case list(CodableList)
    case text(CodableText)
    case textField(CodableTextField)
    case button(CodableButton)
    case image(CodableImage)
    case vStack(CodableVStack)
}

extension CodableView {
    subscript<T>(dynamicMember keyPath: KeyPath<CodableViewVariant, T>) -> T {
        switch self {
        case let .list(list):
            return list[keyPath: keyPath]
        case let .text(text):
            return text[keyPath: keyPath]
        case let .button(button):
            return button[keyPath: keyPath]
        case let .image(image):
            return image[keyPath: keyPath]
        case let .vStack(vStack):
            return vStack[keyPath: keyPath]
        case let .textField(textField):
            return textField[keyPath: keyPath]
        }
    }
}

extension CodableView: Codable {
    enum CodingKeys: CodingKey {
        case type
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        
        switch type {
        case "list":
            self = .list(try CodableList(from: decoder))
        case "text":
            self = .text(try CodableText(from: decoder))
        case "textField":
            self = .textField(try CodableTextField(from: decoder))
        case "button":
            self = .button(try CodableButton(from: decoder))
        case "image":
            self = .image(try CodableImage(from: decoder))
        case "vStack":
            self = .vStack(try CodableVStack(from: decoder))
        default:
            fatalError("Unknown Type received")
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case let .button(codableButton):
            try container.encode("button", forKey: .type)
            try codableButton.encode(to: encoder)
        case let .image(codableImage):
            try container.encode("image", forKey: .type)
            try codableImage.encode(to: encoder)
        case let .list(codableList):
            try container.encode("list", forKey: .type)
            try codableList.encode(to: encoder)
        case let .text(codableText):
            try container.encode("text", forKey: .type)
            try codableText.encode(to: encoder)
        case let .textField(codableTextField):
            try container.encode("textField", forKey: .type)
            try codableTextField.encode(to: encoder)
        case let .vStack(codableVStack):
            try container.encode("vStack", forKey: .type)
            try codableVStack.encode(to: encoder)
        }
    }
}
