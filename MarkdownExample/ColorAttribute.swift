//
//  Created by Artem Novichkov on 13.01.2026.
//

import Foundation

enum ColorAttribute: DecodableAttributedStringKey, MarkdownDecodableAttributedStringKey {
    typealias Value = String
    static let name = "color"
}

extension AttributeScopes {
    struct Custom: AttributeScope {
        let color: ColorAttribute
    }

    var custom: Custom.Type { Custom.self }
}

extension AttributeDynamicLookup {
    subscript<T: AttributedStringKey>(dynamicMember keyPath: KeyPath<AttributeScopes.Custom, T>) -> T {
        self[T.self]
    }
}
