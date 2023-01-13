import Foundation
import Combine

class Store: ObservableObject {
    
    @Published var defaultAddress: DefaultAddress {
        didSet {
            UserDefaults.standard.set(defaultAddress, forKey: "defaultAddress")
        }
    }
    
    @Published var defaultString: String {
        didSet {
            UserDefaults.standard.set(defaultString, forKey: "defaultString")
        }
    }
    
    init() {
        self.defaultAddress = UserDefaults.standard.object(forKey: "defaultAddress") as? DefaultAddress ?? .empty
        self.defaultString = UserDefaults.standard.object(forKey: "defaultString") as? String ?? ""
    }
}

struct DefaultAddress: Hashable, Codable  {
    var street: String
    var postalCode: String
    var city: String
}

extension DefaultAddress {
    static var empty: DefaultAddress = DefaultAddress(street: "", postalCode: "", city: "")
}
