# SwaggerClient::GiftApi

All URIs are relative to *https://api.shop-pro.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_gift**](GiftApi.md#get_gift) | **GET** /v1/gift.json | ギフト設定を取得


# **get_gift**
> InlineResponse20014 get_gift

ギフト設定を取得



### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::GiftApi.new

begin
  #ギフト設定を取得
  result = api_instance.get_gift
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling GiftApi->get_gift: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InlineResponse20014**](InlineResponse20014.md)

### Authorization

[OAuth2](../README.md#OAuth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



