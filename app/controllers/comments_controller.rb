class CommentsController < ApplicationController
    # ログイン必須
    before_action :authenticate_user!

    def new
        @task = Task.find(params[:task_id])
        @comment = @task.comments.build(user: current_user)
    end

    def create
        @task = Task.find(params[:task_id])
        @comment = @task.comments.build(comment_params.merge(user: current_user))
        if @comment.save
            redirect_to board_task_path(@task.board, @task), notice: 'コメントを追加しました'
        else
            flash.now[:error] = 'コメントの追加に失敗しました'
            render :new, status: :unprocessable_entity
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end
