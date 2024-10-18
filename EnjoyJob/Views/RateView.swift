import SwiftUI

struct RateView: View {
    @State var rating: Int = 0
    @State var feedback: String = ""
    @State private var showAlert = false
    
    func submitRating() {
        print("Submit rating: \(rating)")
        print("Commentary: \(feedback)")
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("Did you like it? Rate it!")
                        .font(.title)
                        .padding()
                    HStack {
                        ForEach(1..<6) { index in
                            Image(systemName: index <= rating ? "star.fill" : "star")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(index <= rating ? .yellow : .gray)
                                .onTapGesture {
                                    rating = index
                                }
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        HStack {
                            Spacer()
                            Text("Have more detailed activity feedback or advice for our team?\nShare it below.")
                                .font(.body)
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        
                        Spacer()
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                .background(Color.gray.opacity(0.1))
                                .frame(height: 200)
                            
                            TextField("It was... (optional)", text: $feedback)
                                .padding()
                                .background(Color.clear)
                                .cornerRadius(8)
                            
                            VStack {                                
                                HStack {
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.gray)
                                        .padding(.top, 8)
                                        .padding(.leading, 8)
                                        .padding(.bottom)
                                    Spacer()
                                }
                                
                                HStack {
                                    Image(systemName: "camera.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.gray)
                                        .padding(.bottom, 8)
                                        .padding(.leading, 8)
                                    
                                    Spacer()
                                }
                                .padding(.top, 60)
                            }
                            .padding(.horizontal)
                            
                            Spacer()
                        }
                        Spacer()
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Thank you for your feedback"), dismissButton: .cancel(Text("OK")))
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showAlert = true
                    }) {
                        Text("Submit")
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Rate")
                }
            }
        }
    }
}
#Preview {
    RateView()
}


