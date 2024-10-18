# enjoy-job
 Enjoy Job integrates Apple MapKit to show suggested events on minimalistic, interactive screens. You can also see events' location in animated, interactive Apple Maps.

Enjoy Job also allows you to upload new custom events to the app.

# Technologies Used
* SwiftUI
* MapKit
* PhotosUI
* DocC
* Git & GitHub

# Animated App Showcase
https://github.com/user-attachments/assets/e8517925-8e23-4377-8f2d-97cdc29811bd



# I'm Most Proud Of...
Rounded corners shape. Determining how to make corners of rectangle shaped objects be rounded made any such object in the app visually more appealing. 

The function creates a custom path using the UIBezierPath class, which allows for smooth, curved shapes. The path is drawn within the provided rectangular area (rect) and returns a Path object (used for SwiftUI drawing). The path.close() method completes the path, and the UIBezierPath is converted to a SwiftUI Path using path.cgPath.

Here's the code:

```swift
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()

        // Start at the top-left corner
        path.move(to: CGPoint(x: rect.minX, y: rect.minY + topLeft))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + topRight))

        // Top-right corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - bottomRight))
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX - bottomRight, y: rect.maxY),
            controlPoint: CGPoint(x: rect.maxX, y: rect.maxY)
        )

        // Bottom-right corner
        path.addLine(to: CGPoint(x: rect.minX + bottomLeft, y: rect.maxY))
        path.addQuadCurve(
            to: CGPoint(x: rect.minX, y: rect.maxY - bottomLeft),
            controlPoint: CGPoint(x: rect.minX, y: rect.maxY)
        )

        // Bottom-left corner
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + topLeft))

        path.close()
        return Path(path.cgPath)
    }
```
<br>
</br>



# Completeness
Although it's a simple portfolio project, I've implemented the following
* Text input validation
* Project organization

