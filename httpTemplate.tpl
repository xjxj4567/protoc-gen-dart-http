import 'package:dio/dio.dart';
import 'package:flutter_coin_api/src/utils/http_util.dart';
import 'package:flutter_coin_api/flutter_coin_api.dart';
import '{{.ServiceType}}.pb.dart';

class {{.ServiceType}}HttpClient {
  late Options _chatTokenOptions;
  ChatHttpClient(String token) {
    _chatTokenOptions = Options(headers: {'token': token});
  }

{{- range .MethodSets}}
  Future<{{.Reply}}> {{.Name}}({{.Request}} req) async {
    return HttpUtil.post<{{.Request}}, {{.Reply}}>(
      "{{.Path}}",
      data: req,
      options: _chatTokenOptions,
    );
  }
{{- end}}
}
