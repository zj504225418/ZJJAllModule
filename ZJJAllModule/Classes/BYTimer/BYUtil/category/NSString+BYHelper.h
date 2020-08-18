//
//  NSString+BYHelper.h
//  BMCHttpTool
//
//  Created by user on 2018/11/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (BYHelper)

/**
 *  转换JSON字符串至Dictionary
 *
 *  @param jsonString 要转换的JSON字符串
 *
 *  @return 转换后的Dictionary
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 *  转换Dictionary至JSON字符串
 *
 *  @param dictionary 要转换的Dictionary
 *
 *  @return 转换后的JSON字符串
 */
+ (NSString *)stringWithDictionary:(NSDictionary *)dictionary;

//转换Dictionary或者array至JSON字符串
+ (NSString *)stringWithObjc:(id)objc;
//转换JSON字符串至对象（字段或者数组）
+ (id)objcWithJsonString:(NSString *)jsonString;

//对象转str
+ (NSString *)by_getCorrectString:(id)obj;


//格式化金钱数额  10000-->10,000.00
+ (NSString *)by_formateAmount:(CGFloat)amount;

//格式化金钱数额  10000.00-->10,000.00
+ (NSString *)by_addSeparatorFordata:(NSString *)str;

//复制内容到黏贴板
+ (void)by_pasteContent:(NSString *)content;


//隐藏姓名信息  张三-->张*
- (NSString *)by_hideName;

//隐藏手机号信息   18100000000-->181****0000
- (NSString *)by_hidePhoneInfo;

//隐藏身份证信息  130423199308221235-->130***********1235
- (NSString *)by_hideIdNoInfo;

//隐藏银行卡号   123456789987654321-->**** **** **** 4321
- (NSString *)by_hideCardNoInfo;

//隐藏银行卡号   123456789987654321-->1234********4321
- (NSString *)by_hideCardNoInfo1;

// 截取字符串方法封装
- (NSString *)by_subStringFrom:(NSString *)startString to:(NSString *)endString;

//截取URL中的参数
- (NSMutableDictionary *)by_getURLParameters;

/**
 *  计算字符串的宽度
 *
 *  @return 字符串宽度
 */
- (float)by_heightForStringfontSize:(float)fontSize andWidth:(float)width;


//去掉字符串中的空格和换行符
-(NSString *)by_stringCleanString;

//移除字符串中非数字的字符
-(NSString *)by_removeNoNumStr;
/**
 *  在字符串某个位置插入图片
 *  @return 带有图片的字符串富文本
 */
- (NSAttributedString *)attributedWithImage:(NSString *)imageName location:(NSInteger)location imageBounds:(CGRect)imageBounds;
@end



NS_ASSUME_NONNULL_END
