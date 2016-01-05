//
//  GVUserDefaults.m
//  GVUserDefaults
//
//  Created by Kevin Renskers on 18-12-12.
//  Copyright (c) 2012 Gangverk. All rights reserved.
//

#import "GVUserDefaults.h"
#import <objc/runtime.h>

@interface GVUserDefaults ()
@property (strong, nonatomic) NSMutableDictionary *mapping;
@property (strong, nonatomic) NSUserDefaults *userDefaults;
@end

@implementation GVUserDefaults

enum TypeEncodings {
    Char                = 'c',
    Bool                = 'B',
    Short               = 's',
    Int                 = 'i',
    Long                = 'l',
    LongLong            = 'q',
    UnsignedChar        = 'C',
    UnsignedShort       = 'S',
    UnsignedInt         = 'I',
    UnsignedLong        = 'L',
    UnsignedLongLong    = 'Q',
    Float               = 'f',
    Double              = 'd',
    Object              = '@'
};

- (NSUserDefaults *)userDefaults {
    if (!_userDefaults) {
        NSString *suitName = nil;
        if ([NSUserDefaults instancesRespondToSelector:@selector(initWithSuiteName:)]) {
            suitName = [self _suitName];
        }

        if (suitName && suitName.length) {
            _userDefaults = [[NSUserDefaults alloc] initWithSuiteName:suitName];
        } else {
            _userDefaults = [NSUserDefaults standardUserDefaults];
        }
    }

    return _userDefaults;
}

- (NSString *)defaultsKeyForPropertyNamed:(char const *)propertyName {
    NSString *key = [NSString stringWithFormat:@"%s", propertyName];
    return [self _transformKey:key];
}

- (NSString *)defaultsKeyForSelector:(SEL)selector {
    return [self.mapping objectForKey:NSStringFromSelector(selector)];
}

static long long longLongGetter(GVUserDefaults *self, SEL _cmd) {
    NSString *key = [self defaultsKeyForSelector:_cmd];
    return [[self.userDefaults objectForKey:key] longLongValue];
}

static void longLongSetter(GVUserDefaults *self, SEL _cmd, long long value) {
    NSString *key = [self defaultsKeyForSelector:_cmd];
    NSNumber *object = [NSNumber numberWithLongLong:value];
    [self.userDefaults setObject:object forKey:key];
}

static bool boolGetter(GVUserDefaults *self, SEL _cmd) {
    NSString *key = [self defaultsKeyForSelector:_cmd];
    return [self.userDefaults boolForKey:key];
}

static void boolSetter(GVUserDefaults *self, SEL _cmd, bool value) {
    NSString *key = [self defaultsKeyForSelector:_cmd];
    [self.userDefaults setBool:value forKey:key];
}

static int integerGetter(GVUserDefaults *self, SEL _cmd) {
    NSString *key = [self defaultsKeyForSelector:_cmd];
    return (int)[self.userDefaults integerForKey:key];
}

static void integerSetter(GVUserDefaults *self, SEL _cmd, int value) {
    NSString *key = [self defaultsKeyForSelector:_cmd];
    [self.userDefaults setInteger:value forKey:key];
}

static float floatGetter(GVUserDefaults *self, SEL _cmd) {
    NSString *key = [self defaultsKeyForSelector:_cmd];
    return [self.userDefaults floatForKey:key];
}

static void floatSetter(GVUserDefaults *self, SEL _cmd, float value) {
    NSString *key = [self defaultsKeyForSelector:_cmd];
    [self.userDefaults setFloat:value forKey:key];
}

static double doubleGetter(GVUserDefaults *self, SEL _cmd) {
    NSString *key = [self defaultsKeyForSelector:_cmd];
    return [self.userDefaults doubleForKey:key];
}

static void doubleSetter(GVUserDefaults *self, SEL _cmd, double value) {
    NSString *key = [self defaultsKeyForSelector:_cmd];
    [self.userDefaults setDouble:value forKey:key];
}

static id objectGetter(GVUserDefaults *self, SEL _cmd) {
    NSString *key = [self defaultsKeyForSelector:_cmd];
    return [self.userDefaults objectForKey:key];
}

static void objectSetter(GVUserDefaults *self, SEL _cmd, id object) {
    NSString *key = [self defaultsKeyForSelector:_cmd];
    if (object) {
        [self.userDefaults setObject:object forKey:key];
    } else {
        [self.userDefaults removeObjectForKey:key];
    }
}

