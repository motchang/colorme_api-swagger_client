=begin
#カラーミーショップ API

## カラーミーショップ API  [カラーミーショップ](https://shop-pro.jp) APIでは、受注の検索や商品情報の更新を行うことができます。  ## 利用手順  はじめに、カラーミーデベロッパーアカウントを用意します。[デベロッパー登録ページ](https://api.shop-pro.jp/developers/sign_up)から登録してください。  次に、[登録ページ](https://api.shop-pro.jp/oauth/applications/new)からアプリケーション登録を行ってください。 スマートフォンのWebViewを利用する場合は、リダイレクトURLに`urn:ietf:wg:oauth:2.0:oob`を入力してください。  その後、カラーミーショップアカウントの認証ページを開きます。認証ページのURLは、`https://api.shop-pro.jp/oauth/authorize`に必要なパラメータをつけたものです。  |パラメータ名|値| |---|---| |`client_id`|アプリケーション詳細画面で確認できるクライアントID| |`response_type`|\"code\"という文字列| |`scope`| 別表参照| |`redirect_url`|アプリケーション登録時に入力したリダイレクトURL|  `scope`は、以下のうち、アプリケーションが利用したい機能をスペース区切りで指定してください。  |スコープ|機能| |---|---| |`read_products`|商品データの参照| |`write_products`|在庫データの更新| |`read_sales`|受注・顧客データの参照| |`write_sales`|受注データの更新|  以下のようなURLとなります。  ``` https://api.shop-pro.jp/oauth/authorize?client_id=CLIENT_ID&redirect_uri=REDIRECT_URL&response_type=code&scope=read_products%20write_products ```  初めてこのページを訪れる場合は、カラーミーショップアカウントのIDとパスワードの入力を求められます。 承認ボタンを押すと、このアプリケーションがショップのデータにアクセスすることが許可され、リダイレクトURLへリダイレクトされます。  承認された場合は、`code`というクエリパラメータに認可コードが付与されます。承認がキャンセルされた、またはエラーが起きた場合は、 `error`パラメータにエラーの内容を表す文字列が与えられます。  アプリケーション登録時のリダイレクトURLに`urn:ietf:wg:oauth:2.0:oob`を指定した場合は、以下のようなURLにリダイレクトされます。 末尾のパスが認可コードになっています。  ``` https://api.shop-pro.jp/oauth/authorize/AUTH_CODE ```  認可コードの有効期限は発行から10分間です。  最後に、認可コードとアクセストークンを交換します。以下のパラメータを付けて、`https://api.shop-pro.jp/oauth/token`へリクエストを送ります。  |パラメータ名|値| |---|---| |`client_id`|アプリケーション詳細画面に表示されているクライアントID| |`client_secret`|アプリケーション詳細画面に表示されているクライアントシークレット| |`code`|取得した認可コード| |`grant_type`|\"authorization_code\"という文字列| |`redirect_uri`|アプリケーション登録時に入力したリダイレクトURL|  ```console # curl での例  $ curl -X POST \\   -d'client_id=CLIENT_ID' \\   -d'client_secret=CLIENT_SECRET' \\   -d'code=CODE' \\   -d'grant_type=authorization_code'   \\   -d'redirect_uri=REDIRECT_URI'  \\   'https://api.shop-pro.jp/oauth/token' ```  リクエストが成功すると、以下のようなJSONが返ってきます。  ```json {   \"access_token\": \"d461ab8XXXXXXXXXXXXXXXXXXXXXXXXX\",   \"token_type\": \"bearer\",   \"scope\": \"read_products write_products\" } ```  アクセストークンに有効期限はありませんが、許可済みアプリケーション一覧画面から失効させることができます。なお、同じ認可コードをアクセストークンに交換できるのは1度だけです。  取得したアクセストークンは、Authorizationヘッダに入れて使用します。以下にショップ情報を取得する際の例を示します。  ```console # curlの例  $ curl -H 'Authorization: Bearer d461ab8XXXXXXXXXXXXXXXXXXXXXXXXX' https://api.shop-pro.jp/v1/shop.json ```  ## エラー  カラーミーショップAPI v1では  - エラーコード - エラーメッセージ - ステータスコード  の配列でエラーを表現します。以下に例を示します。  ```json {   \"errors\": [     {       \"code\": 404100,       \"message\": \"レコードが見つかりませんでした。\",       \"status\": 404     }   ] } ``` 

