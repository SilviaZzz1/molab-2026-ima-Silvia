import SwiftUI

struct ContentView: View {

    @StateObject private var camera = CameraModel()

    let moods = [
        ("Normal", "👁️"),
        ("Happy", "☀️"),
        ("Calm", "🌙"),
        ("Dreamy", "☁️"),
        ("Lonely", "🌧️"),
        ("Chaos", "⚡️")
    ]

    var body: some View {

        ZStack {

            CameraPreview(camera: camera)
                .ignoresSafeArea()

            VStack {

                // MARK: - Title

                HStack {

                    VStack(alignment: .leading, spacing: 4) {

                        Text("EMOTION LENS")
                            .font(.headline)
                            .fontWeight(.bold)

                        Text("How do you see today?")
                            .font(.caption)
                            .opacity(0.8)
                    }

                    Spacer()
                }
                .foregroundStyle(.white)
                .padding()

                Spacer()


                // MARK: - Mood Selection

                VStack(spacing: 16) {

                    Text(camera.selectedMood.uppercased())
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)


                    ScrollView(
                        .horizontal,
                        showsIndicators: false
                    ) {

                        HStack(spacing: 12) {

                            ForEach(moods, id: \.0) { mood in

                                Button {

                                    camera.selectedMood = mood.0

                                } label: {

                                    VStack(spacing: 6) {

                                        Text(mood.1)
                                            .font(.title2)

                                        Text(mood.0)
                                            .font(.caption2)
                                    }
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 10)
                                    .background(
                                        camera.selectedMood == mood.0
                                        ? .white.opacity(0.25)
                                        : .black.opacity(0.25)
                                    )
                                    .clipShape(
                                        RoundedRectangle(
                                            cornerRadius: 12
                                        )
                                    )
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical, 20)
                .background(.black.opacity(0.4))
            }
        }
    }
}


#Preview {
    ContentView()
}
