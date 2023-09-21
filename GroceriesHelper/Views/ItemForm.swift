//
//  ItemForm.swift
//  GroceriesHelper
//
//  Created by Juan Reyes on 9/19/23.
//

import SwiftUI
import MapKit

struct ItemForm: View {
    
    @State var title: String = ""
    @State var description: String = ""
    @State var amount: String = ""
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @State var locations: [String] = ["A", "B", "C"]
    @State private var selectedLocation = 0
    
    @StateObject var pickableImage = PickableImage()
    
    var body: some View {
        Form {
            Section(header: Text("Photo")) {
                PickableImageView()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .environmentObject(pickableImage)
            }
            
            Section(header: Text("Item Info")) {
                TextField(text: $title) {
                    Text("Title")
                }
                TextField(text: $description) {
                    Text("Description")
                }
                TextField(text: $amount) {
                    Text("Amount")
                }
                Picker(selection: $selectedLocation,
                       label: Text("Location")) {
                    ForEach(locations, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.navigationLink)
            }
            
            Section(header: Text("Map")) {
                Map(coordinateRegion: $region)
                            .frame(width: 400, height: 300)
            }
        }
    }
}

struct ItemForm_Previews: PreviewProvider {
    static var previews: some View {
        ItemForm()
    }
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
    }
}
