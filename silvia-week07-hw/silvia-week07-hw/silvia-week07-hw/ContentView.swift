import SwiftUI
import PhotosUI

struct PuzzlePiece: Identifiable {
    let id: Int
    let image: UIImage
}

struct ContentView: View {

    // Photo Picker
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: UIImage?

    // Puzzle
    @State private var pieces: [PuzzlePiece] = []
    @State private var selectedPiece: Int?

    // Game
    @State private var moves = 0
    @State private var puzzleComplete = false

    let columns = [
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]

    var body: some View {

        ScrollView {

            VStack(spacing: 20) {

                Text("PHOTO PUZZLE")
                    .font(.largeTitle)
                    .bold()

                Text("Turn your photo into a puzzle.")
                    .foregroundColor(.secondary)


                // MARK: Photo Picker

                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images
                ) {

                    Text("Choose a Photo")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }


                // MARK: Puzzle

                if pieces.isEmpty {

                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray.opacity(0.15))
                        .frame(height: 350)
                        .overlay {

                            VStack(spacing: 10) {

                                Image(systemName: "photo")
                                    .font(.largeTitle)

                                Text("Choose a photo to start")
                                    .foregroundColor(.secondary)
                            }
                        }

                } else {

                    LazyVGrid(
                        columns: columns,
                        spacing: 2
                    ) {

                        ForEach(Array(pieces.enumerated()), id: \.element.id) { index, piece in

                            Image(uiImage: piece.image)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 110)
                                .clipped()

                                // Show selected piece
                                .overlay {

                                    if selectedPiece == index {

                                        Rectangle()
                                            .stroke(
                                                Color.blue,
                                                lineWidth: 5
                                            )
                                    }
                                }

                                .onTapGesture {

                                    selectPiece(index)
                                }
                        }
                    }
                    .aspectRatio(1, contentMode: .fit)


                    // MARK: Game Information

                    HStack {

                        Text("Moves: \(moves)")

                        Spacer()

                        if puzzleComplete {

                            Text("Puzzle Complete! 🎉")
                                .bold()
                        }
                    }


                    // MARK: Buttons

                    HStack {

                        Button("Shuffle") {

                            shufflePuzzle()
                        }

                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)


                        Button("Reset") {

                            resetPuzzle()
                        }

                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.primary)
                        .cornerRadius(12)
                    }
                }
            }

            .padding()
        }


        // MARK: Load Photo

        .onChange(of: selectedItem) {

            Task {

                if let data = try? await selectedItem?.loadTransferable(
                    type: Data.self
                ) {

                    if let image = UIImage(data: data) {

                        selectedImage = image

                        createPuzzle(from: image)
                    }
                }
            }
        }
    }


    // MARK: - Create Puzzle

    func createPuzzle(from image: UIImage) {

        pieces = []

        guard let cgImage = image.cgImage else {
            return
        }

        let width = cgImage.width / 3
        let height = cgImage.height / 3

        var id = 0

        for row in 0..<3 {

            for column in 0..<3 {

                let rect = CGRect(
                    x: column * width,
                    y: row * height,
                    width: width,
                    height: height
                )

                if let croppedImage = cgImage.cropping(
                    to: rect
                ) {

                    let pieceImage = UIImage(
                        cgImage: croppedImage
                    )

                    let piece = PuzzlePiece(
                        id: id,
                        image: pieceImage
                    )

                    pieces.append(piece)

                    id += 1
                }
            }
        }

        moves = 0
        selectedPiece = nil
        puzzleComplete = false
    }


    // MARK: - Select Piece

    func selectPiece(_ index: Int) {

        if let firstPiece = selectedPiece {

            // Tap same piece again
            if firstPiece == index {

                selectedPiece = nil
                return
            }


            // Swap two pieces

            pieces.swapAt(
                firstPiece,
                index
            )

            selectedPiece = nil

            moves += 1

            checkPuzzle()

        } else {

            // Select first piece

            selectedPiece = index
        }
    }


    // MARK: - Shuffle

    func shufflePuzzle() {

        pieces.shuffle()

        moves = 0
        selectedPiece = nil
        puzzleComplete = false
    }


    // MARK: - Reset

    func resetPuzzle() {

        guard let selectedImage else {
            return
        }

        createPuzzle(from: selectedImage)
    }


    // MARK: - Check Puzzle

    func checkPuzzle() {

        for index in 0..<pieces.count {

            if pieces[index].id != index {

                puzzleComplete = false
                return
            }
        }

        puzzleComplete = true
    }
}


#Preview {
    ContentView()
}
