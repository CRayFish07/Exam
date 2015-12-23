package com.jae.util;

public class PageUtil {
	public static String genPagation(String targeUrl,int totalNum,int currentPage,int PageSize){
		int totalPage=totalNum%PageSize==0?totalNum/PageSize:totalNum/PageSize+1;
		StringBuffer pageCode = new StringBuffer();
		pageCode.append("<li><a href='"+targeUrl+"?page=1'>首页</a></li>");
		if(currentPage==1){
			pageCode.append("<li><a href='#' class='disabled'>上一页</a></li>");
		}else{
			pageCode.append("<li><a href='"+targeUrl+"?page="+(currentPage-1)+"' >上一页</a></li>");
		}
		for(int i=currentPage-2;i<=currentPage+2;i++){
			if(i<1||i>totalPage){
				continue;
			}
			if(i==currentPage){
				pageCode.append("<li class='active'><a href='#'>"+i+"</a></li>");
			}else{
				pageCode.append("<li><a href='"+targeUrl+"?page="+i+"' class='active'>"+i+"</a></li>");
			}
		}
		if(currentPage==totalPage){
			pageCode.append("<li><a href='#' class='disabled'>下一页</a></li>");
		}else{
			pageCode.append("<li><a href='"+targeUrl+"?page="+(currentPage+1)+"' >下一页</a></li>");
		}
		pageCode.append("<li><a href='"+targeUrl+"?page="+totalPage+"'>尾页</a></li>");
		return pageCode.toString();
	}
}
