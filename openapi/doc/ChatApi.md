# openapi.api.ChatApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://chat.fhdw.de*

Method | HTTP request | Description
------------- | ------------- | -------------
[**chat**](ChatApi.md#chat) | **POST** /chat | Get answer to the passed message


# **chat**
> Message chat(message)

Get answer to the passed message

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ChatApi();
final message = Message(); // Message | 

try {
    final result = api_instance.chat(message);
    print(result);
} catch (e) {
    print('Exception when calling ChatApi->chat: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **message** | [**Message**](Message.md)|  | 

### Return type

[**Message**](Message.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

