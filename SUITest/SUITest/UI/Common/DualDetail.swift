//
//  DualDetail.swift
//  SUITest
//
//  Created by Gabriel Echeverria on 9/6/21.
//

import SwiftUI

struct DualDetail: View {
    var item: DualDetailDisplayable
    var axis: Axis.Set = .vertical
    
    var body: some View {
        if axis == .horizontal {
            HStack(spacing: 8) {
                DualText(title: item.title, description: item.description)
            }
        } else {
            VStack(spacing: 8) {
                DualText(title: item.title, description: item.description)
            }
        }
    }
}

struct DualText: View {
    let title: String
    let description: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 14, weight: .semibold))
        Text(description)
            .font(.system(size: 14))
            .foregroundColor(.gray)
    }
}

struct DualDetail_Previews: PreviewProvider {
    static var previews: some View {
        DualDetail(item: DualDetailDisplayable(title: "Title", description: "Description"))
    }
}
