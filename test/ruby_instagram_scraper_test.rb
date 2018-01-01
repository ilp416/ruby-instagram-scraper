require "minitest/autorun"
require "ruby-instagram-scraper"

describe RubyInstagramScraper do
  describe "when search" do
    it "users must be an array" do
      RubyInstagramScraper.search( "borodanov" )["users"].must_be_instance_of Array
    end
  end

  describe "when request user media nodes" do
    it "must be an array" do
      RubyInstagramScraper.get_user( "borodanov" ).must_be_instance_of Hash
    end
  end
  
  describe "when request tag media nodes" do
    it "must be an array" do
      RubyInstagramScraper.get_tag_media_nodes( "academgorodok" ).must_be_instance_of Array
    end
  end
  
  describe "when request a media" do
    it "must has equal code in field" do
      RubyInstagramScraper.get_media( "vKQeMNu7H1" )["shortcode"].must_equal "vKQeMNu7H1"
    end
  end
end
