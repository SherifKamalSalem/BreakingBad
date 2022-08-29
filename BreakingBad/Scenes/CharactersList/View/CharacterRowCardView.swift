//
//  CharacterRowCardView.swift
//  BreakingBad
//
//  Created by Sherif Kamal on 29/08/2022.
//

import SwiftUI

struct CharacterRowCardView: View {
    var item: CharacterRowViewModel
    
    var body: some View {
        let imageURL = item.imageURL
        
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: imageURL)
                .frame(width: 90, height: 120).cornerRadius(4)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4, content: {
                
                Text(item.name).lineLimit(5).foregroundColor(.black)
                Text(item.birthday).foregroundColor(Color.black.opacity(0.75))
            })
            Spacer()
        }
        .padding(8)
    }
}
