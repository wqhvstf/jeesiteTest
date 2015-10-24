package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class UserTag extends TagSupport {

	private UserInfo userInfo;

	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		try {
			JspWriter out = this.pageContext.getOut();
			if (userInfo == null) {
				out.print("No UserInfo Found...");
				return SKIP_BODY;
			}
			out.print("<table width='500px' border='1' align='center'>");
			out.println("<tr>");
			out.println("<td width='20%'>Username:</td>");
			out.println("<td>" + userInfo.getUserName() + "</td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<td>Age:</td>");
			out.println("<td>" + userInfo.getAge() + "</td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<td>Email:</td>");
			out.println("<td>" + userInfo.getEmail() + "</td>");
			out.println("</tr>");
			out.println("</table>");
		} catch (Exception e) {
			throw new JspException(e.getMessage());
		}
		return SKIP_BODY;
	}

	@Override
	public void release() {
		super.release();
		this.userInfo = null;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

}
