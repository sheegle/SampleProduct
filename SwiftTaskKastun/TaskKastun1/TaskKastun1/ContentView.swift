//
//  ContentView.swift
//  TaskKastun1
//
//  Created by 渡邊 翔矢 on 2023/11/25.
//

import SwiftUI

struct ContentView: View {
    @State var inputText = ""
    @State var inputText2 = ""
    @State var totalSum = 0
    @State var isShowAlert = false
    
    
    var body: some View {
        VStack {
            HStack {
                TextField("1つ目の数値", text: $inputText)
                    .keyboardType(.numberPad)
                Text("+")
                    .padding()
                TextField("２つ目の数値", text: $inputText2)
                    .keyboardType(.numberPad)
            }
            Button(action: {
                if inputText.isEmpty || inputText2.isEmpty {
                    isShowAlert = true
                } else {
                    totalSum = (Int(inputText) ?? 0) + (Int(inputText2) ?? 0)
                    isShowAlert = false
                }
            }){
                Text("計算")
            }
            .alert("数値を入力して下さい。", isPresented: $isShowAlert){
                Button("ok", role: .cancel){}
            }
            Text("合計: \(totalSum)")
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}
#Preview {
    ContentView()
}
