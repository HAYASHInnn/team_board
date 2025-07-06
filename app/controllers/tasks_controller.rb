class TasksController < ApplicationController
    # ログイン必須
    before_action :authenticate_user!

    def new
        board = Board.find(params[:board_id])
        @task = board.tasks.build(user: current_user)
    end
end
