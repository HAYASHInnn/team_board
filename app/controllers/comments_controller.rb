class CommentsController < ApplicationController
    # ログイン必須
    before_action :authenticate_user!

    def new
        @task = Task.find(params[:task_id])
        @comment = @task.comments.build(user: current_user)
    end
end
