class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show
        #@user = User.find(params[:id]) # 查找 user
    end

    def new # 新建用户
        @user = User.new
    end

    def edit # 编辑用户
        #@user = User.find(params[:id])
    end

    def create # 创建用户
        @user = User.new(user_params)
        respond_to do |format|
            if @user.save
                format.html { redirect_to @user, notice: 'Add user successfully!' }
                format.json { render action: 'show', status: :created, location: @user }
            else
                format.html { render action: 'new' }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    def update # 更新信息
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to @user, notice: 'User was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: 'edit' }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy # 删除
        @user.destroy
        respond_to do |format|
            format.html { redirect_to users_url }
            format.json { head :no_content }
        end
    end

    private
        def set_user
            @user = User.find(params[:id])
        end

        def user_params
            params.require(:user).permit(:name, :avatar) # 只允许传入 avatar 和 name
        end

end
