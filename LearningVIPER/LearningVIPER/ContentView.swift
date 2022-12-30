//////
//////  ContentView.swift
//////  LearningVIPER
//////
//////  Created by Apple  on 20/12/22.
//////
////
////import SwiftUI
////
////struct ContentView: View {
////    @StateObject var presenter = UserPresenter()
////
////    var body: some View {
////        UserListView(presenter: presenter)
////    }
////}
////
//////struct ContentView_Previews: PreviewProvider {
//////    static var previews: some View {
//////        ContentView()
//////    }
//////}
////
////
//////Entity
////struct User {
////    let id: Int
////    var name: String
////    var age: Int
////}
////
//////Interactor
////class UserInteractor {
////    private var users: [User] = []
////
////    func fetchUsers(completion: @escaping ([User]) -> Void) {
////        // Make an API call to fetch the list of users
////        // ...
////
////        completion(users)
////    }
////
////    func updateUser(_ user: User, completion: @escaping (Bool) -> Void) {
////        // Make an API call to update the user
////        // ...
////
////        completion(true)
////    }
////}
////
//////Presenter
////class UserPresenter:ObservableObject{
////    private let interactor: UserInteractor
////    private let router: UserRouter
////
////    var users: [User] = []
////
////    init(interactor: UserInteractor, router: UserRouter) {
////        self.interactor = interactor
////        self.router = router
////    }
////
////    func viewDidLoad() {
////        interactor.fetchUsers { [weak self] users in
////            self?.users = users
////            // Update the view to show the fetched users
////        }
////    }
////
////    func didTapEditButton(forUser user: User) {
////        router.showEditView(forUser: user)
////    }
////
////    func didFinishEditing(user: User) {
////        interactor.updateUser(user) { [weak self] success in
////            if success {
////                self?.router.dismissEditView()
////            } else {
////                // Show an error message
////            }
////        }
////    }
////}
////
//////View
////struct UserListView: View {
////    @ObservedObject var presenter: UserPresenter
////
////    var body: some View {
////        List {
////            ForEach(presenter.users) { user in
////                Text(user.name)
////            }
////        }
////    }
////}
////
//////struct EditUserView: View {
//////    @ObservedObject var presenter: UserPresenter
//////    @State var user: User
//////
//////    var body: some View {
//////        VStack {
//////            TextField("Name", text: $user.name)
//////            TextField("Age", text: $user.age)
//////            Button("Save") {
//////                presenter.didFinishEditing(user: user)
//////            }
//////        }
//////    }
//////}
////
////
//////router
////class UserRouter {
////    private let presenter: UserPresenter
////    private let window: UIWindow
////
////    init(presenter: UserPresenter, window: UIWindow) {
////        self.presenter = presenter
////        self.window = window
////    }
////
////    func showEditView(forUser user: User) {
////        let editView = EditUserView(presenter: presenter, user: user)
////        let navigationController = UINavigationController(rootViewController: UIHostingController(rootView: editView))
////        window.rootViewController?.present(navigationController, animated: true)
////    }
////
////    func dismissEditView() {
////        window.rootViewController?.dismiss(animated: true)
////    }
////}
//
////Here is a simple example of a SwiftUI app using the Viper architecture. This example shows a list of users that can be viewed and edited.
//
////First, let's define the model objects in the Entity layer:
//
//import SwiftUI
//
//
////Copy code
//struct User {
//    let id: Int
//    var name: String
//    var age: Int
//}
////Next, let's define the Interactor layer, which will contain the business logic for fetching and updating the list of users:
//
////Copy code
//class UserInteractor {
//    private var users: [User] = []
//
//    func fetchUsers(completion: @escaping ([User]) -> Void) {
//        // Make an API call to fetch the list of users
//        // ...
//
//        completion(users)
//    }
//
//    func updateUser(_ user: User, completion: @escaping (Bool) -> Void) {
//        // Make an API call to update the user
//        // ...
//
//        completion(true)
//    }
//}
////Then, we can define the Presenter layer, which will handle tasks such as formatting the data for display and responding to user actions:
//
////Copy code
//class UserPresenter {
//    private let interactor: UserInteractor
//    private let router: UserRouter
//
//    var users: [User] = []
//
//    init(interactor: UserInteractor, router: UserRouter) {
//        self.interactor = interactor
//        self.router = router
//    }
//
//    func viewDidLoad() {
//        interactor.fetchUsers { [weak self] users in
//            self?.users = users
//            // Update the view to show the fetched users
//        }
//    }
//
//    func didTapEditButton(forUser user: User) {
//        router.showEditView(forUser: user)
//    }
//
//    func didFinishEditing(user: User) {
//        interactor.updateUser(user) { [weak self] success in
//            if success {
//                self?.router.dismissEditView()
//            } else {
//                // Show an error message
//            }
//        }
//    }
//}
////Finally, we can define the View layer, which consists of the SwiftUI views and view controllers that display the user interface:
//
////Copy code
//struct UserListView: View {
//    @ObservedObject var presenter: UserPresenter
//
//    var body: some View {
//        List {
//            ForEach(presenter.users) { user in
//                Text(user.name)
//            }
//        }
//    }
//}
//
//struct EditUserView: View {
//    @ObservedObject var presenter: UserPresenter
//    @State var user: User
//
//    var body: some View {
//        VStack {
//            TextField("Name", text: $user.name)
//            TextField("Age", text: $user.age)
//            Button("Save") {
//                presenter.didFinishEditing(user: user)
//            }
//        }
//    }
//}
////This is a very simple example, but it should give you an idea of how the Viper architecture can be used to organize a SwiftUI app.


import SwiftUI


import SwiftUI

// MARK: - View
struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.title)

            Text(viewModel.body)
                .font(.body)
        }
    }
}

// MARK: - View Model
class ContentViewModel: ObservableObject {
    @Published var title: String
    @Published var body: String

    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
}

// MARK: - Interactor
protocol ContentInteractorInput {
    func fetchContent()
}

protocol ContentInteractorOutput: class {
    func didFetchContent(_ content: Content)
}

class ContentInteractor: ContentInteractorInput {
    weak var output: ContentInteractorOutput?

    func fetchContent() {
        // Perform some network request or data fetching here
        let content = Content(title: "Sample Title", body: "Sample Body")
        output?.didFetchContent(content)
    }
}

// MARK: - Presenter
protocol ContentPresenterInput {
    func viewDidLoad()
}

protocol ContentPresenterOutput: class {
    func setContent(_ content: Content)
}

class ContentPresenter: ContentPresenterInput {
    weak var output: ContentPresenterOutput?

    private let interactor: ContentInteractorInput

    init(interactor: ContentInteractorInput) {
        self.interactor = interactor
    }

    func viewDidLoad() {
        interactor.fetchContent()
    }
}

// MARK: - Entity
struct Content {
    let title: String
    let body: String
}

// MARK: - Router
protocol ContentRouterInput {

}

class ContentRouter: ContentRouterInput {

}

// MARK: - Assembly
//struct ContentAssembly {
//    static func assembleModule() -> ContentView {
//        let interactor = ContentInteractor()
//        let presenter = ContentPresenter(interactor: interactor)
//        let router = ContentRouter()
//        let viewModel = ContentViewModel(title: "", body: "")
//
//        interactor.output = presenter as! any ContentInteractorOutput
//        presenter.output = viewModel as! any ContentPresenterOutput
//        viewModel.viewModel = viewModel
//
//        return ContentView(viewModel: viewModel)
//    }
//}
