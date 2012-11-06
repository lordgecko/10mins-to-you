module InterpreterAddon
  require './lib/parser/tokenizer'
  require './lib/parser/parser'

    def parse_text(text)
      
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
