=begin
#カラーミーショップ API

## カラーミーショップ API  [カラーミーショップ](https://shop-pro.jp) APIでは、受注の検索や商品情報の更新を行うことができます。  ## 利用手順  はじめに、カラーミーデベロッパーアカウントを用意します。[デベロッパー登録ページ](https://api.shop-pro.jp/developers/sign_up)から登録してください。  次に、[登録ページ](https://api.shop-pro.jp/oauth/applications/new)からアプリケーション登録を行ってください。 スマートフォンのWebViewを利用する場合は、リダイレクトURLに`urn:ietf:wg:oauth:2.0:oob`を入力してください。  その後、カラーミーショップアカウントの認証ページを開きます。認証ページのURLは、`https://api.shop-pro.jp/oauth/authorize`に必要なパラメータをつけたものです。  |パラメータ名|値| |---|---| |`client_id`|アプリケーション詳細画面で確認できるクライアントID| |`response_type`|\"code\"という文字列| |`scope`| 別表参照| |`redirect_url`|アプリケーション登録時に入力したリダイレクトURL|  `scope`は、以下のうち、アプリケーションが利用したい機能をスペース区切りで指定してください。  |スコープ|機能| |---|---| |`read_products`|商品データの参照| |`write_products`|在庫データの更新| |`read_sales`|受注・顧客データの参照| |`write_sales`|受注データの更新|  以下のようなURLとなります。  ``` https://api.shop-pro.jp/oauth/authorize?client_id=CLIENT_ID&redirect_uri=REDIRECT_URL&response_type=code&scope=read_products%20write_products ```  初めてこのページを訪れる場合は、カラーミーショップアカウントのIDとパスワードの入力を求められます。 承認ボタンを押すと、このアプリケーションがショップのデータにアクセスすることが許可され、リダイレクトURLへリダイレクトされます。  承認された場合は、`code`というクエリパラメータに認可コードが付与されます。承認がキャンセルされた、またはエラーが起きた場合は、 `error`パラメータにエラーの内容を表す文字列が与えられます。  アプリケーション登録時のリダイレクトURLに`urn:ietf:wg:oauth:2.0:oob`を指定した場合は、以下のようなURLにリダイレクトされます。 末尾のパスが認可コードになっています。  ``` https://api.shop-pro.jp/oauth/authorize/AUTH_CODE ```  認可コードの有効期限は発行から10分間です。  最後に、認可コードとアクセストークンを交換します。以下のパラメータを付けて、`https://api.shop-pro.jp/oauth/token`へリクエストを送ります。  |パラメータ名|値| |---|---| |`client_id`|アプリケーション詳細画面に表示されているクライアントID| |`client_secret`|アプリケーション詳細画面に表示されているクライアントシークレット| |`code`|取得した認可コード| |`grant_type`|\"authorization_code\"という文字列| |`redirect_uri`|アプリケーション登録時に入力したリダイレクトURL|  ```console # curl での例  $ curl -X POST \\   -d'client_id=CLIENT_ID' \\   -d'client_secret=CLIENT_SECRET' \\   -d'code=CODE' \\   -d'grant_type=authorization_code'   \\   -d'redirect_uri=REDIRECT_URI'  \\   'https://api.shop-pro.jp/oauth/token' ```  リクエストが成功すると、以下のようなJSONが返ってきます。  ```json {   \"access_token\": \"d461ab8XXXXXXXXXXXXXXXXXXXXXXXXX\",   \"token_type\": \"bearer\",   \"scope\": \"read_products write_products\" } ```  アクセストークンに有効期限はありませんが、許可済みアプリケーション一覧画面から失効させることができます。なお、同じ認可コードをアクセストークンに交換できるのは1度だけです。  取得したアクセストークンは、Authorizationヘッダに入れて使用します。以下にショップ情報を取得する際の例を示します。  ```console # curlの例  $ curl -H 'Authorization: Bearer d461ab8XXXXXXXXXXXXXXXXXXXXXXXXX' https://api.shop-pro.jp/v1/shop.json ```  ## エラー  カラーミーショップAPI v1では  - エラーコード - エラーメッセージ - ステータスコード  の配列でエラーを表現します。以下に例を示します。  ```json {   \"errors\": [     {       \"code\": 404100,       \"message\": \"レコードが見つかりませんでした。\",       \"status\": 404     }   ] } ``` 

OpenAPI spec version: v1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: unset

=end

require 'date'

