import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var store: Store
    @State private var defaultAddress: DefaultAddress = .empty
    @Environment(\.dismiss) var dismiss


    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Street Nr.", text: $defaultAddress.street)
                        .textContentType(.fullStreetAddress)
                    TextField("Postalcode", text: $defaultAddress.postalCode)
                        .textContentType(.postalCode)
                        .keyboardType(.decimalPad)
                    TextField("City", text: $defaultAddress.city)
                        .textContentType(.addressCity)
                } header: {
                    Text("Default Address")
                }
            }
            .navigationTitle("Add address")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        store.defaultAddress = defaultAddress
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(Store())
    }
}
