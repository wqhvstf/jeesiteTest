package com.tag;

import java.util.Collection;
import java.util.Iterator;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class RepeaterTag extends TagSupport {

	private Collection items;

	private Iterator it;

	private String var;

	@Override
	public int doAfterBody() throws JspException {
		if (it.hasNext()) {
			pageContext.setAttribute(var, it.next());
			return EVAL_BODY_AGAIN;
		}
		return SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		if (items == null || items.size() == 0) {
			return SKIP_BODY;
		}
		it = items.iterator();
		if (it.hasNext()) {
			this.pageContext.setAttribute(var, it.next());
		}
		return EVAL_BODY_INCLUDE;
	}

	@Override
	public void release() {
		super.release();
	}

	public Collection getItems() {
		return items;
	}

	public void setItems(Collection items) {
		this.items = items;
	}

	public String getVar() {
		return var;
	}

	public void setVar(String var) {
		this.var = var;
	}

}
