import 'package:http/http.dart' as http;

const primaryKey = 'ae7f584aba9947d4b069bba47b39325c';
const accessToken =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSMjU2In0.eyJjbGllbnRJZCI6ImQwMDI5N2M4LWFmMzctNGRmMC1iNGUwLWYzZGFlMzJmYjNmMSIsImV4cGlyZXMiOiIyMDIzLTExLTA2VDA5OjQ0OjI5LjM3NyIsInNlc3Npb25JZCI6IjU4MGMxZmRmLTRmMDctNGMzMS05NDYwLWExYjI4OTVmMDEwYyJ9.JADu4a_Z-X8yQTJRL_IiIvnWeYBoXPuTZW3_vb_5vRJjjNi9V0gjOEXD2IIffwXEyqC_hfvFwtt48QMtDU--Bn1PMV503IyCVbDtKS28-0i7bhbObOpBEJKTnDZjJ04N__KPfzLJh3Nl0oUAtBcZMI8gjVOQSLfVmlCEHGYSbXWyD0pJ1qg1e7cl0GM8OMyWdpEfUWejwWoQXR-35RAXY0ATWX2_jWMtT3gj3UQBzctpHTJa3sASBVo3HfB_euYMKK34PA_ubhbgVh0zNtwj1bSMJSVA9_BAQpj7kTKJcYS6veMqwRuteoR4yIz-YaJT8h_Fr5oKtkaP2Btkyf-C6Q';

void getResponse() async {
  var url =
      'https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/account/balance/XAF';
  http.Response response = await http.get(Uri.parse(url), headers: {
    'Authorization': 'Bearer $accessToken',
    'X-Target-Environment': 'sandbox',
    'Ocp-Apim-Subscription-Key': primaryKey,
  });
  print(response.body);
  print(response.statusCode);
}

void main() {
  getResponse();
}
