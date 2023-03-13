//
//  CardView.swift
//  Odyssey
//
//  Created by Eugene Demenko on 12.03.2023.
//

import SwiftUI

struct CardView: View {
    let currency: Currency
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                if let code = GetCodeCurrency.getCodeForCurrency(String(currency.currencyCodeA)) {
                    Text("\(code)")
                        .font(.headline)
                } else {
                    Text("Unknown currency")
                        .font(.headline)
                }
                Spacer()
                VStack{
                    if let code = GetCodeCurrency.getCodeForCurrency(String(currency.currencyCodeB)) {
                        Text("\(code)")
                            .font(.headline)
                    } else {
                        Text("Unknown currency")
                            .font(.headline)
                    }

                       
                    if(currency.rateSell != 0){
                        Text(String(currency.rateSell))
                            .font(.headline)
                    }
                    if(currency.rateCross != 0){
                        Text(String(currency.rateCross))
                            .font(.headline)
                    }
                    Text(currency.formattedDate)
                            .font(.headline)
                    
                }
            }
        }.padding(15)
    }
}

//struct CardView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        CardView(currency:)
//            .previewLayout(.fixed(width: 400, height: 60))
//    }
//}
