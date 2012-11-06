class Tokenizer
#create tokens from text
def self.tokenize(contents)

  contents.gsub!(/AND/,",AND,")
  contents.gsub!(/OR/,",OR,")
  contents.gsub!(/\s+/,"")
  tokens = [ ] 
  while !contents.empty?
    if contents.sub! /^declare/, ""
      tokens << :dec
      elsif contents.sub! /^compute/, ""
        tokens << :comp
        elsif contents.sub! /^print/, ""
          tokens << :print
          elsif contents.sub! /^eval/, ""
            tokens << :eval
            elsif contents.sub! /^\(/, ""
              tokens << :lbrace
              elsif contents.sub! /^\)/, ""
                tokens << :rbrace
                elsif contents.sub! /^,AND,/, ""
                  tokens << { :log => :AND }
                  elsif contents.sub! /^,OR,/, ""
                    tokens << { :log => :OR }
                    elsif contents.sub! /^true/, ""
                      tokens << { :bool => true }
                      elsif contents.sub! /^false/, ""
                        tokens << { :bool => false }
                        elsif a = contents[/^[a-z][a-z|A-Z]*/]
                          tokens << { :var => a.to_sym }
                          contents.sub! a, ""
                          elsif contents.sub! /^,/, ""
                            tokens << :comma
                            elsif contents.sub! /^;/, ""
                              tokens << :semicol
                              else 
                                tokens << { :UNDEFINED_TOKEN => contents[/^..../] }
                                contents = ""
    end
  end
  tokens  
end      

end    
