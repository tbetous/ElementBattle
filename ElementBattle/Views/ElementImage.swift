//
//  ElementImage.swift
//  ElementBattle
//
//  Created by Thomas Betous on 06/01/2024.
//

import SwiftUI

struct ElementImage: View {
    var element: Element?
    
    var body: some View {
        guard let element = element else {
            return Image(systemName: "questionmark.circle.fill")
                .foregroundColor(.gray)
        }
        return Image(systemName: element.logo().imageName)
            .foregroundColor(element.logo().color)
    }
}

extension ElementImage {
    init(_ element: Element?) {
        self.element = element
    }
}

#Preview {
    HStack {
        ElementImage(element: .fire)
        ElementImage(element: .water)
        ElementImage(element: .leaf)
        ElementImage(element: nil)
    }
}
