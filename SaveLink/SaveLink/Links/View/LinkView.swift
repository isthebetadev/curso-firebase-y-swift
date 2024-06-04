//
//  LinkView.swift
//  SaveLink
//
//  Created by Ruben on 4/6/24.
//

import SwiftUI

struct LinkView: View {
    
    @ObservedObject var linkViewModel: LinkViewModel
    @State var text: String = ""
    
    var body: some View {
        VStack {
            
            TextEditor(text: $text)
                .frame(height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.green, lineWidth: 2)
                )
                .padding(.horizontal, 12)
                .cornerRadius(3)
            
            Button(action: {
                linkViewModel.createNewLink(fromURL: text)
                text = ""
            }, label: {
                Label("Crear Link", systemImage: "link")
            })
            .tint(.green)
            .controlSize(.regular)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            
            if linkViewModel.messageError != nil {
                Text(linkViewModel.messageError!)
                    .bold()
                    .foregroundStyle(.red)
            }
            
            List {
                
                ForEach(linkViewModel.links) { link in
                    
                    Text(link.title)
                        .bold()
                        .lineLimit(4)
                        .padding(.bottom, 8)
                    
                    Text(link.url)
                        .foregroundStyle(.gray)
                        .font(.caption)
                    
                    HStack {
                        
                        Spacer()
                        
                        if link.isViewed {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .foregroundStyle(.blue)
                                .frame(width: 12, height: 12)
                        }
                        
                        if link.isFavorite {
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundStyle(.yellow)
                                .frame(width: 12, height: 12)
                        }
                        
                    }
                    
                }
            }
            .task {
                linkViewModel.getAllLinks()
            }
        }
        
    }
}

#Preview {
    LinkView(linkViewModel: LinkViewModel())
}
