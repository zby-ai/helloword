package com.atguigu.ssm.utils;

import com.github.pagehelper.PageInfo;

import javax.servlet.http.HttpServletRequest;

/**
 * @author zbystart
 * @create 2020-12-18 下午 7:01
 */
public class PageUtils {
    public static <T> String getPage(PageInfo<T> pageInfo, HttpServletRequest httpServletRequest){
        String path = httpServletRequest.getContextPath() + "/";
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("<nav aria-label='Page navigation'><ul class='pagination'>");
        //首页
        if (pageInfo.getPageNum() == 1){
            stringBuilder.append("<li class=\"active\"><span>首页<span class=\"sr-only\">(current)</span></span></li>");
        }else {
            stringBuilder.append("<li><a href='#' page='1' >首页</a></li>");
        }

        //上一页
        if (pageInfo.isHasPreviousPage()){
            stringBuilder.append("<li><a href='#' page='"+pageInfo.getPrePage()+"' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
        }else {
            stringBuilder.append("<li class=\"disabled\"><span><span aria-hidden=\"true\">&laquo;</span></span></li>");
        }
        //中间的页码
        int[] pageNums = pageInfo.getNavigatepageNums();
        for (int i : pageNums){
            if (pageInfo.getPageNum() == i){
                stringBuilder.append("<li class=\"active \"><span spanPageNum = '"+i+"' id='span_page' >"+i+"<span class=\"sr-only\">(current)</span></span></li>");
            }else {
                stringBuilder.append("<li><a href=\"#\" page='"+i+"'>"+i+"</a></li>");
            }
        }
        //下一页
        if (pageInfo.isHasNextPage()){
            stringBuilder.append("<li><a href='#' page='"+pageInfo.getNextPage()+"'aria-label='Previous'><span aria-hidden='true'>&raquo;</span></a></li>");
        }else {
            stringBuilder.append("<li class=\"disabled\"><span><span aria-hidden=\"true\">&raquo;</span></span></li>");
        }

        if (pageInfo.getPages() == pageInfo.getPageNum()){
            stringBuilder.append("<li class=\"active\"><span>尾页<span class=\"sr-only\">(current)</span></span></li>");
        }else {
            stringBuilder.append("<li><a href=\"#\" page ='"+pageInfo.getPages()+"' >尾页</a></li></ul></nav>");
        }
        //尾页
        return stringBuilder.toString();
    }
}
