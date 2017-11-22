# SwaggerClient::PaymentApi

All URIs are relative to *https://api.shop-pro.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_payments**](PaymentApi.md#get_payments) | **GET** /v1/payments.json | 決済設定の一覧を取得


# **get_payments**
> InlineResponse20011 get_payments

決済設定の一覧を取得



### Example
```ruby
# load the gem
require 'swagger_client'
# setup authorization
SwaggerClient.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = SwaggerClient::PaymentApi.new

begin
  #決済設定の一覧を取得
  result = api_instance.get_payments
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling PaymentApi->get_payments: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InlineResponse20011**](InlineResponse20011.md)

### Authorization

[OAuth2](../README.md#OAuth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



