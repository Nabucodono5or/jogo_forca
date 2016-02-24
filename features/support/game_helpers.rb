module GameHelpers

    def set_rafflable_words(words)
    	@rafflable_words = words
    end

    def start_new_game
	set_rafflable_words(%w[hi mom game fruit]) if @rafflable_words.nil?

        steps %{
           When I run 'forca "#{@rafflable_words}"' interactively
        }            
    end

end


World(GameHelpers)
