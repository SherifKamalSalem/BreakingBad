//
//  CharacterDetailsView.swift
//  BreakingBad
//
//  Created by Sherif Kamal on 29/08/2022.
//

import SwiftUI

struct CharacterDetailsView: View {
    
    @ObservedObject var viewModel: CharacterRowViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                AsyncImage(url: viewModel.imageURL)
                        .frame(width: 300, height: 400).cornerRadius(4)
                        .cornerRadius(8)
                Text(viewModel.name).font(.title).foregroundColor(.black).bold()
                Text(viewModel.nickname).font(.headline).foregroundColor(.gray)
                Text(viewModel.category.rawValue).font(.subheadline).foregroundColor(.gray)
                Text(viewModel.birthday).font(.subheadline).foregroundColor(.gray)
            }
        }
        .padding(.top, 30)
        .navigationBarTitle(viewModel.name)
    }
}
