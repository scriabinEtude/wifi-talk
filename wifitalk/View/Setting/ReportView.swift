//
//  ReportView.swift
//  wifitalk
//
//  Created by escher on 2023/06/14.
//

import SwiftUI
import PhotosUI

struct ReportView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm = ReportViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextEditor(text: $vm.text)
                .padding(.vertical, 10)
                .onTapGesture { vm.onTapEditor() }
                .onChange(of: vm.text) { _ in vm.validation()}
                
                ScreenShot(
                    isShow: $vm.isShowPicker,
                    image: $vm.image,
                    onTap: vm.showImagePicker
                )
                .padding(.top, 50)
                
                Spacer()
            }
        }
        .padding()
        .toolbar {
            if vm.sending {
                ProgressView()
            } else {
                Button("보내기") {
                    vm.send { presentationMode.wrappedValue.dismiss() }
                }.disabled(!vm.validate)
            }
        }
        .navigationTitle("기능 & 버그")
        .onTapGesture { endEditing() }
        .onAppear { vm.setPlaceHolder() }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}


private struct ScreenShot: View {
    @Binding var isShow: Bool
    @Binding var image: UIImage?
    var onTap: () -> Void
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 16)
                .stroke(style: StrokeStyle(
                    lineWidth: 3,
                    dash: [5]
                ))
                .frame(width: 120, height: 120)
                .foregroundColor(Color(.systemGray3))
            if image == nil {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(Color(.systemGray3))
            } else {
                Image(uiImage: image!)
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(width: 120, height: 120)
        .onTapGesture {
            onTap()
            endEditing()
        }
        .sheet(isPresented: $isShow) {
            ImagePicker(image: $image)
        }
        
    }
}
