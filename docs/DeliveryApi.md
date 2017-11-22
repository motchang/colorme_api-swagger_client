# SwaggerClient::DeliveryApi

All URIs are relative to *https://api.shop-pro.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_deliveries**](DeliveryApi.md#get_deliveries) | **GET** /v1/deliveries.json | 配送方法一覧を取得
[**get_delivery_date_setting**](DeliveryApi.md#get_delivery_date_setting) | **GET** /v1/deliveries/date.json | 配送日時設定を取得


# **get_deliveries**
> InlineResponse20012 get_deliveries

配送方法一覧を取得



### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::DeliveryApi.new

begin
  #配送方法一覧を取得
  result = api_instance.get_deliveries
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DeliveryApi->get_deliveries: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InlineResponse20012**](InlineResponse20012.md)

### Authorization

[OAuth2](../README.md#OAuth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_delivery_date_setting**
> InlineResponse20013 get_delivery_date_setting

配送日時設定を取得



### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::DeliveryApi.new

begin
  #配送日時設定を取得
  result = api_instance.get_delivery_date_setting
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling DeliveryApi->get_delivery_date_setting: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InlineResponse20013**](InlineResponse20013.md)

### Authorization

[OAuth2](../README.md#OAuth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



