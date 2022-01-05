//
//  UIImage+YJSImage.h
//  UICategory
//
//  Created by yjs on 2022/1/5.
//

#import <UIKit/UIKit.h>

/**
 想使用自定义文字水印的请使用方法：[UIImage lubanCompressImage:image withMask:maskName]
 添加水印时，想使用自定义图片水印的请使用方法：[UIImage lubanCompressImage:image withCustomImage:imageName]
 */
@interface UIImage (YJSImage)

///
/// @param image UIImage 对象
+ (NSData *)lubanCompressImage:(UIImage *)image;

/// <#Description#>
/// @param image UIImage 对象
/// @param maskName 添加水印名字 (NSString)
+ (NSData *)lubanCompressImage:(UIImage *)image withMask:(NSString *)maskName;

/// <#Description#>
/// @param image UIImage 对象
/// @param imageName 水印图片名称
+ (NSData *)lubanCompressImage:(UIImage *)image withCustomImage:(NSString *)imageName;

@end
