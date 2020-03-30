parents = ["レディース", "メンズ", "ベビー・キッズ", "インテリア・住まい・小物", "本・音楽・ゲーム",
            "おもちゃ・ホビー・グッズ", "コスメ・香水・美容", "家電・スマホ・カメラ", "スポーツ・レジャー",
            "ハンドメイド" ,"チケット" ,"自動車・オートバイ" ,"その他"]

children = [
            # レディースの子
            ["トップス","ジャケット","パンツ","スカート","ワンピース","靴","ルームウェア/パジャマ","レッグウェア",
              "帽子","バッグ","アクセサリー","ヘアアクセサリー","小物","時計","ウィッグ/エクステ","浴衣/水着",
              "スーツ/フォーマル/ドレス","マタニティ","その他"],
              # メンズの子
            ["トップス","ジャケット/アウター","パンツ","靴","バッグ","スーツ","帽子","アクセサリー","小物","時計","水着","レッグウェア","その他"],
            # ベビー・キッズの子要素
            ["ベビー服(女の子用) ~95cm","ベビー服(男の子用) ~95cm","ベビー服(男女兼用) ~95cm","キッズ服(女の子用) 100cm~",
              "キッズ服(男の子用) 100cm~","キッズ服(男女兼用) 100cm~","キッズ靴","子ども用ファッション小物","おむつ/トイレ/バス","外出/移動用品",
             "授乳/食事","ベビー家具/寝具/室内用品","おもちゃ","行事/記念品","その他"],
            # インテリア・住まい・小物の子要素
            ["キッチン/食器","ベッド/マットレス"],
            # 本・音楽・ゲームの子要素
            ["キッチン/食器","ベッド/マットレス"],
            # おもちゃ・ホビー・グッズの子要素
            ["おもちゃ","タレントグッズ"],
            # コスメ・香水・美容の子要素
            ["ベースメイク","メイクアップ"],
            # 家電・スマホ・カメラの子要素
            ["スマートフォン/携帯電話","スマホアクセサリー"],
            # スポーツ・レジャーの子要素
            ["ゴルフ","フィッシング"],
            # ハンドメイドの子要素
            ["アクセサリー(女性用)","ファッション/小物"],
            # チケットの子要素
            ["音楽","スポーツ"],
            # 自動車・オートバイの子要素
            ["自転車本体","自転車タイヤ/ホイール"],
            # その他の子要素
            ["ペット用品","食品"]
          ]

