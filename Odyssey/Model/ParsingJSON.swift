//
//  ParsingJSON.swift
//  Odyssey
//
//  Created by Eugene Demenko on 12.03.2023.
//

import Foundation
import Combine

class MonobankAPI: ObservableObject {
    @Published var currency: [Currency] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchCurrencyData()
    }

    func fetchCurrencyData() {
        guard let url = URL(string: "https://api.monobank.ua/bank/currency") else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Currency].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] value in
                self?.currency = value
            })
            .store(in: &cancellables)
    }
}


//class MonobankAPI: ObservableObject {
//    @Published var currency: [Currency] = []
//
//    func fetchCurrencyData() {
//        let urlString = "https://api.monobank.ua/bank/currency"
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if error != nil {
//                return
//            }
//            guard let data = data else { return }
//
//            do {
//                self.currency = try JSONDecoder().decode([Currency].self, from: data)
//            } catch {
//                print(error)
//            }
//        }.resume()
//        print(currency)
//    }
//}

    
    
    


struct GetCodeCurrency {
    static func getKeyForValue(_ value: Any, inDictionary dictionary: [String: Any]) -> String? {
        for (key, dictValue) in dictionary {
            if dictValue as? NSObject == value as? NSObject {
                return key
            }
        }
        return nil
    }
    
    static func getCodeForCurrency(_ currency: String) -> String? {
        guard let path = Bundle.main.path(forResource: "CurrencyCodes", ofType: "plist") else {
            fatalError("Не вдалося знайти файл plist")
        }
        
        guard let dict = NSDictionary(contentsOfFile: path) as? [String: Any] else {
            fatalError("Не вдалося завантажити файл plist у словник")
        }
        
        return getKeyForValue(currency, inDictionary: dict)
    }
}





//    static func fetchCurrencyData(completion: @escaping (Result<[Currency], Error>) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(NSError(domain: "MonobankAPI", code: 1, userInfo: [NSLocalizedDescriptionKey: "Data not found"])))
//                return
//            }
//
//            do {
//                let currency = try JSONDecoder().decode([Currency].self, from: data)
//                completion(.success(currency))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }

//
//class MonobankAPIModel: ObservableObject {
//    @Published var currency: [Currency] = []
//
//    func fetchData() {
//        MonobankAPI.fetchCurrencyData { result in
//            switch result {
//            case .success(let currency):
//                DispatchQueue.main.async {
//                    self.currency = currency
//                }
//            case .failure(let error):
//                print("Error: \(error)")
//            }
//        }
//    }
//}


