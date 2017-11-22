# SwaggerClient::ProductApi

All URIs are relative to *https://api.shop-pro.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_product**](ProductApi.md#get_product) | **GET** /v1/products/{productId}.json | 商品データの取得
[**get_products**](ProductApi.md#get_products) | **GET** /v1/products.json | 商品一覧の取得
[**update_product**](ProductApi.md#update_product) | **PUT** /v1/products/{productId}.json | 商品データの更新


# **get_product**
> InlineResponse2007 get_product(product_id)

商品データの取得



### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::ProductApi.new

product_id = 56 # Integer | 商品ID


begin
  #商品データの取得
  result = api_instance.get_product(product_id)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ProductApi->get_product: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **product_id** | **Integer**| 商品ID | 

### Return type

[**InlineResponse2007**](InlineResponse2007.md)

### Authorization

[OAuth2](../README.md#OAuth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_products**
> InlineResponse2006 get_products(opts)

商品一覧の取得



### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::ProductApi.new

opts = { 
  ids: "ids_example", # String | 商品IDで検索。カンマ区切りにすることで複数検索が可能
  category_id_big: 56, # Integer | 大カテゴリーIDで検索
  category_id_small: 56, # Integer | 小カテゴリーIDで検索
  model_number: "model_number_example", # String | 型番で部分一致検索
  name: "name_example", # String | 商品名で部分一致検索
  display_state: "display_state_example", # String | 掲載設定で検索
  stocks: 56, # Integer | 在庫管理している商品のうち、在庫数が指定した数値以下の商品を検索。オプションごとに在庫管理している商品は、合計在庫数で検索される
  stock_managed: true, # BOOLEAN | 在庫管理している、またはしていない商品から検索
  recent_zero_stocks: true, # BOOLEAN | `true` の場合、過去1週間以内に更新された商品から検索
  make_date_min: "make_date_min_example", # String | 指定日時以降に作成された商品から検索
  make_date_max: "make_date_max_example", # String | 指定日時以前に作成された商品から検索
  update_date_min: "update_date_min_example", # String | 指定日時以降に更新された商品から検索
  update_date_max: "update_date_max_example", # String | 指定日時以降に更新された商品から検索
  fields: "fields_example", # String | レスポンスJSONのキーをカンマ区切りで指定
  limit: 56, # Integer | レスポンスの件数を指定。指定がない場合は10。最大50
  offset: 56 # Integer | 指定した数値+1件目以降のデータを返す
}

begin
  #商品一覧の取得
  result = api_instance.get_products(opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ProductApi->get_products: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ids** | **String**| 商品IDで検索。カンマ区切りにすることで複数検索が可能 | [optional] 
 **category_id_big** | **Integer**| 大カテゴリーIDで検索 | [optional] 
 **category_id_small** | **Integer**| 小カテゴリーIDで検索 | [optional] 
 **model_number** | **String**| 型番で部分一致検索 | [optional] 
 **name** | **String**| 商品名で部分一致検索 | [optional] 
 **display_state** | **String**| 掲載設定で検索 | [optional] 
 **stocks** | **Integer**| 在庫管理している商品のうち、在庫数が指定した数値以下の商品を検索。オプションごとに在庫管理している商品は、合計在庫数で検索される | [optional] 
 **stock_managed** | **BOOLEAN**| 在庫管理している、またはしていない商品から検索 | [optional] 
 **recent_zero_stocks** | **BOOLEAN**| &#x60;true&#x60; の場合、過去1週間以内に更新された商品から検索 | [optional] 
 **make_date_min** | **String**| 指定日時以降に作成された商品から検索 | [optional] 
 **make_date_max** | **String**| 指定日時以前に作成された商品から検索 | [optional] 
 **update_date_min** | **String**| 指定日時以降に更新された商品から検索 | [optional] 
 **update_date_max** | **String**| 指定日時以降に更新された商品から検索 | [optional] 
 **fields** | **String**| レスポンスJSONのキーをカンマ区切りで指定 | [optional] 
 **limit** | **Integer**| レスポンスの件数を指定。指定がない場合は10。最大50 | [optional] 
 **offset** | **Integer**| 指定した数値+1件目以降のデータを返す | [optional] 

### Return type

[**InlineResponse2006**](InlineResponse2006.md)

### Authorization

[OAuth2](../README.md#OAuth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_product**
> InlineResponse2007 update_product(product_id, opts)

商品データの更新



### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::ProductApi.new

product_id = 56 # Integer | 商品ID

opts = { 
  product: SwaggerClient::ProductUpdateRequest.new # ProductUpdateRequest | 商品データ
}

begin
  #商品データの更新
  result = api_instance.update_product(product_id, opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ProductApi->update_product: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **product_id** | **Integer**| 商品ID | 
 **product** | [**ProductUpdateRequest**](ProductUpdateRequest.md)| 商品データ | [optional] 

### Return type

[**InlineResponse2007**](InlineResponse2007.md)

### Authorization

[OAuth2](../README.md#OAuth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



