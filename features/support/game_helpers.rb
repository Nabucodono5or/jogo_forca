module GameHelpers
    def start_new_game
        steps %{
           When I run 'forca' interactively
        }            
    end
end


World(GameHelpers)
