//
//  KeyView.swift
//  CalculatorIOS
//
//  Created by Bhavnesh Sharma on 13/09/23.
//

import SwiftUI

struct KeyView: View {
    
    @State var value = "0"
    @State var runnigNumber = 0
    @State var currentOperation : Operation = .none
    @State private var changeRectangleColour = false
    
    let button : [[Keys]] = [
        [.clear, .negative, .percent, .devide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .subtract],
        [.one,.tow,.three,.add],
        [.zero,.decimal,.equale]
    ]
    
    var body: some View {
        VStack{
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(changeRectangleColour ?
                                     Color("num").opacity(0.4)
                                     :Color.pink.opacity(0.2))
                    .scaleEffect(changeRectangleColour ? 1.5: 1.0)
                    .frame(width: 350, height:  280)
                    .animation(Animation.easeInOut.speed(0.17).repeatForever(), value: changeRectangleColour)
                    .onAppear(perform: {
                        self.changeRectangleColour.toggle()
                    })
                    .overlay(Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.black)
                )
            }.padding()
            ForEach(button , id: \.self){ row in
                HStack(spacing: 10){
                    ForEach(row , id: \.self){rowElement in
                        Button {
                            self.didTap(buttons: rowElement)
                        }label: {
                            Text(rowElement.rawValue)
                                .font(.system(size: 30))
                                .frame(width : self.getScreenWidth(elements: rowElement),
                                       height: self.getHight(elements: rowElement))
                                .background(rowElement.buttonColour)
                                .foregroundColor(.black)
                                .cornerRadius(self.getScreenWidth(elements: rowElement) / 2)
                                .shadow(color : .purple.opacity(8.8),radius: 30)
                        }
                    }
                }.padding(.bottom, 4)
            }
        }
    }
    
    func getScreenWidth(elements : Keys) -> CGFloat{
        if elements == .zero {
            return (UIScreen.main.bounds.width - (5 * 10)) / 2
        }
        return (UIScreen.main.bounds.width - (5 * 10)) / 4
    }
    
    func getHight(elements : Keys) -> CGFloat{
        return (UIScreen.main.bounds.width - (5 * 10)) / 5
    }
    
    func didTap(buttons : Keys){
        switch buttons{
        case .add, .subtract, .multiple, .devide ,.equale :
            if buttons == .add {
                self.currentOperation = .add
                self.runnigNumber = Int(self.value) ?? 0
            }
            else if buttons == .subtract {
                self.currentOperation = .subtract
                self.runnigNumber = Int(self.value) ?? 0
            }
            else if buttons == .multiple {
                self.currentOperation = .multiply
                self.runnigNumber = Int(self.value) ?? 0
            }
            else if buttons == .devide {
                self.currentOperation = .divide
                self.runnigNumber = Int(self.value) ?? 0
            }
            else if buttons == .equale {
                let runningValue = self.runnigNumber
                let currentValue  = Int(self.value) ?? 0
                
                switch self.currentOperation{
                case .add : self.value = "\(runningValue + currentValue)"
                case .subtract : self.value = "\(runningValue - currentValue)"
                case .multiply : self.value = "\(runningValue * currentValue)"
                case .divide : self.value = "\(runningValue / currentValue)"
                case .none: break
                }
            }
            if buttons != .equale{
                self.value = "0"
            }
        case .clear : self.value = "0"
        case .negative,.decimal, .percent : break
        default : let number = buttons.rawValue
            if self.value == "0"{
                value = number
            }else{
                self.value = "\(self.value)\(number)"
            }
        }
    }
}

struct KeyView_Previews: PreviewProvider {
    static var previews: some View {
        KeyView()
    }
}
