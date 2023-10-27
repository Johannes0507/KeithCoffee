# -*- coding: utf-8 -*-

import importlib.util
spec = importlib.util.spec_from_file_location(
    "ecpay_payment_sdk",
    "cart/ecpay_payment_sdk.py"
)
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
from datetime import datetime


from .cart import Cart
from django.conf import settings
from django.http import request

def main(cart):

    
    order_params = {
        'MerchantTradeNo': datetime.now().strftime("NO%Y%m%d%H%M%S"),
        'StoreID': '',
        'MerchantTradeDate': datetime.now().strftime("%Y/%m/%d %H:%M:%S"),
        'PaymentType': 'aio',
        'TotalAmount': 1000, # 商品總金額
        'TradeDesc': '訂單測試', # 商品描述
        'ItemName': "商品名", # 商品名用#當分行
        'ReturnURL': 'https://www.ecpay.com.tw/return_url.php', # 顧客填寫完付款資料後的跳轉頁面，結帳後，先導到 OrderResultURL，從綠界頁面跳回的頁面。
        'ChoosePayment': 'ALL', # 顧客付費方式
        'ClientBackURL': 'https://www.ecpay.com.tw/client_back_url.php', # 如果沒有顧客參數會跳轉到的地方
        'ItemURL': 'https://www.ecpay.com.tw/item_url.php', # 商品資訊頁面
        'Remark': '交易備註', # 備註文字
        'ChooseSubPayment': '',
        'OrderResultURL': '', # 結帳成功/失敗後的結果頁面，告知顧客本次的結帳結果
        'NeedExtraPaidInfo': 'Y',
        'DeviceSource': '',
        'IgnorePayment': '',
        'PlatformID': '',
        'InvoiceMark': 'N',
        'CustomField1': '',
        'CustomField2': '',
        'CustomField3': '',
        'CustomField4': '',
        'EncryptType': 1,
    }
    
    extend_params_1 = {
        'ExpireDate': 7, # 商品上架期限
        'PaymentInfoURL': 'https://www.ecpay.com.tw/payment_info_url.php', #付款資訊頁面
        'ClientRedirectURL': '',  # 看完付款資訊，要重導到哪裡
    }
    
    extend_params_2 = {
        'StoreExpireDate': 15,
        'Desc_1': '',
        'Desc_2': '',
        'Desc_3': '',
        'Desc_4': '',
        'PaymentInfoURL': 'https://www.ecpay.com.tw/payment_info_url.php',
        'ClientRedirectURL': '',
    }
    
    extend_params_3 = {
        'BindingCard': 0,
        'MerchantMemberID': '',
    }
    
    extend_params_4 = {
        'Redeem': 'N',
        'UnionPay': 0,
    }
    
    # 發票資料
    inv_params = {
        # 'RelateNumber': 'Tea0001', # 特店自訂編號
        # 'CustomerID': 'TEA_0000001', # 客戶編號
        # 'CustomerIdentifier': '53348111', # 統一編號
        # 'CustomerName': '客戶名稱',
        # 'CustomerAddr': '客戶地址',
        # 'CustomerPhone': '0912345678', # 客戶手機號碼
        # 'CustomerEmail': 'abc@ecpay.com.tw',
        # 'ClearanceMark': '2', # 通關方式
        # 'TaxType': '1', # 課稅類別
        # 'CarruerType': '', # 載具類別
        # 'CarruerNum': '', # 載具編號
        # 'Donation': '1', # 捐贈註記
        # 'LoveCode': '168001', # 捐贈碼
        # 'Print': '1',
        # 'InvoiceItemName': '測試商品1|測試商品2',
        # 'InvoiceItemCount': '2|3',
        # 'InvoiceItemWord': '個|包',
        # 'InvoiceItemPrice': '35|10',
        # 'InvoiceItemTaxType': '1|1',
        # 'InvoiceRemark': '測試商品1的說明|測試商品2的說明',
        # 'DelayDay': '0', # 延遲天數
        # 'InvType': '07', # 字軌類別
    }
    
    # 建立實體
    ecpay_payment_sdk = module.ECPayPaymentSdk(
        MerchantID='2000132',
        HashKey='5294y06JbISpM5x9',
        HashIV='v77hoKGq4kWxNNIS'
    )
    
    # 合併延伸參數
    order_params.update(extend_params_1)
    order_params.update(extend_params_2)
    order_params.update(extend_params_3)
    order_params.update(extend_params_4)
    
    # 合併發票參數
    order_params.update(inv_params)
    
    try:
        # 產生綠界訂單所需參數
        final_order_params = ecpay_payment_sdk.create_order(order_params)
    
        # 產生 html 的 form 格式
        action_url = 'https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5'  # 測試環境
        # action_url = 'https://payment.ecpay.com.tw/Cashier/AioCheckOut/V5' # 正式環境
        html = ecpay_payment_sdk.gen_html_post_form(action_url, final_order_params)
        return html # 刪除原本的print(html)改成return html
    
    except Exception as error:
        print('An exception happened: ' + str(error))