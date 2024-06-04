//
//  LinkView.swift
//  SaveLink
//
//  Created by Ruben on 4/6/24.
//

import SwiftUI

struct LinkView: View {
    
    @ObservedObject var linkViewModel: LinkViewModel
    
    var body: some View {
        VStack {
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
                                .frame(width: 10, height: 10)
                        }
                        if link.isFavorite {
                            Image(systemName: "star.fill")
                                .resizable()
                                .foregroundStyle(.yellow)
                                .frame(width: 10, height: 10)
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
