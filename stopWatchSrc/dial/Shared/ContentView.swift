import SwiftUI

struct TemperatureDial: View {
   
    @State private var value: CGFloat = 0 //움직이는 원을 조절하는 수


    
     let scale: CGFloat = 275    //원 사이즈
     let indicatorLength: CGFloat = 25   //원 가장자리 라인 사이즈
    
     let maxTemperature: CGFloat = 32
     let stepSize: CGFloat = 0.5
//
    let generator = UINotificationFeedbackGenerator()
    //
     var innerScale: CGFloat {
        return scale - indicatorLength
    }



    private func angle(between starting: CGPoint, ending: CGPoint) -> CGFloat {
        let center = CGPoint(x: ending.x - starting.x, y: ending.y - starting.y)
        let radians = atan2(center.y, center.x)
        var degrees = 90 + (radians * 180 / .pi)

        if degrees < 0 {
            degrees += 360
        }

        return degrees
    }

    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .fill(Color.blue)
                .frame(width: self.innerScale, height: self.innerScale)
                .rotationEffect(.degrees(-90))
                .gesture(
                    DragGesture().onChanged() { value in
                        ///
                        let selectionFeedback = UISelectionFeedbackGenerator()
                                        selectionFeedback.selectionChanged()
                        ///
                        let x: CGFloat = min(max(value.location.x, 0), self.innerScale)
                        let y: CGFloat = min(max(value.location.y, 0), self.innerScale)

                        let ending = CGPoint(x: x, y: y)
                        let start = CGPoint(x: (self.innerScale) / 2, y: (self.innerScale) / 2)

                        let angle = self.angle(between: start, ending: ending)
                        self.value = CGFloat(Int(((angle / 360) * (self.maxTemperature / self.stepSize)))) / (self.maxTemperature / self.stepSize)
                    }
                )
            Circle()
                .stroke(Color.red, style: StrokeStyle(lineWidth: self.indicatorLength, lineCap: .butt, lineJoin: .miter, dash: [4]))
                .frame(width: self.scale, height: self.scale, alignment: .center)
            Circle()
                .trim(from: 0.0, to: self.value)
                .stroke(Color.orange, style: StrokeStyle(lineWidth: self.indicatorLength, lineCap: .butt, lineJoin: .miter, dash: [4]))
                .rotationEffect(.degrees(-90))
                .frame(width: self.scale, height: self.scale, alignment: .center)

            Text("\(self.value * self.maxTemperature, specifier: "%.1f") \u{2103}")
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .fontWeight(.semibold)
        }
      
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureDial()
    }
}
