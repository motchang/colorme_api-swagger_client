# SwaggerClient::GroupApi

All URIs are relative to *https://api.shop-pro.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_product_groups**](GroupApi.md#get_product_groups) | **GET** /v1/groups.json | 商品グループ一覧を取得


# **get_product_groups**
> InlineResponse2009 get_product_groups

商品グループ一覧を取得



### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::GroupApi.new

begin
  #商品グループ一覧を取得
  result = api_instance.get_product_groups
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling GroupApi->get_product_groups: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InlineResponse2009**](InlineResponse2009.md)

### Authorization

[OAuth2](../README.md#OAuth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



