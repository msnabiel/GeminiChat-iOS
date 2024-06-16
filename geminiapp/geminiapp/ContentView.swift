import SwiftUI
import GoogleGenerativeAI

enum MessageSender {
    case user
    case gemini
}

struct Message: Identifiable {
    let id = UUID()
    let content: String
    let sender: MessageSender
}

struct ContentView: View {
    @State private var messages: [Message] = []
    @State private var messageText = ""
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    
    let config = GenerationConfig(maxOutputTokens: 900)
    let model: GenerativeModel
    
    init() {
        model = GenerativeModel(name: "gemini-1.5-flash", apiKey: "YOUR_API_KEY", generationConfig: config)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(messages) { message in
                        HStack {
                            if message.sender == .user {
                                Spacer()
                                Text(message.content)
                                    .padding()
                                    .background(Color.green)
                                    .cornerRadius(30)
                                    .foregroundColor(.black)
                                    .shadow(radius: 1)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                
                            }
                            else {
                                
                                Text(message.content)
                                    .padding()
                                    .background(Color(white: 0.3))
                                    .cornerRadius(30)
                                    .foregroundColor(.white)
                                    .shadow(radius: 1)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                Spacer()
                            }
                        }.frame(maxWidth: .infinity, alignment: message.sender == .user ? .trailing : .leading)
                    }
                }
                .padding(.top, 10)
                .background(Color.black)
            }
            .background(Color.black)
            .cornerRadius(20)
            .padding()
            
            HStack {
                ZStack(alignment: .leading) {
                    if messageText.isEmpty {
                        Text("Enter message")
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .frame(height: 32)
                    }
                    
                    TextField("", text: $messageText)
                        .padding(.horizontal, 10)
                        .frame(height: 32)
                        .background(Color.black)
                        .cornerRadius(20)
                        .shadow(radius: 1)
                        .foregroundColor(.white)
                        .accentColor(.white)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 2)
                )
                
                Button(action: {
                    sendMessage(text: messageText)
                    messageText = ""
                }) {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.green)
                }
                .padding(.trailing, 0)
            }
            .padding(.bottom, 10)
            
            .padding([.horizontal], 20)
        }
        .background(Color(white: 0).edgesIgnoringSafeArea(.all))
    }

    func sendMessage(text: String, image: UIImage? = nil) {
        guard !text.isEmpty else { return }

        let userMessage = Message(content: text, sender: .user)
        messages.append(userMessage)

        Task {
            let response: String
            if let image = image {
                response = await generateResponseWithImage(prompt: text, image: image)
            } else {
                response = await generateResponse(query: text)
            }
            messages.append(Message(content: response, sender: .gemini))
        }
    }

    func generateResponse(query: String) async -> String {
        do {
            let response = try await model.generateContent(query)
            return response.text ?? "No response text available."
        } catch {
            return "Failed to get response: \(error.localizedDescription)"
        }
    }

    func generateResponseWithImage(prompt: String, image: UIImage) async -> String {
        do {
            guard let imageData = image.jpegData(compressionQuality: 0.8) else {
                return "Failed to process image"
            }
            let base64String = imageData.base64EncodedString()
            let fullPrompt = "\(prompt)\n\nImage: \(base64String)"
            let response = try await model.generateContent(fullPrompt)
            return response.text ?? "No response text available."
        } catch {
            return "Failed to get response: \(error.localizedDescription)"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

