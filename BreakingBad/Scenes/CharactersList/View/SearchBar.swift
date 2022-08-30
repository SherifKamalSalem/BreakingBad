//
//  SearchBar.swift
//  BreakingBad
//
//  Created by Sherif Kamal on 29/08/2022.
//

import Foundation
import SwiftUI

struct SearchBar: View {
  @ObservedObject var viewModel: CharactersListViewModel

  @State private var isEditing = false {
    didSet {
        viewModel.makeStateLoading()
        viewModel.performSearch()
    }
  }

  var body: some View {
    HStack(alignment: .center) {

      TextField("Search", text: $viewModel.searchKey)
        .foregroundColor(.black)
        .padding(7)
        .padding(.horizontal, 25)
        .background(Color.white.opacity(0.15))
        .cornerRadius(16)
        .overlay(
          HStack {
            Image(systemName: "magnifyingglass")
              .foregroundColor(.black)
              .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
              .padding(.leading, 8)

            if isEditing {
              Button(action: {
                withAnimation {
                  self.isEditing = false               }
                $viewModel.searchKey.wrappedValue = ""
                viewModel.clearSearch()
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

              }) {
                Image(systemName: "multiply.circle.fill")
                  .foregroundColor(Color.white.opacity(0.75))
                  .padding(.trailing, 8)
              }
            }

          }

        )
        .onTapGesture {
          UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)

          withAnimation {
            self.isEditing = true
          }

        }
        .keyboardType(.default)
    }
  }
}
