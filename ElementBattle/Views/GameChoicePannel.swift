//
//  GameChoicePannel.swift
//  ElementBattle
//
//  Created by Thomas Betous on 08/01/2024.
//

import SwiftUI

struct GameChoicePannel: View {
    var onChoice: (Element) -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Choose your element :")
            ElementButton(.leaf) { onChoice(.leaf) }
            HStack(spacing: 30)  {
                ElementButton(.fire) { onChoice(.fire) }
                ElementButton(.water) { onChoice(.water)}
            }
        }
    }
}

#Preview {
    GameChoicePannel(onChoice: {print($0)})
}
