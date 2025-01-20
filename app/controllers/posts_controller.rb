class PostsController < ApplicationController
    # viewのindex.html.erbと紐づく
    def index
        # @postはインスタンス変数で、ビューで使える
        # Post.allはPostモデルの全てのレコードを取得する
        @posts = Post.all
    end

    # viewのnew.html.erbと紐づく
    def new
        # Post.newはPostモデルの新しいインスタンスを作成する(title, contentを含んだオブジェクト)
        @post = Post.new
    end

    # これはsubmitボタンを押した時に自動で呼ばれる
    def create
      @post = Post.new(post_params)
      # このsaveメソッドはPostモデルの親クラスであるActiveRecord::Baseクラスのメソッド
      if @post.save
        redirect_to posts_path
      else
        render :new
      end
    end

    # viewのedit.html.erbと紐づく
    def edit
      @post = Post.find(params[:id])
    end

    # これはsubmitボタンを押した時に自動で呼ばれる
    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to posts_path
        else
            render :edit
        end
    end

    # deleteメソッドが呼ばれた時に自動で呼ばれる
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    # privateをつけると、このクラス内でしかそれ以降のコードは呼び出せない
    private

    def post_params
      # このparamsにはクエリパラメータだけでなく、リクエストボディの情報も含まれている
      # ここでは、postというキーに紐づく値のうち、titleとcontentだけを取り出している
      params.require(:post).permit(:title, :content)
    end
end
