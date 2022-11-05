//
//  UISliderView.swift
//  SB-HW-3.4-SwiftUI-Hosting-UIKit-Slider
//
//  Created by Sergey Nestroyniy on 05.11.2022.
//

import SwiftUI

struct UISliderView: UIViewRepresentable {
    
    @Binding var value: Double
    let alpha: CGFloat
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.maximumValue = 100
        //slider.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: alpha)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: alpha)
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }

}

extension UISliderView {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct UISliderView_Previews: PreviewProvider {
    static var previews: some View {
        UISliderView(value: .constant(50), alpha: 0.5)
    }
}
