//
//  StatiscticView.swift
//  SwiftfulCrypto (iOS)
//
//  Created by 박승훈 on 2022/01/01.
//

import SwiftUI

struct StatisticView: View {
  
  let stat: StatisticModel
  
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(stat.title)
        .font(.caption)
        .foregroundColor(.theme.secondaryText)
      Text(stat.value)
        .font(.caption)
        .foregroundColor(.theme.accent)
      
      HStack {
        
        Image(systemName: "triangle.fill")
          .font(.caption2)
          .rotationEffect(Angle(degrees:
                                  (stat.percentageChange ?? 0) >= 0 ?
                                0 : 180
                               ))
        
        Text(stat.percentageChange?.asPercentString() ?? "")
          .font(.caption)
          .bold()
      }
      .foregroundColor((stat.percentageChange ?? 0) >= 0 ?
                        .theme.green : .theme.red
      )
      .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
    }
  }
}

struct StatiscticView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
    StatisticView(stat: dev.stat1)
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
    StatisticView(stat: dev.stat2)
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
    StatisticView(stat: dev.stat3)
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)
    }
  }
}
