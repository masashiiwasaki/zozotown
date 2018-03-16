$(function(){
  var searchList = $("#suggest");
  var couponItem = $('#couponItem');

  function appendItem(item){
    var html = `<li class="searchResult">
                  <p data-item-id="${item.id}" class="itemSearchResult">${item.name}</p>
                </li>`
    searchList.append(html);
  }

  function appendNoItem(item){
    var html = `<li>
                  <div>${item}</div>
                </li>`
    searchList.append(html);
  }

  function addItem(item){
    var html = `<li>
                  <div class="listInner clearfix">
                    <div class="photo" data-item-id="${item.id}">
                      <a href="/items/${item.id}">
                        <img src="${item.image_url}", alt="${item.description}" width="171" height="205">
                        <div class="feed-tag-group">
                          <div class="feed-tag-group-item">
                            <span class="feed-tag feed-tag-coupon coupon_C3">¥3,000クーポン</span>
                          </div>
                        </div>
                      </a>
                    </div>
                    <p class="label">${item.name}</p>
                    <p class="price discount">${item.proposed_price}
                      <span class="tax">税込</span>
                      <span class="off">(49%OFF)</span>
                    </p>
                  </div>
                </li>`
    couponItem.children().append(html);
  }

  // インクリメンタルサーチの検索結果を表示しつつ、検索ボタンを押下した場合
  function clickSearchSubmitBtn(){
    $('#searchSubmitBtn').on('click', function(e){
      // 検索結果が一瞬で消えてしまうのでpreventDefault入れています
      e.preventDefault();
      var input = $("#searchText").val();
      if(!(input== '')){
        $.ajax({
          type: 'GET',
          url: '/items/search',
          data: { keyword: input },
          dataType: 'json'
        })
        .done(function(item){
          couponItem.children().empty();
          item.forEach(function(item){
            addItem(item);
          });
        })
        .fail(function(){
          alert("指定した商品の表示に失敗しました");
        });
      }
    });
  }

  // インクリメンタルサーチ後の処理
  // 検索結果のアイテム名をクリックした場合
  function clickSearchResult(){
    $('.searchResult').on('click', 'p', function(){
      var itemId = $(this).data('itemId');
      $.ajax({
        type: 'GET',
        url: '/items/searchResult',
        data: { id: itemId },
        dataType: 'json'
      })
      .done(function(item){
        couponItem.children().empty();
        addItem(item);
      })
      .fail(function(){
        alert("指定した商品の表示に失敗しました");
      });
    });
  }

  // インクリメンタルサーチ
  $("#searchText").on("keyup", function(){
    var input = $(this).val();
    // 空文字の時は下記の処理をしないようにif文追加
    if(!(input== '')){
      $.ajax({
        type: 'GET',
        url: '/items/search',
        data: { keyword: input },
        dataType: 'json'
      })
      .done(function(items){
        searchList.empty();
        if(items.length !== 0){
          items.forEach(function(item){
            appendItem(item);
          });
          searchList.find('li').wrapAll('<ul>');
          // インクリメンタルサーチ後の処理
          // 検索結果のアイテム名をクリックした場合
          clickSearchResult();
          // インクリメンタルサーチの検索結果を表示しつつ、検索ボタンを押下した場合
          clickSearchSubmitBtn();
        }
        else {
          appendNoItem("一致する商品はありません");
          searchList.find('li').wrap('<ul>');
        }
      })
      .fail(function(){
        alert("検索に失敗しました");
      });
    }
  });
});
