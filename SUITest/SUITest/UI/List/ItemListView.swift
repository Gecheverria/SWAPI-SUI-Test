//
//  ItemListView.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 3/14/21.
//

import SwiftUI

struct ItemListView: View {
    @ObservedObject var viewModel: ItemListViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(viewModel.items) { item in
                    NavigationLink(destination: Text(item.displayItem.mainTitle)) {
                        ItemListViewRow(item: item.displayItem)
                    }
                    Divider()
                        .onAppear {
                            if viewModel.items.shouldPaginate(for: item) {
                                print("PAGINATE")
                            }
                        }
                }
            }
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .navigationTitle(viewModel.homeItem.rawValue.capitalized)
        .onAppear(perform: {
            viewModel.fetchContent.accept(())
        })
        .alert(item: $viewModel.errorItem, content: { item in
            Alert(title: Text("Error"),
                  message: Text(item.error.localizedDescription),
                  dismissButton: .default(Text("OK")))
        })
    }
}

struct ItemListViewRow: View {
    var item: ItemDisplayable
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(item.mainTitle)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.black)
            if let subtitle = item.subTitle {
                Text(subtitle)
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemListView(viewModel: ItemListViewModel(service: ContentListServiceMock(), homeItem: .films))
        }
    }
}
