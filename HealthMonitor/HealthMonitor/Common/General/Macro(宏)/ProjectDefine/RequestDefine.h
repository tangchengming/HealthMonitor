//
//  RequestDefine.h
//  Hospital
//
//  Created by ShinSoft on 14-3-10.
//  Copyright (c) 2014年 Shinsoft. All rights reserved.
//

#ifndef XL_RequestDefine_h
#define XL_RequestDefine_h

/**
 *  定义网络请求相关常量
 命名规则为：Request_Method_方法名
 字段命名采用驼峰表示(首字母大写)
 */

//***************相关参数*************************************

#define REQUEST_GET     @"GET"
#define REQUEST_POST    @"POST"
#define REQUEST_PUT     @"PUT"
#define REQUEST_DELETE  @"DELETE"

#define isTestHJ  1
#if isTestHJ//1:测试环境  0：正式环境
#define K_IP                    @"http://192.168.0.138:8080/"//外网--测试环境
#define K_SERVICE       [NSString stringWithFormat:@"http://%@",K_IP]//
#else
#define K_IP                    @"http://962527.com.cn/live/"//正式测试环境
#define K_SERVICE       [NSString stringWithFormat:@"http://%@",K_IP]//
#endif


#define Request_Method_Login                         @"live/login"//登录  POST    params[@"userName"]   params[@"userPassword"]
#define Request_Method_getsmscode                    @"live/sendMsg"//获取验证码  POST      params[@"tel"]
#define Request_Method_checkverify                   @"live/checkTel"//验证手机号码是否被注册  POST   params[@"tel"]    params[@"codes"]
#define Request_Method_create                        @"live/userReg"//注册 POST   params[@"tel"]  params[@"password"]
#define Request_Method_apimember                     @"live/appFindUserBytel"//会员信息   POST   param[@"tel"]
#define Request_Method_UserList                      @"live/memberlist/findMyMemberlistByUserId"//用户列表  POST   param[@"userId"]
#define Request_Method_NewUser                       @"live/memberlist/addMemberlist"//新建用户  POST
#define Request_Method_deleteUser                    @"live/memberlist/deleteMemberlistByMemberId"//删除用户  POST
#define Request_Method_card                          @"health/bindUser/bindUserApp"//绑定卡号  POST
#define Request_Method_EditUser                      @"live/memberlist/updateMemberlist"//修改用户  POST








#define Request_Method_CancelLogin                    @"apipassport-logout.html"  //注销登录



#define Request_Method_BandLogosHtml                  @"apicommon-bandlogos.html"//首页品牌列表
#define Request_Method_indexRecommon                  @"apicommon-recommends.html"//首页推荐
#define Request_Method_brandGoods                     @"apibrand-brandGoods.html"//品牌商品列表
#define Request_Method_goodDetail                     @"apiproduct-%@.html"//商品详情
#define Request_Method_addShopping                    @"apicart-add-goods.html"//加入购物车
#define Request_Method_apicarthtml                    @"apicart.html"//购物车列表
#define Request_Method_update_goods                   @"apicart-update-goods.html"//修改购物车数量
#define Request_Method_removegoods                    @"apicart-remove-goods.html"//删除购物车
#define Request_Method_checkout                       @"apicart-checkout.html"//购物车结算
#define Request_Method_shippinglist                   @"apicart-shippinglist.html"//地址列表
#define Request_Method_shippingsave                   @"apicart-shippingsave.html"//保存地址
#define Request_Method_shippingdeleteHtml             @"apicart-shippingdelete.html"//删除地址
#define Request_Method_createHtml                     @"apiorder-create.html"//提交订单
#define Request_Method_orders                         @"apimember-orders.html"//订单列表
#define Request_Method_Cancelorders                   @"apipassport-cancelorder-%@.html"//取消订单



#endif
