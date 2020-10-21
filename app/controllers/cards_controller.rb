class CardsController < ApplicationController
  #layout 'cards'
  before_action :move_to_index, except: :index  #非ログイン時の直接アクセスを禁止し、indexにリダイレクトする。
  after_action :status_out, only: :edit #通常更新(外出)の際に状態を空白にする

  def index
    @cards = Card.all.order("department ASC, sort_key ASC")#所属で昇順後、ソートキーで昇順
    @content_title = '東京支店'
  end

  def show
    @card = Card.find(params[:id])
    @content_title = '「' + @card.name + '」 の詳細'
  end

  def add
    @content_title = '新規データ登録'
    if request.post? then
      Card.create(card_params)
      move_to_admin
    else
      @card = Card.new
    end
  end

  def edit
    @card = Card.find(params[:id])
    @content_title = '「' + @card.name + '」 の行動予定を編集中'
    if request.patch? then
      @card.update(card_params)
      goback
    end
  end
  
  def profile_edit
    @card = Card.find(params[:id])
    @content_title = '「' + @card.name + '」 の基本情報を編集中'
    if request.patch? then
      @card.update(card_params)
      move_to_admin
    end
  end

  def delete
    Card.find(params[:id]).destroy
    move_to_admin
  end
  
  def admin
    @content_title = '管理者画面'
    @cards = Card.all.order("department ASC, sort_key ASC")
  end
  
  def status_in_office
    card = Card.find(params[:id])
    card.update(destination: "", arrive_date: "", schedule: "", status: "社内")
    goback
  end
  
  def status_go_home
    card = Card.find(params[:id])
    card.update(destination: "", arrive_date: "", schedule: "", status: "帰宅")
    goback
  end


  def ext_sales
  @cards = Card.where(department: "1:営業").order(sort_key: "ASC")
  @content_title = '営業部'
  end
  
  def ext_const
  @cards = Card.where(department: "2:工事").order(sort_key: "ASC")
  @content_title = '工事部'
  end
  
  def ext_eng
  @cards = Card.where(department: "3:技術").order(sort_key: "ASC")
  @content_title = '技術部'
  end
  
  def ext_acct
  @cards = Card.where(department: "4:業務").order(sort_key: "ASC")
  @content_title = '業務部'
  end
  
  def ext_other
  @cards = Card.where(department: "5:その他").order(sort_key: "ASC")
  @content_title = 'その他'
  end

  private
  def card_params
    params.require(:card).permit(:name, :destination, :sort_key, :mobile, :arrive_date, :schedule, :department, :status)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
  def goback
    redirect_to action: :index
  end
  
  def move_to_admin
    redirect_to action: :admin
  end
  
  def status_out
    card = Card.find(params[:id])
    card.update(status: "") 
  end
end