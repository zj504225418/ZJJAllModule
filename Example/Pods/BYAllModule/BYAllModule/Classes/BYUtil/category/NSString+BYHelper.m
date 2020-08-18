//
//  NSString+BYHelper.m
//  BMCHttpTool
//
//  Created by user on 2018/11/12.
//

#import "NSString+BYHelper.h"

@implementation NSString (BYHelper)
//转换JSON字符串至Dictionary
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    return [self objcWithJsonString:jsonString];
}


//转换Dictionary至JSON字符串
+ (NSString *)stringWithDictionary:(NSDictionary *)dictionary
{
    return [self stringWithObjc:dictionary];
}

//转换JSON字符串至对象（字段或者数组）
+ (id)objcWithJsonString:(NSString *)jsonString
{
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    if (!data) {
        return nil;
    }
    NSError *error;
    NSDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"转换Json字符串 %@ 至objc失败！", jsonString);
        return nil;
    } else {
        return jsonResult;
    }
}


//转换Dictionary或者array至JSON字符串
+ (NSString *)stringWithObjc:(id)objc
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:objc options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"转换objc %@ 至NSString失败！", objc);
        return nil;
    } else {
        NSString *strJsonRequest = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return strJsonRequest;
    }
}

//对象转str
+ (NSString *)by_getCorrectString:(id)obj{
    if ([obj isMemberOfClass:[NSNull class]]||[obj isEqualToString:@"<null>"]||[obj isEqualToString:@"(null)"]||obj==nil) {
        return @"";
    }else{
        return [NSString stringWithFormat:@"%@",obj];
    }
}


//格式化金钱数额  10000-->10,000.00
+ (NSString *)by_formateAmount:(CGFloat)amount{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@"###,##0.00;"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:amount]];
    return formattedNumberString;
}



//格式化金钱数额  10000.00-->10,000.00
+ (NSString *)by_addSeparatorFordata:(NSString *)str{
    
    NSMutableString *tempStr = str.mutableCopy;
    NSRange range = [str rangeOfString:@"."];
    NSInteger index = 0;
    if (range.length >0) {
        index = range.location;
    }else{
        index = str.length;
    }
    while ((index - 3)>0) {
        index-=3;
        [tempStr insertString:@"," atIndex:index];
    }
    //    tempStr = [tempStr stringByReplacingOccurrencesOfString:@"." withString:@","].mutableCopy;
    return tempStr;
    
}

//复制内容到黏贴板
+ (void)by_pasteContent:(NSString *)content{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = content;
}

//隐藏姓名信息  张三-->张*
- (NSString *)by_hideName{
    if ([self length]<1) {
        return nil;
    }
    if ([self length] == 2) {
        return [self stringByReplacingCharactersInRange:NSMakeRange(0, [self length]-1) withString:@"*"];
    }else{
        return [NSString stringWithFormat:@"**%@",[self substringFromIndex:self.length - 1]];
    }
}

