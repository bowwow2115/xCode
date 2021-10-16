//
//  CarList.swift
//  CarDealer
//
//  Created by 박승훈 on 2021/09/30.
//

import SwiftUI

struct CarList: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("Model-X")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                Text("Tesla Model-X")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                Text("$90,000")
                    .font(.headline)
            }.padding(.trailing, 10)
            .padding(.leading, 10)
            
        }
    }
}

struct CarList_Previews: PreviewProvider {
    static var previews: some View {
        CarList()
    }
}
