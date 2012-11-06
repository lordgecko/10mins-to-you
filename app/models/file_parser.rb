require './lib/parser/tokenizer'
require './lib/parser/parser'
class FileParser < ActiveRecord::Base
  # attr_accessible :title, :body
  
  def self.parse_text(text)
      
      parser = Parser.new
      parser.build_tree
      
      Tokenizer.tokenize(text).each do |token|
        unless parser.feed_token token
          break
        end
      end
      parser.messages
    end
end
