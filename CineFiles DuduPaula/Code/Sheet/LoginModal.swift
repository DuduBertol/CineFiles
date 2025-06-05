
import SwiftUI

struct LoginModal: View {
    
    @Binding var selectedView: Int
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var showIncorrectPassword = false
    
    @State var showAlert = false
    
    @Binding var modalType: StartView.ModalType
    
    var gradient: LinearGradient {
        LinearGradient(colors: [.sGreen, .sBlue], startPoint: .leading,endPoint: .trailing)
    }
    
    var gray: LinearGradient {
        LinearGradient(colors: [.sGray.opacity(0.3), .sGray.opacity(0.5)], startPoint: .leading, endPoint: .trailing)
    }
    
    var gray2: LinearGradient {
        LinearGradient(colors: [.sGray, .sGray], startPoint: .leading, endPoint: .trailing)
    }
    
    private var canConfirmSignIn: Bool {
        if modalType == .signup{
            !name.isEmpty && !email.isEmpty && !password.isEmpty
        }
        else {
            !email.isEmpty && !password.isEmpty
        }
    }
    
    // TODO: Implementar alerta
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Bem-vindo" + (modalType == .login ? " de volta!" : "!"))
                .font(.title)
                .fontWeight(.bold)
            
            Form {
                
                //MARK: NAME
                if modalType == .signup{
                    Section {
                        
                        TextField(
                            "",
                            text: $name,
                            prompt: Text("Insira o seu nome")
                                .foregroundStyle(.sGray)
                        )
                        .font(.subheadline)
                        .foregroundStyle(.primary)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke((!name.isEmpty ? gradient : gray2), lineWidth: 1)
                        }
                        .textContentType(.emailAddress)
                        
                    } header: {
                        Text("Nome")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle((!name.isEmpty ? gradient : gray2))
                    }
                    
                    Spacer()
                        .frame(height: 24)
                }
                
                
                //MARK: EMAIL
                Section {
                    TextField(
                        "",
                        text: $email,
                        prompt: Text("Insira o seu e-mail")
                            .foregroundStyle(.sGray)
                    )
                    .font(.subheadline)
                    .foregroundStyle(.primary)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke((!email.isEmpty ? gradient : gray2), lineWidth: 1)
                    }
                    .textContentType(.emailAddress)
                    
                } header: {
                    Text("E-mail")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle((!email.isEmpty ? gradient : gray2))
                }
                
                Spacer()
                    .frame(height: 24)
                
                
                //MARK: PASSWORD
                Section {
                    VStack {
                        SecureField(
                            "",
                            text: $password,
                            prompt: Text("Insira a sua senha")
                                .foregroundStyle(.sGray)
                        )
                        .font(.subheadline)
                        .foregroundStyle(.primary)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 30)
                                .stroke((!password.isEmpty ? gradient : gray2), lineWidth: 1)
                        }
                        .textContentType(.password)
                    }
                    
                } header: {
                    HStack {
                        Text("Senha")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle((!password.isEmpty ? gradient : gray2))
                        
                        Spacer()
                        
                        if modalType == .login{
                            Button(action: {
                                showAlert = true
                                //QUANDO O MODAL FECHA, automaticamente fica FALSE!!
                            }) {
                                Text("Recuperar senha")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .formStyle(.columns)
            
            Button(action: {
                withAnimation {
                    selectedView = 1
                }
            }) {
                Text("Confirmar")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .foregroundStyle(
                        canConfirmSignIn ? .white : .sGray
                    )
                    .background(
                        canConfirmSignIn ? gradient : gray
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            }
            .disabled(!canConfirmSignIn)
            
            HStack{
                if modalType == .signup{
                    Text("Já tem uma conta?")
                    Button{
                        withAnimation{
                            modalType = .login
                        }
                    }label:{
                        Text("Entrar")
                            .foregroundStyle(.sPink)
                    }
                } else{
                    Text("Novo por aqui?")
                    Button{
                        withAnimation{
                            modalType = .signup
                        }
                    }label:{
                        Text("Registre-se")
                            .foregroundStyle(.sPink)
                    }
                }
            }
            .font(.subheadline)
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding()
        .alert("Verifique sua conta", isPresented: $showAlert) {
            Button{
                //fecha o alerta
            }label: {
                Text("Fechar")
                    .fontWeight(.semibold)
            }
        } message: {
            Text("Enviamos um e-mail de confirmação!")
        }
    }
}

#Preview {
    LoginModal(selectedView: .constant(0), modalType: .constant(.login))
}
