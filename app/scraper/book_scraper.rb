require "net/http"
require "nokogiri"
require "uri"



class BookScraper
    attr_accessor :books, :search_term

    def initialize(search_term)
        @books = Array.new
        @search_term = search_term
    end

    def fetch_details(book_url)
        response = Net::HTTP.get(URI("http://#{book_url}"))
        parsed_dom = Nokogiri::HTML5(response)
       
        {
            :download_link => parsed_dom.at("a:contains('Cloudflare')")['href'],
            :cover => "library.lol#{parsed_dom.xpath("//img[@alt='cover']")[0]['src']}",
            :author => parsed_dom.at('p:contains("Author")').text
        }
    end
    
    
    def get_books
        # books = Array.new
        additional_params = "lg_topic=libgen&open=0&view=simple&res=25&phrase=1&column=def"
        puts @search_term
        modified_str = @search_term.include?(' ') ? @search_term.gsub(' ', '+').downcase : @search_term
        # puts modified_str
        url = "http://libgen.is?req=#{modified_str}&#{additional_params}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        parsed = Nokogiri::HTML5(response)
        links = parsed.xpath("//td[@width='500']//a[@title='']")
        links.each do |link| 
            parsed_link = URI(link['href'])
            md5_hash =  URI.decode_www_form(parsed_link.query || "").assoc("md5")&.last
            details = fetch_details("library.lol/main/#{md5_hash}")
            book_hash = {:title => link.text, :link => "library.lol/main/#{md5_hash}"}.merge!(details)
            if @books.include? book_hash
                nil
            else
                @books.push(book_hash)
            end
    
            # puts "title: #{link.text}, link #{link['href']}"
            # headlines.push(link.text)
        end
        
        return @books
    end

end


# scraper = BookScraper.new("social psychology")
# scraper.get_books


