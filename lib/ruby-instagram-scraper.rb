require 'open-uri'
require 'json'

module RubyInstagramScraper
  BASE_URL = "https://www.instagram.com"

  def self.search ( query )
    # return false unless query
    url = "#{BASE_URL}/web/search/topsearch/"
    params = "?query=#{query}"

    JSON.parse open("#{url}#{params}").read
  end

  def self.get_user_media_nodes(username, max_id = nil)
    get_user(username, max_id)['media']['nodes']
  end

  def self.get_user(username, max_id = nil)
    url = "#{BASE_URL}/#{username}/?__a=1"
    url += "&max_id=#{max_id}" if max_id

    JSON.parse(open(url).read)['user']
  end

  def self.get_tag_media_nodes(tag, max_id = nil)
    url = "#{BASE_URL}/explore/tags/#{tag}/?__a=1"
    url += "&max_id=#{max_id}" if max_id

    JSON.parse(open(url).read)['tag']['media']['nodes']
  end

  def self.get_media(code)
    url = "#{BASE_URL}/p/#{code}/?__a=1"

    JSON.parse(open(url).read)['graphql']['shortcode_media']
  end
end