//隐藏手机号信息   18100000000-->181****0000
- (NSString *)by_hidePhoneInfo{
    if ([self isEqualToString:@""]) {
        return nil;
    }
    if (self.length<11) {
        return self;
    }
    return [self stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
}

//隐藏身份证信息  130423199308221235-->130***********1235
- (NSString *)by_hideIdNoInfo{
    if ([self isEqualToString:@""]) {
        return nil;
    }
    if (self.length<18) {
        return @"***********";
    }
    return [self stringByReplacingCharactersInRange:NSMakeRange(3, 11) withString:@"***********"];
}

//隐藏银行卡号   123456789987654321-->**** **** **** 4321
- (NSString *)by_hideCardNoInfo{
    if ([self isEqualToString:@""]||self.length<4) {
        return nil;
    }
    return [NSString stringWithFormat:@"**** **** **** %@",[self substringFromIndex:self.length-4]];
}


//隐藏银行卡号   123456789987654321-->1234********4321
- (NSString *)by_hideCardNoInfo1;
{
    if ([self isEqualToString:@""]) {
        return nil;
    }
    if (self.length<8) {
        return self;
    }
    NSString *appendStr = @"";
    for (int i= 0;i<self.length-8;i++){
        appendStr = [NSString stringWithFormat:@"%@*",appendStr];
    }
    return [self stringByReplacingCharactersInRange:NSMakeRange(4, self.length-8) withString:appendStr];
}



// 截取字符串方法封装//
- (NSString *)by_subStringFrom:(NSString *)startString to:(NSString *)endString{
    NSRange startRange = [self rangeOfString:startString];
    NSRange endRange = [self rangeOfString:endString];
    NSRange range = NSMakeRange(startRange.location+ startRange.length,
                                endRange.location - startRange.location- startRange.length);
    return [self substringWithRange:range];
}

/**
 *  截取URL中的参数
 *
 *  @return NSMutableDictionary parameters
 */
- (NSMutableDictionary *)by_getURLParameters {
    
    // 查找参数
    NSRange range = [self rangeOfString:@"?"];
    if (range.location == NSNotFound) {
        return nil;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    // 截取参数
    NSString *parametersString = [self substringFromIndex:range.location + 1];
    
    // 判断参数是单个参数还是多个参数
    if ([parametersString containsString:@"&"]) {
        
        // 多个参数，分割参数
        NSArray *urlComponents = [parametersString componentsSeparatedByString:@"&"];
        
        for (NSString *keyValuePair in urlComponents) {
            // 生成Key/Value
            NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
            NSString *key = pairComponents.firstObject;//[pairComponents.firstObject stringByRemovingPercentEncoding];
            NSString *value = pairComponents.lastObject;//[pairComponents.lastObject stringByRemovingPercentEncoding];
            
            // Key不能为nil
            if (key == nil || value == nil) {
                continue;
            }
            
            id existValue = [params valueForKey:key];
            
            if (existValue != nil) {
                
                // 已存在的值，生成数组
                if ([existValue isKindOfClass:[NSArray class]]) {
                    // 已存在的值生成数组
                    NSMutableArray *items = [NSMutableArray arrayWithArray:existValue];
                    [items addObject:value];
                    
                    [params setValue:items forKey:key];
                } else {
                    
                    // 非数组
                    [params setValue:@[existValue, value] forKey:key];
                }
                
            } else {
                
                // 设置值
                [params setValue:value forKey:key];
            }
        }
    } else {
        // 单个参数
        
        // 生成Key/Value
        NSArray *pairComponents = [parametersString componentsSeparatedByString:@"="];
        
        // 只有一个参数，没有值
        if (pairComponents.count == 1) {
            return nil;
        }
        
        // 分隔值
        NSString *key = pairComponents.firstObject;//[pairComponents.firstObject stringByRemovingPercentEncoding];
        NSString *value = pairComponents.lastObject;//[pairComponents.lastObject stringByRemovingPercentEncoding];
        // Key不能为nil
        if (key == nil || value == nil) {
            return nil;
        }
        
        // 设置值
        [params setValue:value forKey:key];
    }
    
    return params;
}
- (float) by_heightForStringfontSize:(float)fontSize andWidth:(float)width
{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return size.width;
}



//去掉字符串中的空格和换行符
-(NSString *)by_stringCleanString{
    NSString *str = [self stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return str;
}



//移除字符串中非数字的字符
-(NSString *)by_removeNoNumStr{
    
    NSString *result=@"";
    
    for (int i=0; i<self.length; i++) {
        
        NSString *s=[self substringWithRange:NSMakeRange(i, 1)];
        
        const char *ch=[s UTF8String];
        
        if (*ch>='0'&&*ch<='9') {
            
            result=[result stringByAppendingString:s];
        }
    }
    
    if ([result hasPrefix:@"86"]) {
        result = [result substringFromIndex:2];
    }
    return result;
}

/**
 *  在字符串某个位置插入图片
 *  @return 带有图片的字符串富文本
 */
- (NSAttributedString *)attributedWithImage:(NSString *)imageName location:(NSInteger)location imageBounds:(CGRect)imageBounds{
    // 创建一个富文本
    NSMutableAttributedString *attri =     [[NSMutableAttributedString alloc] initWithString:self];
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    attch.image = [UIImage imageNamed:imageName];
    // 设置图片大小
    attch.bounds = imageBounds;
    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    //在文字后面添加图片
    //    [attri appendAttributedString:string];
    //在文字下标第几个添加图片  0就是文字前面添加图片
    [attri insertAttributedString:string atIndex:location];
    // 用label的attributedText属性来使用富文本
    return attri;
}

@end
