class BookScraperJob < ApplicationJob
  queue_as :default

  def perform(search_term)
    scraper = BookScraper.new(search_term)
    scraper.get_books
  end
end
