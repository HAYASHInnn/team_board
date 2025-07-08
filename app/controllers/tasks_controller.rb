class TasksController < ApplicationController
    # ログイン必須
    before_action :authenticate_user!

    def show
        @task = Task.find(params[:id])
    end

    def new
        board = Board.find(params[:board_id])
        @task = board.tasks.build(user: current_user)
    end

    def create
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params.merge(user: current_user))
        if @task.save
            redirect_to board_path(board), notice: 'タスクを追加しました'
        else
            flash.now[:error] = '更新できませんでした'
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @task = current_user.tasks.find(params[:id])
    end

    def update
        @task = current_user.tasks.find(params[:id])
        if @task.update(task_params)
            redirect_to board_task_path(@task.board, @task), notice: '更新できました'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit, status: :unprocessable_entity
        end
    end

    private
    def task_params
        params.require(:task).permit(:title, :content, :deadline, :eyecatch)
    end
end
