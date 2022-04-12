package MyTags;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class tagsPaginate extends SimpleTagSupport {
	private int totalPage;
	private int url;
	private String key;
	
	
	public void setUrl(int url) {
		this.url = url;
	}


	public void setKey(String key) {
		this.key = key;
	}
	


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	@Override
	public void doTag() throws JspException, IOException {
		JspWriter jw = getJspContext().getOut();
		jw.print("<ul>");
		if(key != null &&  !key.isEmpty()){
   			for (int i = 1; i <= totalPage; i++) {
   				jw.write("<li><a class='page-link' href='" + url + "&page=" + i + "&key="+key+"' >" + i + "</a></li>");
   			}
   		}else{
   			for (int i = 1; i <= totalPage; i++) {
   				jw.write("<li><a class='page-link' href='" + url + "&page=" + i + "' >" + i + "</a></li>");
   			}
   		}
		jw.print("</ul>");
		super.doTag();
	}
}
