package com.dqy.util;

/**
 * 支付宝配置类
 * 使用沙箱环境进行测试
 */
public class AlipayConfig {
    
    // 支付宝网关（沙箱环境）
    public static String gatewayUrl = "https://openapi-sandbox.dl.alipaydev.com/gateway.do";
    
    // 应用ID（沙箱环境）
    public static String app_id = "9021000150655023"; // 请替换为你的沙箱应用ID
    
    // 商户私钥（沙箱环境）
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCFNBm5Sz4HSv/SyclS9928nItsWd3vSRXm7Vgkl3Og5NiuyGmFKJhl84bM/KmfRKX+l0PVhVXBfbaC0omIoq5gQIOHk3s4FTUNiMmZrnliHQwV6gwvSNmwjKBDuHUwe4mQlYCUify281z2YbIUI/ZSIlItem4B8NDKvSFFz/7QvTbCMWwUYAYaqNUmUZw0ItUIJG8KPqDFSsnKBl/yXFk5RDYl7RQGHL/HiAtXgzf1ZJCRSdCkuAf72x4Ys77uU/fa7jALVW6e+u7gw0WdH+M8QhYozpfCZhp2jxaoL9oxd/FMEcPLiJUheMs+gzT8waN/XfSw0k69mQigjcw36vIBAgMBAAECggEARdSTa71TTlV2GdYpUfKZbwiOWwYdwBULg12H6N7xAjcWlUKBdwpaIpBxacNHVTSS5Q39xNE6rM4vwROIgHXwfoszqP6bCUKs5mSAc62w+suJi2+AZcWGQfTnC7mGzhzleEO3/ab9MhgQ8yUySzazKknN1QOq6h+KBc7yw3uP9XOJILc2AbXVmJsHAKUIOtpPfwjzAB02EDbs5nkug84IF4JOxhBMJLel8V+vzSvjus8DoWBkWWyVL/2iwJiAiazPiUbC/W1IFzjQ7yKaGTcYplZSTUoxxl3pH3s7uWTrS5BZokpOVz6ioQiniMIiFY0BMoWqf+LN1zaN8nt9ZTo/cQKBgQDST71xrkhTCjrT9XmpWMBKq2aerVmtniF3T6xe/DN8yjnH+2m/Eu9J0HJbbfglw1KP8rr7Cff41t8ktzlFJSDmRCDKrp5c0/kkOTZCz1EXMgTA/TV2b9QWBhb8oVQSK7h0v55L2EHC998CFHSwD9wR2ESnRT3t6OlGVC4kE7HC3QKBgQCiJBQ9c9dXZYR5DYZUVYcq+EJRYSW6oAyiYaDCnDhJKEJRygrJAmEo2lGIn5AWIc5qwECCewYNCfmfGcJL7hpBNXkN2qrxTVf4gmcY/rGJiuB6leZ+x0fMzGn668D5bXaqKtsjte5p6HuYy67AHq9RnvDZjsyN/+w7RJOT1tK/dQKBgFm7P/8S9zTG9pac8823WkQBoYUuPUcAYxL+4XKddHJX7hNPR60IrSP3VfOAlhG2prFYRUL629xGAWsu6baAwuq8Qql3m4XLw08bQfV7cwPMiY61+muQBxNmgcREKRSfptHZN/bwTA6dp37Br4+3FJRgi9o6htPNPkqNfCpUZNHZAoGAam46ZvhCU1kM8xUgpv0ZY+hgR+D4Dh//CxwAlZ5MCCGIHv37xGRueI2OVZs/zndUcphOABhXKXnxxDD5bDQYQdOi6agu64Q0iai3mh2dVka2AWGiUnfnNpS7wHy+SDxFV4AYJsHGhPiZIPwacnvx4ybsvDJTLabfXywtny61Wf0CgYAhi8JcUcGik8tQHqEdt3xtI+xji4GGzVjAv5XFdAChw5FA9q/qD9YSMR7eEAGRFXc/RJXxZj4hV69vKarSLxIeM9hhNwpGXFfugNWHYT5Gl16qkZ6IOv8drK2ZJU7idrGfoThSulyL6dwaRBJcyL6lC/FPlZlIB/uu4cERStcBMA=="; // 请替换为你的私钥
    
    // 支付宝公钥（沙箱环境）
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjaRaaaFStgBZ/6KBdHs0itRcP8r9HuAw3F5OelTIB6KMoNlU26OHVltNGvtbRHLbjZdhIJGsbxQXa14v0hCJh5pP36AQIayQxWCWexUm5hGei2Nrp/RSKHCrWCLrZk3AVQgDYHY0WOHEEO21XLvRIYtX/HrMJCs7dwdjEx/LSGxu4LXhfv96Bp7qiwMBs98xiETw0LYdS8UUN6Mf6QI9CkzVXHh6DjrKxm5rhK6ADszHsL0eLUOFNJbykFv2WGz9+YOnrdBUOMFf3+YAPWoSawxIGsyyu6XjFOuojvX6/o4AYjsU3WrJqfYeKAuQRTp+LDxAENr+X7pgQenNt/yUyQIDAQAB"; // 请替换为支付宝公钥
    
    // 字符编码格式
    public static String charset = "UTF-8";
    
    // 签名方式
    public static String sign_type = "RSA2";
    
    // 支付成功后的回调地址
    public static String return_url = "http://localhost:8080/HospitalManage-1.0-SNAPSHOT/alipayresult";
    
    // 异步通知地址
    public static String notify_url = "http://localhost:8080/HospitalManage-1.0-SNAPSHOT/alipaynotify";
} 