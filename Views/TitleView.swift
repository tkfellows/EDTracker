//
//  MainTitleView.swift
//  ED-Tracker
//
//  Created by Tyee Fellows on 2021-07-01.
//

import SwiftUI

struct TitleView: View {
        
    @EnvironmentObject var patient: EscapeEncounterViewModel
    @Binding var localEncounterId: String
    @Binding var enteredMRN: String
    @Binding var authorizedMRN: Bool
    @State private var showAlert = false

    
    var body: some View {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Image("mainLogo")
                    Text("ED Tracker")
                        .font(.system(size: 30, weight: .bold, design: .rounded ))
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .frame(width: 175, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                    Image("hospitalLogo")
                        .resizable()
                        .frame(width: 100, height: 50, alignment: .center)
                        .padding(.top,20)
                    HStack {
                        Text("Encounter: ").foregroundColor(.black)
                        ZStack(alignment: .center) {
                            if localEncounterId.isEmpty { Text("").foregroundColor(.darkGray) }
                            FirstResponderTextField(placeholder: "\(localEncounterId)", alignment: .center, textColor: .black, text: $localEncounterId)
                                .frame(width: 50, height: 50)
                                .onTapGesture {
                                    self.endEditing(true)
                                }
                        }
                    }
                    ZStack(alignment: .center) {
                        if enteredMRN.isEmpty { Text("Please scan your wristband...").foregroundColor(.darkGray) }
                        FirstResponderTextField(placeholder: "", alignment: .center, textColor: .black, text: $enteredMRN)
                            .frame(width: 300, height: 50)
                            .onTapGesture {
                                self.endEditing(true)
                            }
                        if  enteredMRN.count > 5 {
                            Button(action: {
                                if enteredMRN.count != 0 {
                                    patient.getEncounter(patientId: enteredMRN, encounterId: localEncounterId)
                                    print("Fetching data!")
                                    authorizedMRN = true
                                } else {
                                    showAlert = true
                                    print("There is no data available")
                                }
                            }) {
                                signInButton()
                            }
                            .offset(y:70)
                        }
                    }
                    Spacer()
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Scan unsucessful"),
                            dismissButton: .default(
                                Text("Try Again!"),
                                action: {
                                    enteredMRN = ""
                                }
                            )
                        )
                    }
                    Spacer(minLength: 300)
                }
                Spacer()
                .environmentObject(patient)
            }.background(Color.lightBlue).edgesIgnoringSafeArea(.all)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(localEncounterId: .constant(""), enteredMRN: .constant(""), authorizedMRN: .constant(false))
    }
}

struct signInButton: View {
    
    var body: some View {
        Text("Check progress")
            .font(.headline)
            .foregroundColor(.lightBlue)
            .padding()
            .background(Color.black)
            .cornerRadius(15)
    }
}

struct FirstResponderTextField: UIViewRepresentable {
    
    let placeholder: String
    let alignment: NSTextAlignment
    let textColor: Color
    @Binding var text: String
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        var becameFirstResponder = false
        
        init(text: Binding<String>, alignment: NSTextAlignment, textColor:Color) {
            self._text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text, alignment: alignment, textColor: textColor)
    }
    
    func makeUIView(context: Context) -> some UIView {
        let textField = UITextField()
        textField.textColor = .black
        textField.textAlignment = .center
        textField.placeholder = placeholder
        textField.delegate = context.coordinator
        return textField
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if !context.coordinator.becameFirstResponder {
            uiView.becomeFirstResponder()
            context.coordinator.becameFirstResponder = true
        }
    }
}

extension View {
    func endEditing(_ force: Bool) {
                UIApplication.shared.windows.forEach { $0.endEditing(force)}
            }
}
