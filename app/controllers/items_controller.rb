class ItemsController < ApplicationController
  def index
    @items = Item.includes(:shop).includes(:brand)
    # チェック済商品を画面表示
    @checked_items = Item.where(id: session[:checked_item_ids])
  end
  def show
    # チェックした商品をsessionに保存し、チェック済商品を画面表示できるようにする
    # sessionがない場合は初期化
    session[:checked_item_ids] = session[:checked_item_ids].present? ? session[:checked_item_ids] : []
    # sessionにチェックした商品IDを保存
    session[:checked_item_ids] << params[:id]
    @checked_items = Item.where(id: session[:checked_item_ids])
    @item = Item.find(params[:id])
  end
  def detail_search
  end

  # 検索パラメータの有無に応じて動的にSQL組み換えて検索実行
  def detail_search_result
    # 画面から検索パラメータを取得
    search_param_keyword = params[:detail_search][:keyword]
    search_param_brand = params[:detail_search][:brand]
    search_param_shop = params[:detail_search][:shop]
    # 検索パラメータによらないSQLの共通部分
    sql = "select i.* from items i inner join brands b on i.brand_id = b.id inner join shops s on i.shop_id = s.id where 1 = 1 "
    # 検索パラメータの有無に応じて動的にSQL組み換え
    # バインドパラメータ（hash形式）も同時に動的作成
    bind_params_hash = {}
    if search_param_keyword.present?
      sql << "and i.name like :search_param_keyword "
      bind_params_hash[:search_param_keyword] = '%' +search_param_keyword + '%'
    end
    if search_param_brand.present?
      sql << "and b.name like :search_param_brand "
      bind_params_hash[:search_param_brand] = '%' +search_param_brand + '%'
    end
    if search_param_shop.present?
      sql << "and s.name like :search_param_shop "
      bind_params_hash[:search_param_shop] = '%' +search_param_shop + '%'
    end
    # SQL生成
    sanitize_sql_array = []
    sanitize_sql_array << sql
    sanitize_sql_array << bind_params_hash
    exe_sql = ActiveRecord::Base.send(
      :sanitize_sql_array,
      sanitize_sql_array
    )
    # SQL実行
    con = ActiveRecord::Base.connection
    result = con.select_all(exe_sql)
    @result_items = result.to_hash
    # 暫定的にviewを表示
    render plain: @result_items
  end
end
