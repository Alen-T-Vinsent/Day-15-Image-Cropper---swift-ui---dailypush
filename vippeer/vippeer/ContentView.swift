import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        Text(viewModel.title)
            .onTapGesture {
                self.viewModel.router.showDetailView()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}

// MARK: - ViewModel

class ContentViewModel: ObservableObject {
    @Published var title = ""
    let router = ContentRouter()
    
    init() {
        let interactor = ContentInteractor(presenter: self)
        interactor.fetchData()
    }
}

extension ContentViewModel: ContentPresenterProtocol {
    func set(title: String) {
        self.title = title
    }
}

// MARK: - Interactor

class ContentInteractor {
    let presenter: ContentPresenterProtocol
    
    init(presenter: ContentPresenterProtocol) {
        self.presenter = presenter
    }
    
    func fetchData() {
        // Perform some data fetching or processing here
        let entity = ContentEntity()
        let title = entity.title
        presenter.set(title: title)
    }
}

// MARK: - Presenter

protocol ContentPresenterProtocol: AnyObject {
    func set(title: String)
}

class ContentPresenter: ContentPresenterProtocol{
    weak var viewModel: ContentViewModel?
    
    func set(title: String) {
        viewModel?.title = title
    }
}

// MARK: - Entity

struct ContentEntity {
    let title = "Hello, Worlbbkbjjkkd!"
}

// MARK: - Router

class ContentRouter {
    
    func showDetailView() {
        // Navigate to the detail view here
    }
}