grand_children = [
#レディース
    #トップス
    ["Tシャツ/カットソー女(半袖/袖なし)","Tシャツ/カットソー(七分/長袖)","シャツ/ブラウス(半袖/袖なし)","シャツ/ブラウス(七分/長袖)","ポロシャツ","その他"],
    #ジャケット
    ["テーラードジャケット女","ノーカラージャケット","デニムジャケット","レザージャケット","ダウンジャケット","ライダースジャケット","その他"],
    #パンツ
    ["デニム/ジーンズ","ショートパンツ","カジュアルパンツ","ハーフパンツ","その他"],
    #スカート
    ["ミニスカート","ひざ丈スカート","ロングスカート","キュロット","その他"],
    #ワンピース
    ["ミニワンピース","ひざ丈ワンピース","ロングワンピース","その他"],
    #靴
    ["ハイヒール/パンプス","ブーツ","サンダル","スニーカー","その他"],
    #ルームウェア
    ["パジャマ","ルームウェア"],
    #レッグウェア
    ["ソックス","スパッツ/レギンス","ストッキング/タイツ","レッグウォーマー","その他"],
    #帽子
    ["ニットキャップ/ビーニー","ハット","ハンチング/ベレー帽","キャップ","その他"],
    #バッグ
    ["ハンドバッグ","トートバッグ","エコバッグ","リュック/バックパック","ボストンバッグ","スポーツバッグ","その他"],
    #アクセサリ
    ["ネックレス","ブレスレット","バンドル/リストバンド","リング","ピアス","イヤリング","その他"],
    #ヘアアクセサリ
    ["ヘアゴム/シュシュ","ヘアバンド/カチューシャ","ヘアピン","その他"],
    #小物
    ["長財布","折り財布","コインケース/小銭入れ","名刺入れ/定期入れ","キーケース","キーホルダー","その他"],
    #とけい
    ["腕時計","ラバーベルト","レザーベルト","金属ベルト","その他"],
    #ウィッグ
    ["前髪ウィッグ","ロングストレート","ロングカール","ショートストレート","その他"],
    #浴衣
    ["浴衣","着物","振袖","長襦袢/半襦袢","水着","その他"],
    #スーツ
    ["スカートスーツ","パンツスーツ","ドレス","パーティーバッグ","シューズ","その他"],
    #マタニティ
    ["トップス","アウター","インナー","ワンピース","授乳服","その他"],
    #その他
    ["コスプレ","下着","その他"],
#メンズ
    #パンツ
    ["Tシャツ/カットソー(半袖/袖なし)","Tシャツ/カットソー(七分/長袖)","シャツ/ブラウス(半袖/袖なし)","シャツ/ブラウス(七分/長袖)","ポロシャツ","その他"],
    #ジャケット
    ["テーラードジャケット男","ノーカラージャケット","デニムジャケット","レザージャケット","ダウンジャケット","その他"],
    #パンツ
    ["デニム/ジーンズ","ワークパンツ","スラックス","チノパン","その他"],
    #靴
    ["モカシン","ブーツ","サンダル","スニーカー","その他"],
    #バッグ
    ["ショルダーバッグ","トートバッグ","ボストンバッグ","リュック/バックパック","ウエストポーチ","ボディーバッグ","その他"],
    #スーツ
    ["スーツジャケット","スーツベスト","スラックス","セットアップ","その他"],
    #帽子
    ["キャップ","ハット","ハンチング/ベレー帽","キャスケット","その他"],
    #アクセサリ
    ["ネックレス","ブレスレット","バンドル/リストバンド","リング","ピアス","その他"],
    #小物
    ["長財布","折り財布","コインケース/小銭入れ","名刺入れ/定期入れ","キーケース","キーホルダー","その他"],
    #時計
    ["腕時計","ラバーベルト","レザーベルト","金属ベルト","その他"],
    #浴衣
    ["一般水着","スポーツ用","アクセサリー","その他"],
    #レッグウエア
    ["ソックス","スパッツ/レギンス","レッグウォーマー","その他"],
    #その他
    ["その他"],
#ベビー
    ["トップス", "アウター", "パンツ","スカート", "ワンピース","その他"],
    ["トップス", "アウター", "パンツ", "おくるみ", "下着/肌着","その他"],
    ["トップス", "アウター", "パンツ","おくるみ","下着/肌着","その他"],
    ["コート","ジャケット/上着","トップス","スカート","パンツ","その他"],
    ["コート","ジャケット/上着","トップス","セットアップ","パンツ","その他"],
    ["コート","ジャケット/上着","トップス","ボトムス","パジャマ","その他"],
    ["サンダル","スニーカー","その他"],
    ["靴下/スパッツ","帽子","エプロン","サスペンダー","その他"],
    ["おむつ用品","おまる/補助便座","トレーニングパンツ","ベビーバス","その他"],
    ["ベビーカー","抱っこひも/スリング","チャイルドシート","その他"],
    ["ミルク","ベビーフード","ベビー用食器","その他"],
    ["ベッド","布団/毛布","イス","その他"],
    ["おふろのおもちゃ","がらがら","オルゴール","その他"],
    ["お宮参り用品","お食い初め用品","アルバム","手形/足形","その他"],
    ["その他"],
# インテリア・住まい・小物の孫要素
    ["食器", "調理器具", "収納/キッチン雑貨", "弁当用品","カトラリー","その他"],
    ["セミシングルベッド", "シングルベッド","セミダブルベッド", "ダブルベッド","その他"],
# 本・音楽・ゲームの孫要素
    ["文学/小説", "人文/社会", "ノンフィクション/教養", "地図/旅行ガイド", "ビジネス/経済","その他"],
    ["全巻セット", "少年漫画", "少女漫画","青年漫画","女性漫画","その他"],
# おもちゃ・ホビー・グッズの孫要素
    ["キャラクターグッズ", "ぬいぐるみ", "小物/アクセサリー", "模型/プラモデル", "ミニカー","その他"],
    ["アイドル", "ミュージシャン", "タレント/お笑い芸人","スポーツ選手","その他"],
# コスメ・香水・美容の孫要素
    ["ファンデーション","化粧下地", "コントロールカラー", "BBクリーム", "CCクリーム","その他"],
    ["アイシャドウ", "口紅", "リップグロス", "リップライナー", "チーク","その他"],
# 家電・スマホ・カメラの孫要素
    ["スマートフォン本体", "バッテリー/充電器", "携帯電話本体","PHS本体", "その他"],
    ["Android用ケース", "iPhone用ケース", "カバー", "イヤホンジャック", "その他"],
#スポーツ
    ["クラブ", "ウェア(男性用)", "ウェア(女性用)", "バッグ", "その他"],
    ["ロッド","リール","ルアー用品", "ウエア","その他"],
# ハンドメイドの孫要素
    ["アクセサリー女性用", "ファッション/小物", "アクセサリー/時計","日用品/インテリア", "趣味/おもちゃ","その他"],
    ["バッグ", "財布", "ファッション雑貨", "その他"],
# チケットの孫要素
    ["男性アイドル","女性アイドル", "韓流","国内アーティスト", "海外アーティスト","その他"],
    ["サッカー", "野球","テニス", "格闘技/プロレス", "相撲/武道","その他"],
# 自動車・オートバイの孫要素
    ["国内自動車本体", "外国自動車本体","その他"],
    ["タイヤ/ホイールセット", "タイヤ","ホイール","その他"],
# その他の孫要素
    ["ペットフード", "犬用品", "猫用品","魚用品/水草", "デグー用品","その他"],
    [ "菓子", "米", "野菜", "果物", "加工食品","その他"]
]

parents.each do |parent|
  Category.create(name: parent)
end

@parents = Category.where(ancestry: nil)

p = 0
@parents.each do |parent|
  children[p].each do |child|
    parent.children.create(name: child)
    end
  p += 1
end

g =0
@parents.each do |parent|# 親をひとつづつとる
  index = parent.id  #その親のidをindexに格納

  @children = Category.where(ancestry: index)# 一つの親に対する子供を全てとる

    @children.each do |child|   # 子供を回す
      grand_children[g].each do |grand_child|# 配列の中の配列を回す
        child.children.create(name: grand_child)# 子供の子供を作る
      end
    g += 1
    end
end