module SwaggerClient

  class Product
    # ショップアカウントID
    attr_accessor :account_id

    # 商品ID
    attr_accessor :id

    # 商品名
    attr_accessor :name

    # 在庫数
    attr_accessor :stocks

    # 在庫管理するか否か
    attr_accessor :stock_managed

    # 残りわずかとなる在庫数
    attr_accessor :few_num

    # 型番
    attr_accessor :model_number

    attr_accessor :category

    # 商品が属するグループのIDの配列
    attr_accessor :group_ids

    # 掲載設定
    attr_accessor :display_state

    # 販売価格
    attr_accessor :sales_price

    # 定価
    attr_accessor :price

    # 会員価格
    attr_accessor :members_price

    # 原価
    attr_accessor :cost

    # 個別送料
    attr_accessor :delivery_charge

    # 最小購入数量
    attr_accessor :min_num

    # 最大購入数量
    attr_accessor :max_num

    # 掲載開始時刻
    attr_accessor :sale_start_date

    # 掲載終了時刻
    attr_accessor :sale_end_date

    # 単位
    attr_accessor :unit

    # 重量(グラム単位)
    attr_accessor :weight

    # 売り切れているときもショップに表示するか
    attr_accessor :soldout_display

    # 表示順
    attr_accessor :sort

    # 簡易説明
    attr_accessor :simple_expl

    # 商品説明
    attr_accessor :expl

    # フィーチャーフォン向けショップの商品説明
    attr_accessor :mobile_expl

    # スマホ向けショップの商品説明
    attr_accessor :smartphone_expl

    # 商品作成日時
    attr_accessor :make_date

    # 商品更新日時
    attr_accessor :update_date

    # 備考
    attr_accessor :memo

    # メインの商品画像URL
    attr_accessor :image_url

    # メインの商品画像のモバイル用URL
    attr_accessor :mobile_image_url

    # メインの商品画像のサムネイルURL
    attr_accessor :thumbnail_image_url

    # メインの商品画像以外の3つの画像に関する、PC用とモバイル用の画像URL
    attr_accessor :images

    # 選択できるオプションの一覧
    attr_accessor :options

    # オプションのバリエーション一覧
    attr_accessor :variants

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'account_id' => :'account_id',
        :'id' => :'id',
        :'name' => :'name',
        :'stocks' => :'stocks',
        :'stock_managed' => :'stock_managed',
        :'few_num' => :'few_num',
        :'model_number' => :'model_number',
        :'category' => :'category',
        :'group_ids' => :'group_ids',
        :'display_state' => :'display_state',
        :'sales_price' => :'sales_price',
        :'price' => :'price',
        :'members_price' => :'members_price',
        :'cost' => :'cost',
        :'delivery_charge' => :'delivery_charge',
        :'min_num' => :'min_num',
        :'max_num' => :'max_num',
        :'sale_start_date' => :'sale_start_date',
        :'sale_end_date' => :'sale_end_date',
        :'unit' => :'unit',
        :'weight' => :'weight',
        :'soldout_display' => :'soldout_display',
        :'sort' => :'sort',
        :'simple_expl' => :'simple_expl',
        :'expl' => :'expl',
        :'mobile_expl' => :'mobile_expl',
        :'smartphone_expl' => :'smartphone_expl',
        :'make_date' => :'make_date',
        :'update_date' => :'update_date',
        :'memo' => :'memo',
        :'image_url' => :'image_url',
        :'mobile_image_url' => :'mobile_image_url',
        :'thumbnail_image_url' => :'thumbnail_image_url',
        :'images' => :'images',
        :'options' => :'options',
        :'variants' => :'variants'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'account_id' => :'String',
        :'id' => :'Integer',
        :'name' => :'String',
        :'stocks' => :'Integer',
        :'stock_managed' => :'BOOLEAN',
        :'few_num' => :'Integer',
        :'model_number' => :'String',
        :'category' => :'StockCategory',
        :'group_ids' => :'Array<Integer>',
        :'display_state' => :'String',
        :'sales_price' => :'Integer',
        :'price' => :'Integer',
        :'members_price' => :'Integer',
        :'cost' => :'Integer',
        :'delivery_charge' => :'Integer',
        :'min_num' => :'Integer',
        :'max_num' => :'Integer',
        :'sale_start_date' => :'Integer',
        :'sale_end_date' => :'Integer',
        :'unit' => :'String',
        :'weight' => :'Integer',
        :'soldout_display' => :'BOOLEAN',
        :'sort' => :'Integer',
        :'simple_expl' => :'String',
        :'expl' => :'String',
        :'mobile_expl' => :'String',
        :'smartphone_expl' => :'String',
        :'make_date' => :'Integer',
        :'update_date' => :'Integer',
        :'memo' => :'String',
        :'image_url' => :'String',
        :'mobile_image_url' => :'String',
        :'thumbnail_image_url' => :'String',
        :'images' => :'Array<StockImages>',
        :'options' => :'Array<ProductOption>',
        :'variants' => :'Array<ProductVariant>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.has_key?(:'stocks')
        self.stocks = attributes[:'stocks']
      end

      if attributes.has_key?(:'stock_managed')
        self.stock_managed = attributes[:'stock_managed']
      end

      if attributes.has_key?(:'few_num')
        self.few_num = attributes[:'few_num']
      end

      if attributes.has_key?(:'model_number')
        self.model_number = attributes[:'model_number']
      end

      if attributes.has_key?(:'category')
        self.category = attributes[:'category']
      end

      if attributes.has_key?(:'group_ids')
        if (value = attributes[:'group_ids']).is_a?(Array)
          self.group_ids = value
        end
      end

      if attributes.has_key?(:'display_state')
        self.display_state = attributes[:'display_state']
      end

      if attributes.has_key?(:'sales_price')
        self.sales_price = attributes[:'sales_price']
      end

      if attributes.has_key?(:'price')
        self.price = attributes[:'price']
      end

      if attributes.has_key?(:'members_price')
        self.members_price = attributes[:'members_price']
      end

      if attributes.has_key?(:'cost')
        self.cost = attributes[:'cost']
      end

      if attributes.has_key?(:'delivery_charge')
        self.delivery_charge = attributes[:'delivery_charge']
      end

      if attributes.has_key?(:'min_num')
        self.min_num = attributes[:'min_num']
      end

      if attributes.has_key?(:'max_num')
        self.max_num = attributes[:'max_num']
      end

      if attributes.has_key?(:'sale_start_date')
        self.sale_start_date = attributes[:'sale_start_date']
      end

      if attributes.has_key?(:'sale_end_date')
        self.sale_end_date = attributes[:'sale_end_date']
      end

      if attributes.has_key?(:'unit')
        self.unit = attributes[:'unit']
      end

      if attributes.has_key?(:'weight')
        self.weight = attributes[:'weight']
      end

      if attributes.has_key?(:'soldout_display')
        self.soldout_display = attributes[:'soldout_display']
      end

      if attributes.has_key?(:'sort')
        self.sort = attributes[:'sort']
      end

      if attributes.has_key?(:'simple_expl')
        self.simple_expl = attributes[:'simple_expl']
      end

      if attributes.has_key?(:'expl')
        self.expl = attributes[:'expl']
      end

      if attributes.has_key?(:'mobile_expl')
        self.mobile_expl = attributes[:'mobile_expl']
      end

      if attributes.has_key?(:'smartphone_expl')
        self.smartphone_expl = attributes[:'smartphone_expl']
      end

      if attributes.has_key?(:'make_date')
        self.make_date = attributes[:'make_date']
      end

      if attributes.has_key?(:'update_date')
        self.update_date = attributes[:'update_date']
      end

      if attributes.has_key?(:'memo')
        self.memo = attributes[:'memo']
      end

      if attributes.has_key?(:'image_url')
        self.image_url = attributes[:'image_url']
      end

      if attributes.has_key?(:'mobile_image_url')
        self.mobile_image_url = attributes[:'mobile_image_url']
      end

      if attributes.has_key?(:'thumbnail_image_url')
        self.thumbnail_image_url = attributes[:'thumbnail_image_url']
      end

      if attributes.has_key?(:'images')
        if (value = attributes[:'images']).is_a?(Array)
          self.images = value
        end
      end

      if attributes.has_key?(:'options')
        if (value = attributes[:'options']).is_a?(Array)
          self.options = value
        end
      end

      if attributes.has_key?(:'variants')
        if (value = attributes[:'variants']).is_a?(Array)
          self.variants = value
        end
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      display_state_validator = EnumAttributeValidator.new('String', ["showing", "hidden", "showing_for_members", "sale_for_members"])
      return false unless display_state_validator.valid?(@display_state)
      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] display_state Object to be assigned
    def display_state=(display_state)
      validator = EnumAttributeValidator.new('String', ["showing", "hidden", "showing_for_members", "sale_for_members"])
      unless validator.valid?(display_state)
        fail ArgumentError, "invalid value for 'display_state', must be one of #{validator.allowable_values}."
      end
      @display_state = display_state
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          account_id == o.account_id &&
          id == o.id &&
          name == o.name &&
          stocks == o.stocks &&
          stock_managed == o.stock_managed &&
          few_num == o.few_num &&
          model_number == o.model_number &&
          category == o.category &&
          group_ids == o.group_ids &&
          display_state == o.display_state &&
          sales_price == o.sales_price &&
          price == o.price &&
          members_price == o.members_price &&
          cost == o.cost &&
          delivery_charge == o.delivery_charge &&
          min_num == o.min_num &&
          max_num == o.max_num &&
          sale_start_date == o.sale_start_date &&
          sale_end_date == o.sale_end_date &&
          unit == o.unit &&
          weight == o.weight &&
          soldout_display == o.soldout_display &&
          sort == o.sort &&
          simple_expl == o.simple_expl &&
          expl == o.expl &&
          mobile_expl == o.mobile_expl &&
          smartphone_expl == o.smartphone_expl &&
          make_date == o.make_date &&
          update_date == o.update_date &&
          memo == o.memo &&
          image_url == o.image_url &&
          mobile_image_url == o.mobile_image_url &&
          thumbnail_image_url == o.thumbnail_image_url &&
          images == o.images &&
          options == o.options &&
          variants == o.variants
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [account_id, id, name, stocks, stock_managed, few_num, model_number, category, group_ids, display_state, sales_price, price, members_price, cost, delivery_charge, min_num, max_num, sale_start_date, sale_end_date, unit, weight, soldout_display, sort, simple_expl, expl, mobile_expl, smartphone_expl, make_date, update_date, memo, image_url, mobile_image_url, thumbnail_image_url, images, options, variants].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = SwaggerClient.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
