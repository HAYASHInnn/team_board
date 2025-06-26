class BoardsController < ApplicationController
    def new
        @board = current_user.boards.build
    end
end
