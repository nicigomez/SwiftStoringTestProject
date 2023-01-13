import SwiftUI

struct StringView: View {
    @EnvironmentObject var store: Store
    @State private var defaultString: String = ""
    @Environment(\.dismiss) var dismiss


    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("String", text: $defaultString)
                } header: {
                    Text("Default String")
                }
            }
            .navigationTitle("Add String")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        store.defaultString = defaultString
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

struct StringView_Previews: PreviewProvider {
    static var previews: some View {
        StringView()
            .environmentObject(Store())
    }
}