OpenAPI spec version: v1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: unset

=end

require 'date'

module SwaggerClient
  # 配送料設定の詳細。上記の`charge_free_type`や`charge_type`に基づいて、この中から配送料が決定される
  class DeliveryCharge
    # 配送方法ID
    attr_accessor :delivery_id

    # ショップアカウントID
    attr_accessor :account_id

    # 配送料が固定の場合の金額
    attr_accessor :charge_fixed

    # 配送料が変わる決済金額の区分  `[3000, 100]`であれば、3000円以下の場合、手数料は100円であることを表す 
    attr_accessor :charge_ranges_by_price

    # `charge_ranges_by_price`に設定されている区分以上の金額の場合の手数料
    attr_accessor :charge_max_price

    # 都道府県ごとの配送料
    attr_accessor :charge_ranges_by_area

    # 配送料が変わる重量の区分  以下の値の場合、  - 1000g未満の商品を青森県に届ける際の配送料は300円 - 3000g未満の商品を青森県に届ける際の配送料は500円  であることを表す。  ```json [   [     1000,     [       {         \"pref_id\": 2,         \"pref_name\": \"青森県\",         \"charge\": 300       }     ]   ],   [     3000,     [       {         \"pref_id\": 2,         \"pref_name\": \"青森県\",         \"charge\": 500       }     ]   ] ] ``` 
    attr_accessor :charge_ranges_by_weight

    # `charge_ranges_by_weight`に設定されている区分以上の重量の場合の手数料
    attr_accessor :charge_ranges_max_weight


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'delivery_id' => :'delivery_id',
        :'account_id' => :'account_id',
        :'charge_fixed' => :'charge_fixed',
        :'charge_ranges_by_price' => :'charge_ranges_by_price',
        :'charge_max_price' => :'charge_max_price',
        :'charge_ranges_by_area' => :'charge_ranges_by_area',
        :'charge_ranges_by_weight' => :'charge_ranges_by_weight',
        :'charge_ranges_max_weight' => :'charge_ranges_max_weight'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'delivery_id' => :'Integer',
        :'account_id' => :'String',
        :'charge_fixed' => :'Integer',
        :'charge_ranges_by_price' => :'Array<Array<Integer>>',
        :'charge_max_price' => :'Integer',
        :'charge_ranges_by_area' => :'Array<DeliveryChargeByPrefecture>',
        :'charge_ranges_by_weight' => :'Array<Array<null>>',
        :'charge_ranges_max_weight' => :'Array<DeliveryChargeByPrefecture>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'delivery_id')
        self.delivery_id = attributes[:'delivery_id']
      end

      if attributes.has_key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.has_key?(:'charge_fixed')
        self.charge_fixed = attributes[:'charge_fixed']
      end

      if attributes.has_key?(:'charge_ranges_by_price')
        if (value = attributes[:'charge_ranges_by_price']).is_a?(Array)
          self.charge_ranges_by_price = value
        end
      end

      if attributes.has_key?(:'charge_max_price')
        self.charge_max_price = attributes[:'charge_max_price']
      end

      if attributes.has_key?(:'charge_ranges_by_area')
        if (value = attributes[:'charge_ranges_by_area']).is_a?(Array)
          self.charge_ranges_by_area = value
        end
      end

      if attributes.has_key?(:'charge_ranges_by_weight')
        if (value = attributes[:'charge_ranges_by_weight']).is_a?(Array)
          self.charge_ranges_by_weight = value
        end
      end

      if attributes.has_key?(:'charge_ranges_max_weight')
        if (value = attributes[:'charge_ranges_max_weight']).is_a?(Array)
          self.charge_ranges_max_weight = value
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
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          delivery_id == o.delivery_id &&
          account_id == o.account_id &&
          charge_fixed == o.charge_fixed &&
          charge_ranges_by_price == o.charge_ranges_by_price &&
          charge_max_price == o.charge_max_price &&
          charge_ranges_by_area == o.charge_ranges_by_area &&
          charge_ranges_by_weight == o.charge_ranges_by_weight &&
          charge_ranges_max_weight == o.charge_ranges_max_weight
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [delivery_id, account_id, charge_fixed, charge_ranges_by_price, charge_max_price, charge_ranges_by_area, charge_ranges_by_weight, charge_ranges_max_weight].hash
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