#pragma mark - Begin

+ (instancetype)standardUserDefaults {
    static dispatch_once_t pred;
    static GVUserDefaults *sharedInstance = nil;
    dispatch_once(&pred, ^{ sharedInstance = [[self alloc] init]; });
    return sharedInstance;
}

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wundeclared-selector"
#pragma GCC diagnostic ignored "-Warc-performSelector-leaks"

- (instancetype)init {
    self = [super init];
    if (self) {
        SEL setupDefaultSEL = NSSelectorFromString([NSString stringWithFormat:@"%@pDefaults", @"setu"]);
        if ([self respondsToSelector:setupDefaultSEL]) {
            NSDictionary *defaults = [self performSelector:setupDefaultSEL];
            NSMutableDictionary *mutableDefaults = [NSMutableDictionary dictionaryWithCapacity:[defaults count]];
            for (NSString *key in defaults) {
                id value = [defaults objectForKey:key];
                NSString *transformedKey = [self _transformKey:key];
                [mutableDefaults setObject:value forKey:transformedKey];
            }
            [self.userDefaults registerDefaults:mutableDefaults];
        }

        [self generateAccessorMethods];
    }

    return self;
}

- (NSString *)_transformKey:(NSString *)key {
    if ([self respondsToSelector:@selector(transformKey:)]) {
        return [self performSelector:@selector(transformKey:) withObject:key];
    }

    return key;
}

- (NSString *)_suitName {
    if ([self respondsToSelector:@selector(suitName)]) {
        return [self performSelector:@selector(suitName)];
    }

    return nil;
}

#pragma GCC diagnostic pop

- (void)generateAccessorMethods {
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);

    self.mapping = [NSMutableDictionary dictionary];

    for (int i = 0; i < count; ++i) {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        const char *attributes = property_getAttributes(property);

        char *getter = strstr(attributes, ",G");
        if (getter) {
            getter = strdup(getter + 2);
            getter = strsep(&getter, ",");
        } else {
            getter = strdup(name);
        }
        SEL getterSel = sel_registerName(getter);
        free(getter);

        char *setter = strstr(attributes, ",S");
        if (setter) {
            setter = strdup(setter + 2);
            setter = strsep(&setter, ",");
        } else {
            asprintf(&setter, "set%c%s:", toupper(name[0]), name + 1);
        }
        SEL setterSel = sel_registerName(setter);
        free(setter);

        NSString *key = [self defaultsKeyForPropertyNamed:name];
        [self.mapping setValue:key forKey:NSStringFromSelector(getterSel)];
        [self.mapping setValue:key forKey:NSStringFromSelector(setterSel)];

        IMP getterImp = NULL;
        IMP setterImp = NULL;
        char type = attributes[1];
        switch (type) {
            case Short:
            case Long:
            case LongLong:
            case UnsignedChar:
            case UnsignedShort:
            case UnsignedInt:
            case UnsignedLong:
            case UnsignedLongLong:
                getterImp = (IMP)longLongGetter;
                setterImp = (IMP)longLongSetter;
                break;

            case Bool:
            case Char:
                getterImp = (IMP)boolGetter;
                setterImp = (IMP)boolSetter;
                break;

            case Int:
                getterImp = (IMP)integerGetter;
                setterImp = (IMP)integerSetter;
                break;

            case Float:
                getterImp = (IMP)floatGetter;
                setterImp = (IMP)floatSetter;
                break;

            case Double:
                getterImp = (IMP)doubleGetter;
                setterImp = (IMP)doubleSetter;
                break;

            case Object:
                getterImp = (IMP)objectGetter;
                setterImp = (IMP)objectSetter;
                break;

            default:
                free(properties);
                [NSException raise:NSInternalInconsistencyException format:@"Unsupported type of property \"%s\" in class %@", name, self];
                break;
        }

        char types[5];

        snprintf(types, 4, "%c@:", type);
        class_addMethod([self class], getterSel, getterImp, types);
        
        snprintf(types, 5, "v@:%c", type);
        class_addMethod([self class], setterSel, setterImp, types);
    }

    free(properties);
}


