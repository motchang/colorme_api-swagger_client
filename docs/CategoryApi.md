# SwaggerClient::CategoryApi

All URIs are relative to *https://api.shop-pro.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_product_categories**](CategoryApi.md#get_product_categories) | **GET** /v1/categories.json | 商品カテゴリー一覧を取得


# **get_product_categories**
> InlineResponse20010 get_product_categories

商品カテゴリー一覧を取得



### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::CategoryApi.new

begin
  #商品カテゴリー一覧を取得
  result = api_instance.get_product_categories
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling CategoryApi->get_product_categories: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InlineResponse20010**](InlineResponse20010.md)

### Authorization

[OAuth2](../README.md#OAuth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



