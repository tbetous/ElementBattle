//
//  ElementButton.swift
//  ElementBattle
//
//  Created by Thomas Betous on 06/01/2024.
//

import SwiftUI

struct ElementButton: View {
    var element: Element
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            ElementImage(element)
                .font(.system(size: 75))
        })
    }
}

extension ElementButton {
    init(_ element: Element, action: @escaping () -> Void) {
        self.element = element
        self.action = action
    }
}

#Preview {
    HStack {
        ElementButton(.fire) {}
        ElementButton(.water) {}
        ElementButton(.leaf) {}
    }
    
}
