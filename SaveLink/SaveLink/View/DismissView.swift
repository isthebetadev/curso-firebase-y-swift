//
//  DismissView.swift
//  SaveLink
//
//  Created by Ruben on 28/5/24.
//

import SwiftUI

struct DismissView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: { dismiss() }, label: {
                Text("Close")
            })
        }
        .buttonStyle(.bordered)
        .padding(.trailing, 10)
        .tint(.black)
    }
}

#Preview {
    DismissView()
}