+ (void)saveUserInfo:(ETY_Provider *)provider {
    [GVUserDefaults standardUserDefaults].user_id                = provider.user_id;
    [GVUserDefaults standardUserDefaults].im_id                  = provider.im_id;
    [GVUserDefaults standardUserDefaults].base_nickname          = provider.base_nickname;         // string 用户昵称
    [GVUserDefaults standardUserDefaults].base_phone             = provider.base_phone;            // string 电话
    [GVUserDefaults standardUserDefaults].base_email             = provider.base_email;            // string 邮箱
    [GVUserDefaults standardUserDefaults].base_business          = provider.base_business;         // int 供应商状态
    [GVUserDefaults standardUserDefaults].base_language          = provider.base_language;         // string 使用语言
    [GVUserDefaults standardUserDefaults].base_authorize         = provider.base_authorize;        // string,注册类型（示例：facebook,google），用逗号分割，如果邮箱注册为空
    [GVUserDefaults standardUserDefaults].service_categories     = provider.service_categories;    // string 提供服务类型
    [GVUserDefaults standardUserDefaults].profile_sex            = provider.profile_sex;           // int 性别
    [GVUserDefaults standardUserDefaults].profile_firstname      = provider.profile_firstname;     // string 姓
    [GVUserDefaults standardUserDefaults].profile_lastname       = provider.profile_lastname;      // string 名
    [GVUserDefaults standardUserDefaults].profile_birthday       = provider.profile_birthday;      // date 生日
    [GVUserDefaults standardUserDefaults].profile_education      = provider.profile_education;     // string 教育
    [GVUserDefaults standardUserDefaults].profile_hometown       = provider.profile_hometown;      // string 家乡
    [GVUserDefaults standardUserDefaults].photo_avatar           = provider.photo_avatar;          // string 用户头像
    [GVUserDefaults standardUserDefaults].profile_address        = provider.profile_address;       // string 地址
    [GVUserDefaults standardUserDefaults].profile_zipcode        = provider.profile_zipcode;       // string 邮编
    [GVUserDefaults standardUserDefaults].profile_interests      = provider.profile_interests;     // string 兴趣
    [GVUserDefaults standardUserDefaults].profile_work           = provider.profile_work;          // string 工作
    [GVUserDefaults standardUserDefaults].profile_intro          = provider.profile_intro;         // string 个人介绍
    [GVUserDefaults standardUserDefaults].profile_short_intro    = provider.profile_short_intro;   // string 个人简介-一句话介绍
    [GVUserDefaults standardUserDefaults].photo_primary          = provider.photo_primary;         // string 个人详情背景图
    [GVUserDefaults standardUserDefaults].photo_background       = provider.photo_background;      // string 列表背景图
    [GVUserDefaults standardUserDefaults].photo_intro            = provider.photo_intro;           // string - json 个人图片组
    [GVUserDefaults standardUserDefaults].vary_rank              = provider.vary_rank;                 // int 星级
    [GVUserDefaults standardUserDefaults].vary_relation_attention = provider.vary_relation_attention;   // int 关系-关注数
    [GVUserDefaults standardUserDefaults].vary_ralation_follow   = provider.vary_ralation_follow;      // int 关系-粉丝数
    [GVUserDefaults standardUserDefaults].vary_be_collected      = provider.vary_be_collected;         // int 被收藏数
    [GVUserDefaults standardUserDefaults].verify_phone_time      = provider.verify_phone_time;         // int 非0表示已经验证，且为验证的时间戳
    [GVUserDefaults standardUserDefaults].verify_email_time      = provider.verify_email_time;         // int 非0表示已经验证，且为验证的时间戳
    [GVUserDefaults standardUserDefaults].status_request_time    = provider.status_request_time;       // int 注册时间
    [GVUserDefaults standardUserDefaults].status_approval_time   = provider.status_approval_time;      // int 批准时间
    [GVUserDefaults standardUserDefaults].base_avg_star          = provider.base_avg_star;
    [GVUserDefaults standardUserDefaults].base_cnt_star          = provider.base_cnt_star;
    [GVUserDefaults standardUserDefaults].base_sp_avg_star       = provider.base_sp_avg_star;
    [GVUserDefaults standardUserDefaults].base_sp_cnt_star       = provider.base_sp_cnt_star;
    [GVUserDefaults standardUserDefaults].sp_apply_flag          = provider.sp_apply_flag;
}
@end
