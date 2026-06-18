//
//  ReusableViews.swift
//  SlopeLoginFlow
//
//  Created by Anthony Espinoza on 6/17/26.
//
import SwiftUI

// DividerText is a reusable custom SwiftUI view.
// Use reusable views when the same UI appears in multiple screens.
struct DividerText: View {

    // body describes what this custom view displays.
    var body: some View {

        // HStack arranges the left line, "or" text, and right line horizontally.
        HStack {

            // Rectangle creates a basic shape.
            // Here it is used as the left divider line.
            Rectangle()

                // Setting only height makes the rectangle thin like a line.
                // Width is automatically decided by the HStack layout.
                .frame(height: 1)

                // opacity makes the gray color lighter.
                .foregroundStyle(.gray.opacity(0.4))

            Text("or")

                // caption is a smaller text style.
                .font(.caption)

                // Makes the "or" text bold.
                .fontWeight(.bold)

            // Second Rectangle creates the right divider line.
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.gray.opacity(0.4))
        }
    }
}

// SocialLoginView is another reusable custom view.
// It can be used on Login and Signup screens.
struct SocialLoginView: View {

    // let means this value is constant after the view is created.
    // This is passed into the view from the outside.
    let title: String

    var body: some View {

        // VStack arranges the title and social icons vertically.
        // spacing controls the vertical gap between them.
        VStack(spacing: 15) {

            // This text changes depending on the title passed in.
            Text(title)
                .font(.headline)

                // opacity makes the purple lighter.
                .foregroundStyle(.purple.opacity(0.7))

            // HStack arranges the social login icons horizontally.
            // spacing controls the space between icons.
            HStack(spacing: 25) {

                Text("G")

                    // title font makes the Google letter larger.
                    .font(.title)

                    // Makes the letter bold.
                    .fontWeight(.bold)

                // SF Symbol image for Facebook-style icon.
                Image(systemName: "f.square.fill")
                    .font(.title)

                    // Changes the icon color to blue.
                    .foregroundStyle(.blue)

                // SF Symbol image for Apple logo.
                Image(systemName: "apple.logo")
                    .font(.title)
            }
        }

        // Makes the whole social login view take full available width.
        // This helps center the content on the screen.
        .frame(maxWidth: .infinity)
    }
}

extension Text {

    // This creates a reusable filled button style.
    // "some View" means this function returns a SwiftUI View, but Swift hides the exact type.
    func primaryButton() -> some View {

        // "self" means the current Text view that called this function.
        self

            // Makes the button text bold.
            .fontWeight(.bold)

            // Makes the button text white.
            .foregroundStyle(.white)

            // Makes the Text expand to fill the available width.
            // maxWidth: .infinity is commonly used for full-width buttons.
            .frame(maxWidth: .infinity)

            // Adds space inside the button around the text.
            .padding()

            // Adds a gradient background behind the padded text.
            .background(

                // LinearGradient creates a smooth color transition.
                LinearGradient(
                    colors: [.indigo, .purple],

                    // Gradient starts from the left side.
                    startPoint: .leading,

                    // Gradient ends on the right side.
                    endPoint: .trailing
                )
            )

            // Clips the button background into a rounded rectangle shape.
            .clipShape(RoundedRectangle(cornerRadius: 6))
    }

    // This creates a reusable outlined button style.
    func outlineButton() -> some View {
        self

            // Makes the text bold.
            .fontWeight(.bold)

            // Changes the text color to indigo.
            .foregroundStyle(.indigo)

            // Makes the button stretch horizontally.
            .frame(maxWidth: .infinity)

            // Adds internal spacing so the button is easier to tap.
            .padding()

            // overlay draws a view on top of the current view.
            // Here it draws the border around the button.
            .overlay(

                // Creates the rounded rectangle border shape.
                RoundedRectangle(cornerRadius: 6)

                    // stroke draws only the outline of the shape.
                    .stroke(.indigo, lineWidth: 2)
            )
    }
}

// Extension on View means this modifier can be used on many SwiftUI views,
// not just Text. For example: TextField, SecureField, Text, etc.
extension View {

    // This creates a reusable underline style.
    // Useful for TextField and SecureField designs.
    func underlined() -> some View {
        self

            // Adds vertical padding above and below the view.
            .padding(.vertical, 8)

            // overlay places another view on top of this view.
            // We use it to draw a line at the bottom.
            .overlay(

                // Rectangle is used as the underline.
                Rectangle()

                    // A height of 1 makes it look like a thin line.
                    .frame(height: 1)

                    // Makes the underline gray.
                    .foregroundStyle(.gray),

                // Places the rectangle at the bottom of the view.
                alignment: .bottom
            )
    }
}
