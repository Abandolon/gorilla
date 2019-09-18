require 'open-uri'
require 'nokogiri'

def scraper(url)

  products = []

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.productListProducts_product').each do |product|
    name = product.search(".athenaProductBlock_title").text.strip
    price = product.search(".athenaProductBlock_priceBlock").text.strip
    photo = product.search(".athenaProductBlock_linkImage img").map {|tag| tag.attribute('src').value }
    price
    products << {
      name: name,
      photo: photo,
      price: price.match('\d{2},\d{2}'),
    }
  end
  return products
end


def gymscraper(url)

  gyms = []

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.gym-tile').each do |gym|
    name = gym.search(".text-secondary").text.strip
    location = gym.search(".address").text.strip
    logo = gym.search(".gym-logo").attribute("data-original").value

    gyms << {
      name: name,
      photo: logo,
      address: location,
    }
  end
  return gyms
end
