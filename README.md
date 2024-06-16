# SwiftUI Messaging App with Google Generative AI

## Overview

This SwiftUI messaging app demonstrates real-time messaging capabilities with integration of Google's Generative AI for generating smart replies. Users can interact with the app by sending messages and receiving AI-generated responses. The app features a dynamic user interface and leverages Google's GenerativeModel API for natural language processing.

## Features

- **Real-time Messaging:** Send messages and receive AI-generated responses in real time.
- **Dynamic UI:** Fluid and responsive user interface using SwiftUI.
- **AI Integration:** Utilizes Google's GenerativeModel API for smart and context-aware replies.
- **Image Support:** Option to send an image along with the message to get AI-generated responses considering the image content.

## Technologies Used

- **SwiftUI:** A modern UI toolkit for building iOS applications.
- **Google Generative AI:** Advanced AI for natural language processing and content generation.
- **Combine:** A framework for handling asynchronous events in Swift.
- **UIKit:** Used for integrating the image picker.

## Setup Instructions

### Prerequisites

- **Xcode:** Ensure you have the latest version of Xcode installed (minimum version 12.0).
- **Cocoapods:** Ensure you have Cocoapods installed for dependency management.
- **Google API Key:** Obtain an API key from Google Cloud for accessing the GenerativeModel API.

### Installation Steps

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/swiftui-messaging-app.git
   cd swiftui-messaging-app
   ```

2. **Install Dependencies:**
   Make sure to navigate to the project directory and install necessary dependencies.
   ```bash
   pod install
   ```

3. **Open the Project:**
   Open the Xcode workspace:
   ```bash
   open swiftui-messaging-app.xcworkspace
   ```

4. **Configure API Key:**
   - Locate the `ContentView.swift` file.
   - Replace the placeholder API key with your actual API key from Google Cloud:
     ```swift
     let apiKey = "YOUR_GOOGLE_API_KEY"
     ```

5. **Run the Project:**
   Select a target device or simulator in Xcode and click the **Run** button to build and run the app.

### API Key Configuration

To use Google's Generative AI, you'll need an API key. Follow these steps to obtain one:

1. **Go to Google Cloud Console:**
   [Google Cloud Console](https://console.cloud.google.com/)

2. **Create a New Project:**
   If you don't have an existing project, create a new one.

3. **Enable the API:**
   Search for "Generative AI API" in the API library and enable it for your project.

4. **Create API Credentials:**
   - Go to the Credentials page.
   - Click on **Create credentials** and select **API key**.
   - Copy the generated API key and replace the placeholder in your project.

## Usage Instructions

1. **Sending a Message:**
   - Type a message into the text field at the bottom of the screen.
   - Click the send button (green arrow) to send the message and receive an AI-generated response.

2. **Sending an Image:**
   - Tap the camera icon to select an image from your device.
   - The AI will generate a response based on the image and the accompanying text.

## Project Structure

- `ContentView.swift`: The main SwiftUI view containing the UI and logic for messaging.
- `ImagePicker.swift`: A helper file for selecting images from the photo library.
- `Message.swift`: A model representing a message, including its content and sender.
- `GoogleGenerativeAI`: A framework for integrating Google's Generative AI API.

## Known Issues

- **Limited Token Length:** The AI response is limited by the maximum token count set in the API configuration.
- **Image Response Delay:** Processing images for AI response may take longer than text messages.

## Future Enhancements

- **Push Notifications:** Integrate push notifications for real-time message updates.
- **User Authentication:** Add user authentication for personalized messaging experience.
- **Enhanced UI:** Further improve the UI for a more engaging user experience.

## Contributing

Contributions are welcome! Feel free to submit a pull request or open an issue for any bugs or suggestions for improvement.

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- **Google Cloud:** For providing the Generative AI API.
- **SwiftUI Community:** For resources and inspiration.

---

By following these instructions, you should be able to set up, run, and understand the SwiftUI messaging app project. Enjoy building and expanding on this exciting project! 🚀
