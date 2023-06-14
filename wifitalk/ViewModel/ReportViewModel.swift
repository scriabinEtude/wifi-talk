//
//  ReportViewModel.swift
//  wifitalk
//
//  Created by escher on 2023/06/14.
//

import SwiftUI
import Firebase

class ReportViewModel: ObservableObject {
    private static let placeHolder = "기능 건의 및 버그를 제보해 주세요\n의견을 남겨주시면 적극적으로 반영하겠습니다!\n\n피드백을 원하시면 이메일도 함께 남겨주세요"
    
    @Published var text: String = placeHolder
    @Published var isShowPicker: Bool = false
    @Published var image: UIImage?
    @Published var validate: Bool = false
    @Published var sending: Bool = false
    
    let repo = ReportRepository()
}

// MARK: - Helpers

extension ReportViewModel {
    func onTapEditor() {
        if text == Self.placeHolder {
            text = ""
        }
    }
    
    func showImagePicker() {
        withAnimation {
            self.isShowPicker.toggle()
        }
    }
    
    func validation() {
        validate = !text.isEmpty && text != Self.placeHolder
    }
    
    func send(callback: @escaping() -> Void) {
        sending = true
        repo.uploadImage(image: image) { screenshotUrl in
            let report = self.makeReport(screenshotUrl: screenshotUrl)
            self.repo.addDocument(model: report) { report in
                self.sending = false
                self.reset()
                callback()
            }
        }
    }
    
    private func makeReport(screenshotUrl url: String?) -> Report {
        return Report(
            text: self.text,
            image: url,
            timestamp: Timestamp(date: Date()),
            deviceName: UIDevice.current.name,
            deviceModel: UIDevice.current.model,
            deviceSystemName: UIDevice.current.systemName,
            deviceSystemVersion: UIDevice.current.systemVersion
        )
    }
    
    private func reset() {
        text = Self.placeHolder
        image = nil
    }
    
    func setPlaceHolder() {
        if text.isEmpty {
            text = Self.placeHolder
        }
    }
}
