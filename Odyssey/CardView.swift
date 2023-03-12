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
                Text(String(currency.currencyNameA))
                    .font(.headline)
                Spacer()
                VStack{
                    Text(String(currency.currencyNameB))
                        .font(.headline)
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
        }
    }
}

//struct CardView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        CardView(currency:)
//            .previewLayout(.fixed(width: 400, height: 60))
//    }
//}
