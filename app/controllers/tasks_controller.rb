class TasksController < ApplicationController
    # ログイン必須
    before_action :authenticate_user!

    def new
        board = Board.find(params[:board_id])
        @task = board.tasks.build(user: current_user)
    end

    def create
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params.merge(user: current_user))
        if @task.save
            redirect_to board_path(board), notice: "タスクを追加しました"
        else
            flash.now[:error] = '更新できませんでした'
            render :new, status: :unprocessable_entity
        end
    end

    private
    def task_params
        params.require(:task).permit(:title, :content, :deadline)
    end
end
