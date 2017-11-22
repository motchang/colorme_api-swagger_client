# SwaggerClient::ShopApi

All URIs are relative to *https://api.shop-pro.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_shop**](ShopApi.md#get_shop) | **GET** /v1/shop.json | ショップ情報の取得


# **get_shop**
> InlineResponse200 get_shop

ショップ情報の取得

ショップ名などの基本的な情報を取得することができるAPIです。 

### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::ShopApi.new

begin
  #ショップ情報の取得
  result = api_instance.get_shop
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling ShopApi->get_shop: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

[OAuth2](../README.md#OAuth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



