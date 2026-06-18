import SwiftUI

// LoginView represents one screen in the app.
// Every screen in SwiftUI conforms to the View protocol.
struct ContentView: View {

    // @State stores local mutable data owned by this view.
    // When email changes, SwiftUI automatically redraws the UI.
    @State private var email = "amishkr@gmail.com"

    // @State is commonly used with TextField and SecureField.
    @State private var password = "password"

    // body describes what should appear on the screen.
    var body: some View {

        // VStack arranges views vertically.
        // alignment controls horizontal alignment of children.
        // spacing controls vertical distance between children.
        VStack(alignment: .leading, spacing: 25) {

            Text("Welcome!")
                .font(.largeTitle)

                // Modifiers are applied from top to bottom.
                .fontWeight(.bold)

            Text("Sign in to continue")
                .font(.headline)

                // opacity makes the color less intense.
                .foregroundStyle(.purple.opacity(0.7))

            // TextField is used for plain text input.
            // $email creates a Binding<String>.
            // Bindings provide two-way communication between the UI and @State.
            TextField("Email", text: $email)

                // .plain removes the default TextField styling.
                .textFieldStyle(.plain)

                // Custom modifier from our View extension.
                .underlined()

            // SecureField behaves like TextField except characters are hidden.
            SecureField("Password", text: $password)
                .underlined()

            // Button consists of an action and a label.
            Button {

                // Action executes when the button is tapped.
                // print outputs to the Xcode console.
                print("Login tapped")

            } label: {

                // Label determines what the button looks like.
                Text("LOGIN")

                    // Custom Text extension that styles this as a primary button.
                    .primaryButton()
            }

            // Convenience Button initializer:
            // first parameter is the title and second is the action closure.
            Button("Forgot Password?") {

                // Empty closure means no action yet.
            }

            // Modifiers can be applied directly to buttons.
            .font(.caption)

            .fontWeight(.bold)

            // Makes the button occupy all available horizontal space.
            .frame(maxWidth: .infinity)

            // DividerText is a reusable custom view.
            // Reusable views reduce duplicated code.
            DividerText()

            // SocialLoginView is another custom reusable view.
            // title is passed into the view through its initializer.
            SocialLoginView(title: "Social Media Login")

            // Spacer consumes remaining vertical space.
            // It pushes the HStack toward the bottom of the screen.
            Spacer()

            // HStack arranges views horizontally.
            HStack {

                Text("Don't have an account?")
                    .font(.caption)

                // NavigationLink pushes another screen onto the NavigationStack.
                // Equivalent to pushViewController() in UIKit.
                NavigationLink("Sign up") {

                    // Destination screen.
//                    SignUpView()
                }

                .font(.caption)

                .fontWeight(.bold)
            }

            // Makes the HStack expand to the available width.
            // This centers the contents.
            .frame(maxWidth: .infinity)
        }

        // Adds spacing around the entire screen.
        .padding(35)

        // Controls whether the back button appears in the navigation bar.
        // false means show the back button.
        .navigationBarBackButtonHidden(false)
    }
}
#Preview {
    ContentView()
}
