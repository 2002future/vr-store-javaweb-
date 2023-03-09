package utils;

import java.math.BigDecimal;
public class PriceUtils {
//    、BigDecimal概述
// Java在java.math包中提供的API类BigDecimal，
//    用来对超过16位有效位的数进行精确的运算。双精度浮点型变量double可以处理16位有效数，但在实际应用中，
//    可能需要对更大或者更小的数进行运算和处理。一般情况下，对于那些不需要准确计算精度的数字，我们可以直接使用Float和Double处理，
//            但是Double.valueOf(String) 和Float.valueOf(String)会丢失精度。所以开发中，如果我们需要精确计算的结果，则必须使用BigDecimal类来操作。
//
//            BigDecimal所创建的是对象，故我们不能使用传统的+、-、*、/等算术运算符直接对其对象进行
//    数学运算，而必须调用其相对应的方法。方法中的参数也必须是BigDecimal的对象。构造器是类的特殊方法，专门用来创建对象，特别是带有参数的对象。
//    igDecimal常用方法详解
//3.1、常用方法
//    add(BigDecimal)
//    BigDecimal对象中的值相加，返回BigDecimal对象
//    subtract(BigDecimal)
//    BigDecimal对象中的值相减，返回BigDecimal对象
//    multiply(BigDecimal)
//    BigDecimal对象中的值相乘，返回BigDecimal对象
//    divide(BigDecimal)
//    BigDecimal对象中的值相除，返回BigDecimal对象
//    toString()
//    将BigDecimal对象中的值转换成字符串
//    doubleValue()
//    将BigDecimal对象中的值转换成双精度数
//    floatValue()
//    将BigDecimal对象中的值转换成单精度数
//    longValue()
//    将BigDecimal对象中的值转换成长整数
//    intValue()
//    将BigDecimal对象中的值转换成整数

    public static float add(float a,float b) {
        BigDecimal bigA = new BigDecimal(Float.toString(a));
        BigDecimal bigB = new BigDecimal(Float.toString(b));
        return bigA.add(bigB).floatValue();
    }
    public static double add(double a,double b) {
        BigDecimal bigA = new BigDecimal(Double.toString(a));
        BigDecimal bigB = new BigDecimal(Double.toString(b));
        return bigA.add(bigB).doubleValue();
    }
    public static float subtract(float a,float b) {
        BigDecimal bigA = new BigDecimal(Float.toString(a));
        BigDecimal bigB = new BigDecimal(Float.toString(b));
        return bigA.subtract(bigB).floatValue();
    }
    public static double subtract(double a,double b) {
        BigDecimal bigA = new BigDecimal(Double.toString(a));
        BigDecimal bigB = new BigDecimal(Double.toString(b));
        return bigA.subtract(bigB).doubleValue();
    }
}
