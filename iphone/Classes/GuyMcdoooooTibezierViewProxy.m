/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2015年 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "GuyMcdoooooTibezierViewProxy.h"
#import "TiUtils.h"

@implementation GuyMcdoooooTibezierViewProxy

#pragma mark - Public API

-(void)setBezier:(id)args {
    
    CAShapeLayer* shape = [CAShapeLayer layer];
    UIBezierPath* bezier = UIBezierPath.bezierPath;
    
    TiColor* strokeColor = [TiUtils colorValue:@"strokeColor" properties:args def:nil];
    if ( nil != strokeColor ) shape.strokeColor = [strokeColor color].CGColor;
    
    TiColor* fillColor = [TiUtils colorValue:@"fillColor" properties:args def:nil];
    if ( nil != fillColor ) shape.fillColor = [fillColor color].CGColor;
    
    NSNumber* strokeStart = [TiUtils numberFromObject:[args objectForKey:@"strokeStart"]];
    if ( nil != strokeStart ) shape.strokeStart = [strokeStart floatValue];
    
    NSNumber* strokeEnd = [TiUtils numberFromObject:[args objectForKey:@"strokeEnd"]];
    if ( nil != strokeEnd ) shape.strokeEnd = [strokeEnd floatValue];
    else shape.strokeEnd = 1.0;
    
    NSNumber* lineWidth = [TiUtils numberFromObject:[args objectForKey:@"lineWidth"]];
    if ( nil != lineWidth ) shape.lineWidth = bezier.lineWidth = [lineWidth floatValue];
    
    NSNumber* miterLimit = [TiUtils numberFromObject:[args objectForKey:@"miterLimit"]];
    if ( nil != miterLimit ) shape.miterLimit = bezier.miterLimit = [miterLimit floatValue];
    
    NSNumber* flatness = [TiUtils numberFromObject:[args objectForKey:@"flatness"]];
    if ( nil != flatness ) bezier.flatness = [flatness floatValue];
    
    if ( [[TiUtils stringValue:@"lineCapStyle" properties:args] isEqualToString:@"butt"] ) {
        bezier.lineCapStyle = kCGLineCapButt;
        shape.lineCap = @"butt";
    } else if ( [[TiUtils stringValue:@"lineCapStyle" properties:args] isEqualToString:@"round"] ) {
        bezier.lineCapStyle = kCGLineCapRound;
        shape.lineCap = @"round";
    } else if ( [[TiUtils stringValue:@"lineCapStyle" properties:args] isEqualToString:@"square"] ) {
        bezier.lineCapStyle = kCGLineCapSquare;
        shape.lineCap = @"square";
    }
    
    if ( [[TiUtils stringValue:@"lineJoinStyle" properties:args] isEqualToString:@"miter"] ) {
        bezier.lineJoinStyle = kCGLineJoinMiter;
        shape.lineJoin = @"miter";
    } else if ( [[TiUtils stringValue:@"lineJoinStyle" properties:args] isEqualToString:@"round"] ) {
        bezier.lineJoinStyle = kCGLineJoinRound;
        shape.lineJoin = @"round";
    } else if ( [[TiUtils stringValue:@"lineJoinStyle" properties:args] isEqualToString:@"bevel"] ) {
        bezier.lineJoinStyle = kCGLineJoinBevel;
        shape.lineJoin = @"bevel";
    }
    
    id paths = [(NSDictionary *)args objectForKey:@"paths"];
    
    for ( id path in paths ) {
        
        NSString *drawName = [(NSDictionary *)path objectForKey:@"draw"];
        
        if ( [drawName isEqualToString:@"moveToPoint"] ) {
            
            [bezier moveToPoint: CGPointMake(
                                             [[(NSDictionary *)path objectForKey:@"point"][0] floatValue],
                                             [[(NSDictionary *)path objectForKey:@"point"][1] floatValue]
                                            )];
            
        } else if ( [drawName isEqualToString:@"addLineToPoint"] ) {
            
            [bezier addLineToPoint: CGPointMake(
                                                [[(NSDictionary *)path objectForKey:@"point"][0] floatValue],
                                                [[(NSDictionary *)path objectForKey:@"point"][1] floatValue]
                                               )];
            
        } else if ( [drawName isEqualToString:@"addCurveToPoint"] ) {
            
            [bezier addCurveToPoint:CGPointMake(
                                                [[(NSDictionary *)path objectForKey:@"endPoint"][0] floatValue],
                                                [[(NSDictionary *)path objectForKey:@"endPoint"][1] floatValue]
                                               )
                      controlPoint1:CGPointMake(
                                                [[(NSDictionary *)path objectForKey:@"controlPoint1"][0] floatValue],
                                                [[(NSDictionary *)path objectForKey:@"controlPoint1"][1] floatValue]
                                               )
                      controlPoint2:CGPointMake(
                                                [[(NSDictionary *)path objectForKey:@"controlPoint2"][0] floatValue],
                                                [[(NSDictionary *)path objectForKey:@"controlPoint2"][1] floatValue]
                                               )];
            
        } else if ( [drawName isEqualToString:@"addQuadCurveToPoint"] ) {
            
            [bezier addQuadCurveToPoint:CGPointMake(
                                                    [[(NSDictionary *)path objectForKey:@"endPoint"][0] floatValue],
                                                    [[(NSDictionary *)path objectForKey:@"endPoint"][1] floatValue]
                                                   )
                           controlPoint:CGPointMake(
                                                    [[(NSDictionary *)path objectForKey:@"controlPoint"][0] floatValue],
                                                    [[(NSDictionary *)path objectForKey:@"controlPoint"][1] floatValue]
                                                   )];
            
        } else if ( [drawName isEqualToString:@"addArcWithCenter"] ) {
            
            [bezier addArcWithCenter:CGPointMake(
                                                 [[(NSDictionary *)path objectForKey:@"center"][0] floatValue],
                                                 [[(NSDictionary *)path objectForKey:@"center"][1] floatValue]
                                                )
                              radius: [[(NSDictionary *)path objectForKey:@"radius"] floatValue]
                          startAngle: degreesToRadians( [[(NSDictionary *)path objectForKey:@"startAngle"] floatValue] )
                            endAngle: degreesToRadians( [[(NSDictionary *)path objectForKey:@"endAngle"] floatValue] )
                           clockwise: [[(NSDictionary *)path objectForKey:@"clockwise"] boolValue]];
            
        } else if ( [drawName isEqualToString:@"rect"] ) {
            
            UIBezierPath* bezierRect = [UIBezierPath bezierPathWithRect: CGRectMake(
                                            [[(NSDictionary *)path objectForKey:@"rect"][0] floatValue],
                                            [[(NSDictionary *)path objectForKey:@"rect"][1] floatValue],
                                            [[(NSDictionary *)path objectForKey:@"rect"][2] floatValue],
                                            [[(NSDictionary *)path objectForKey:@"rect"][3] floatValue]
                                       )];
            
            [bezier appendPath: bezierRect];
            
        } else if ( [drawName isEqualToString:@"oval"] ) {
            
            UIBezierPath* bezierOval = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(
                                            [[(NSDictionary *)path objectForKey:@"rect"][0] floatValue],
                                            [[(NSDictionary *)path objectForKey:@"rect"][1] floatValue],
                                            [[(NSDictionary *)path objectForKey:@"rect"][2] floatValue],
                                            [[(NSDictionary *)path objectForKey:@"rect"][3] floatValue]
                                       )];
            
            [bezier appendPath: bezierOval];
            
        } else if ( [drawName isEqualToString:@"roundedRect"] ) {
            
            UIBezierPath* bezierRoundedRect = [UIBezierPath
                                               bezierPathWithRoundedRect: CGRectMake(
                                                [[(NSDictionary *)path objectForKey:@"rect"][0] floatValue],
                                                [[(NSDictionary *)path objectForKey:@"rect"][1] floatValue],
                                                [[(NSDictionary *)path objectForKey:@"rect"][2] floatValue],
                                                [[(NSDictionary *)path objectForKey:@"rect"][3] floatValue])
                                               cornerRadius:
                                                [[(NSDictionary *)path objectForKey:@"borderRadius"] floatValue]];
            
            [bezier appendPath: bezierRoundedRect];
            
        }/* else if ( [drawName isEqualToString:@"arcCenter"] ) {
            
            UIBezierPath* bezierArcCenter = [UIBezierPath
                                             bezierPathWithArcCenter: CGPointMake(
                                                [[(NSDictionary *)path objectForKey:@"center"][0] floatValue],
                                                [[(NSDictionary *)path objectForKey:@"center"][1] floatValue])
                                             radius: [[(NSDictionary *)path objectForKey:@"radius"] floatValue]
                                             startAngle: [[(NSDictionary *)path objectForKey:@"startAngle"] floatValue]
                                             endAngle: [[(NSDictionary *)path objectForKey:@"endAngle"] floatValue]
                                             clockwise: [[(NSDictionary *)path objectForKey:@"clockwise"] boolValue]];
            
            [bezier appendPath: bezierArcCenter];
            
        }*/ else if ( [drawName isEqualToString:@"closePath"] ) {
            
            [bezier closePath];
            
        }
        
    }
    
    if ( [TiUtils boolValue:@"stroke" properties:args] ) [bezier stroke];
    if ( [TiUtils boolValue:@"fill" properties:args] ) [bezier fill];
    if ( [TiUtils boolValue:@"addClip" properties:args] ) [bezier addClip];
    if ( [TiUtils boolValue:@"usesEvenOddFillRule" properties:args] ) bezier.usesEvenOddFillRule = YES;
    
    shape.path = bezier.CGPath;
    [self.view.layer addSublayer:shape];
    
}

@end
