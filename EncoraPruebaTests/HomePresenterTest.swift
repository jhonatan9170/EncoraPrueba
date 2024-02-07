import XCTest
@testable import EncoraPrueba

class HomePresenterTests: XCTestCase {

    var sut: HomePresenter!
    var mockView: MockHomeView!
    var mockInteractor: MockHomeInteractor!
    var mockRouter: MockHomeRouter!

    override func setUp() {
        super.setUp()
        mockView = MockHomeView()
        mockInteractor = MockHomeInteractor()
        mockRouter = MockHomeRouter()
        sut = HomePresenter(interface: mockView, interactor: mockInteractor, router: mockRouter)
    }

    override func tearDown() {
        sut = nil
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
        super.tearDown()
    }

    func testGetPosts() {
        // When
        sut.getPosts()

        // Then
        XCTAssertTrue(mockInteractor.loadPostCalled)
    }

    func testFilterByTitle() {
        // Given
        let searchText = "Test1"
        let post1 = PostEntity(id: 1, title: "Test1 Title", subtitle: "Test1 Subtitle")
        let post2 = PostEntity(id: 2, title: "Test2 Title", subtitle: "Test2 Subtitle")
        sut.posts = [post1,post2]

        // When
        sut.filterByTitle(text: searchText)

        // Then
        XCTAssertTrue(mockView.showPostsCalled)
        XCTAssertEqual(sut.postsToShow.count, 1)
    }

    func testCleanFilter() {
        // Given
        let post1 = PostEntity(id: 1, title: "Test1 Title", subtitle: "Test1 Subtitle")
        let post2 = PostEntity(id: 2, title: "Test2 Title", subtitle: "Test2 Subtitle")
        sut.posts = [post1,post2]
        sut.postsToShow = []
        // When
        sut.cleanFilter()

        // Then
        XCTAssertTrue(mockView.showPostsCalled)
        XCTAssertEqual(sut.postsToShow.count, 2) // Assuming postsToShow is cleared in this test
    }

    func testPostForCellAtIndex() {
        // Given
        let post = PostEntity(id: 1, title: "Test Title", subtitle: "Test Subtitle")
        sut.postsToShow = [post]

        // When
        let retrievedPost = sut.postForCellAtIndex(0)

        // Then
        XCTAssertEqual(retrievedPost, post)
    }
    
    func postListDidFetchTest(){
        // Given
        let postModel1 = PostModel(id: 1, userID: 1, title: "Test1 Title", body: "Test1 Subtitle")
        let post1 = PostEntity(id: 1, title: "Test1 Title", subtitle: "Test1 Subtitle")

        // When
        sut.postListDidFetch(postList: [postModel1])

        // Then
        XCTAssertTrue(mockView.showPostsCalled)
        XCTAssertEqual(sut.postsToShow, [post1])
        XCTAssertEqual(sut.posts, [post1])
    }

    func testGoToDetailView() throws {
        // Given
        let post = PostEntity(id: 1, title: "Test Title", subtitle: "Test Subtitle")
        sut.postsToShow = [post]
        // When
        sut.goToDetailView(withIndex: 0)

        // Then
        let resultPost = try XCTUnwrap(mockRouter.post)
        XCTAssertTrue(mockRouter.goToDetailViewCalled)
        XCTAssertEqual(post,resultPost)
    }
    
    func testGoToError(){
        // Given
        let message = "Error Carga"
        // When
        sut.postListFailed(error: message)

        // Then
        XCTAssertTrue(mockRouter.shoeAlert)
        XCTAssertEqual(message,mockRouter.messageAlert)
    }
}

