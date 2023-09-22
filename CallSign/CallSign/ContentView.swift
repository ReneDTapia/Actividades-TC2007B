//
//  ContentView.swift
//  CallSign
//
//  Created by Barcelona 2009  on 21/09/23.
//
//me gusta la caca
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: TranscriptionViewModel = TranscriptionViewModel()
    @State private var isSidebarOpen: Bool = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Sidebar
                SidebarView()
                    .frame(width: 250)
                    .offset(x: isSidebarOpen ? 0 : -250)
                    .zIndex(0)

                // Contenido principal
                VStack(spacing: 20) {
                    Spacer()

                    // Espacio para la transcripción
                    TextEditor(text: $viewModel.transcription.text)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .font(.body)
                        .overlay(
                            Text(viewModel.transcription.text.isEmpty ? "Transcripción en tiempo real aparecerá aquí." : "")
                                .foregroundColor(.gray)
                        )

                    // Botón para iniciar llamada
                    Button(action: {
                        // Acción para iniciar llamada
                    }, label: {
                        Text("Iniciar Llamada")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })

                    Spacer()
                }
                .offset(x: isSidebarOpen ? 250 : 0)
                .disabled(isSidebarOpen ? true : false)
                .gesture(
                    DragGesture().onEnded {
                        if $0.translation.width > 50 {
                            withAnimation {
                                isSidebarOpen = true
                            }
                        } else if $0.translation.width < -50 {
                            withAnimation {
                                isSidebarOpen = false
                            }
                        }
                    }
                )
                .zIndex(1)

                // Botón de sidebar / retroceso
                Button(action: {
                    withAnimation {
                        isSidebarOpen.toggle()
                    }
                }) {
                    Image(systemName: isSidebarOpen ? "arrow.left" : "list.bullet")
                        .imageScale(.large)
                        .padding()
                    
                        .clipShape(Circle())
                }
                .position(x: 40, y: 10)
 // Colocar el botón en la parte superior izquierda
                .zIndex(2)
            }
        }
    }
}

struct SidebarView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            SidebarButton(title: "Configuración", color: Color.blue)
            SidebarButton(title: "Ayuda", color: Color.green)
            SidebarButton(title: "Acerca de", color: Color.orange)
            SidebarButton(title: "Otras opciones...", color: Color.purple)
            Spacer()
        }
        .padding()
        .frame(width: 250, alignment: .leading)
        .background(Color.white) // Fondo opaco
        .edgesIgnoringSafeArea(.all)
    }
}

struct SidebarButton: View {
    let title: String
    let color: Color
    
    var body: some View {
        Button(action: {
            // Acción para el botón
        }) {
            Text(title)
                .padding()
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .frame(width: 200, alignment: .leading)  // Ancho definido
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}













