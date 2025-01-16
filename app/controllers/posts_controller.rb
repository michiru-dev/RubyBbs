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
      if @post.save
        redirect_to posts_path
      else
        render :new
      end
    end

    # privateをつけると、このクラス内でしかそれ以降のコードは呼び出せない
    private

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
