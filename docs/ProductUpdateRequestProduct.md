# SwaggerClient::ProductUpdateRequestProduct

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | 商品名 | [optional] 
**price** | **Integer** | 定価 | [optional] 
**category_id_big** | **Integer** | 大カテゴリーID | [optional] 
**category_id_small** | **Integer** | 小カテゴリーID | [optional] 
**cost** | **Integer** | 原価 | [optional] 
**sales_price** | **Integer** | 販売価格 | [optional] 
**members_price** | **Integer** | 会員価格 | [optional] 
**model_number** | **String** | 型番 | [optional] 
**expl** | **String** | 商品説明 | [optional] 
**simple_expl** | **String** | 簡易説明 | [optional] 
**smartphone_expl** | **String** | スマホ向けショップの商品説明 | [optional] 
**display_state** | **String** | 掲載設定 | [optional] 
**stock_managed** | **BOOLEAN** | 在庫管理するか否か | [optional] 
**group_ids** | **Array&lt;Integer&gt;** | グループIDの配列 | [optional] 
**variants** | [**Array&lt;ProductUpdateRequestProductVariants&gt;**](ProductUpdateRequestProductVariants.md) | 商品オプションによるバリエーションごとに更新 | [optional] 


