//
//  ContentView.swift
//  Car Leasing Calculator
//
//  Created by Art's Macbook Pro on 10/12/2562 BE.
//  Copyright © 2562 Anurak Teerarattananukulchai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.systemIndigo]
    }
    
    @State private var carPrice = ""
    let downPaymentPercentages =  [10, 20, 30, 40, 50]
    @State private var pickedDownpayment = 1
    @State private var interestPerYear = ""
    @State private var numberOfYear = 1
    
    var downPayment : Double{
        let myDownPayment = downPaymentPercentages[pickedDownpayment] * (Int(carPrice) ?? 0 ) / 100
        return Double(myDownPayment)
    }
    
    
    var leasingAmount : Double {
        let leasingAmount = (Double(carPrice) ?? 0) - downPayment
        return leasingAmount
    }
    
    
    var paymentPerMont : Double {
        let myCarPice = Double(carPrice) ?? 0
        let myInterestRate = Double(interestPerYear) ?? 0
        
        let totalLeasingAmount = myCarPice - downPayment
        let pickedNumberOfYear = Double(numberOfYear) + 2
        let totalInterestAmount = totalLeasingAmount * (myInterestRate / 100 ) * pickedNumberOfYear
        let totalPaymentPerYear = ( totalLeasingAmount + totalInterestAmount ) / pickedNumberOfYear
        let totalPaymentPerMonth = totalPaymentPerYear / 12
        
        return totalPaymentPerMonth
        
    
    }
    
    var body: some View {
        VStack{
            NavigationView{
                Form{
                    Section{
                        TextField("ราคารถ", text: $carPrice)
                            .keyboardType(.decimalPad)
                        
                    }
                    
                    Section(header: Text("เงินดาวน์")){
                        Picker("จำนวนเงินดาวน์", selection: $pickedDownpayment){
                            ForEach(0..<downPaymentPercentages.count){
                                Text("\(self.downPaymentPercentages[$0]) %")
                            }
                        }.pickerStyle(SegmentedPickerStyle.init())
                        Text("คิดเป็นเงินดาวน์ :\(downPayment , specifier : "%.2f") ฿")
                        Text("คิดเป็นยอดจัดลิซซิ่ง : \(leasingAmount , specifier : "%.2f" )฿")
                    }
                    Section(header: Text("อัตราดอกเบี้ยและระยะเวลาการผ่อนชำระ")){
                        TextField("อัตราดอกเบี้ยต่อปี", text: $interestPerYear)
                        .keyboardType(.decimalPad)
                        
                        Picker("ระยะเวลาการผ่อนชำระ", selection: $numberOfYear){
                            ForEach(2..<7){
                                Text("\($0) ปี")
                            }
                        }
                    }
                    
                    Section(header: Text("ค่าผ่อนชำระต่อเดือน")){
                        Text("\(paymentPerMont, specifier: "%.2f")฿")
                        
                    }
                }
            .navigationBarTitle("ผ่อนรถไฮโซ")
            .foregroundColor(.blue)
            .background(GradientBackground())
    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
