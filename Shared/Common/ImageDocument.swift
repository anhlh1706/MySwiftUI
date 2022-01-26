//
//  ImageDocument.swift
//  MySwiftUI (iOS)
//
//  Created by Lê Hoàng Anh on 26/01/2022.
//

import UniformTypeIdentifiers
import SwiftUI

struct ImageDocument: FileDocument {
    
    static var readableContentTypes: [UTType] { [.png] }

    var image: UIImage

    init(image: UIImage?) {
        self.image = image ?? UIImage()
    }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let image = UIImage(data: data)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        self.image = image
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper(regularFileWithContents: image.pngData()!)
    }
    
}
