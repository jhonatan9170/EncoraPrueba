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
        sut.getCountries()

        // Then
        XCTAssertTrue(mockInteractor.loadCountriesCalled)
    }

    func testFilterByTitle() {
        // Given
        let searchText = "Test1"
        let country1 = CountryModel(name: .init(common: "Test1", official: "", nativeName: [:]), capital: nil, region: "", subregion: "", population: 0, area: 0, flag: "", flags: .init(png: "", svg: ""), currencies: nil, languages: nil)
        let country2 = CountryModel(name: .init(common: "Test2", official: "", nativeName: [:]), capital: nil, region: "", subregion: "", population: 0, area: 0, flag: "", flags: .init(png: "", svg: ""), currencies: nil, languages: nil)
        sut.countries = [country1,country2]

        // When
        sut.filterCountriesByName(text: searchText)

        // Then
        XCTAssertTrue(mockView.showCountriesCalled)
        XCTAssertEqual(sut.countriesToShow.count, 1)
    }

    func testCleanFilter() {
        // Given
        let country1 = CountryModel(name: .init(common: "Test1", official: "", nativeName: [:]), capital: nil, region: "", subregion: "", population: 0, area: 0, flag: "", flags: .init(png: "", svg: ""), currencies: nil, languages: nil)
        let country2 = CountryModel(name: .init(common: "Test2", official: "", nativeName: [:]), capital: nil, region: "", subregion: "", population: 0, area: 0, flag: "", flags: .init(png: "", svg: ""), currencies: nil, languages: nil)
        sut.countries = [country1,country2]
        sut.countriesToShow = []
        // When
        sut.clearFilter()

        // Then
        XCTAssertTrue(mockView.showCountriesCalled)
        XCTAssertEqual(sut.countriesToShow.count, 2) // Assuming postsToShow is cleared in this test
    }

    func testPostForCellAtIndex() {
        // Given
        let country = CountryModel(name: .init(common: "Test", official: "", nativeName: [:]), capital: nil, region: "", subregion: "", population: 0, area: 0, flag: "", flags: .init(png: "", svg: ""), currencies: nil, languages: nil)
        sut.countriesToShow = [country]

        // When
        let retrievedCountry = sut.countryForCellAtIndex(0)

        // Then
        XCTAssertEqual(retrievedCountry, country)
    }
    
    func postListDidFetchTest(){
        // Given
        let country = CountryModel(name: .init(common: "Test", official: "", nativeName: [:]), capital: nil, region: "", subregion: "", population: 0, area: 0, flag: "", flags: .init(png: "", svg: ""), currencies: nil, languages: nil)
        sut.countriesToShow = [country]

        // When
        sut.countryListDidFetch(countries: [country])

        // Then
        XCTAssertTrue(mockView.showCountriesCalled)
        XCTAssertEqual(sut.countriesToShow, [country])
        XCTAssertEqual(sut.countries, [country])
    }

    func testGoToDetailView() throws {
        // Given
        let country = CountryModel(name: .init(common: "Test", official: "", nativeName: [:]), capital: nil, region: "", subregion: "", population: 0, area: 0, flag: "", flags: .init(png: "", svg: ""), currencies: nil, languages: nil)
        sut.countriesToShow = [country]
        // When
        sut.goToDetailView(withIndex: 0)

        // Then
        let resultCountry = try XCTUnwrap(mockRouter.country)
        XCTAssertTrue(mockRouter.goToDetailViewCalled)
        XCTAssertEqual(country,resultCountry)
    }
    
    func testGoToError(){
        // Given
        let message = "Error Carga"
        // When
        sut.countryListFailed(error: message)

        // Then
        XCTAssertTrue(mockRouter.shoeAlert)
        XCTAssertEqual(message,mockRouter.messageAlert)
    }
}

