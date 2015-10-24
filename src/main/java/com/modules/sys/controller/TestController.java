package com.modules.sys.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.ajaxanywhere.AAUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tag.UserInfo;

/**
 * 
 * @ClassName: TestController
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author qinghua.wu
 * @date 2015年10月24日 上午9:49:04
 *
 */
@Controller
@RequestMapping(value = "/test")
public class TestController {

	private static List<UserInfo> lists = new ArrayList<UserInfo>();

	@RequestMapping(value="/bootstrap")
	public ModelAndView bootstrap() {
		ModelAndView view = new ModelAndView("bootstrap");
		return view;
	}

	@RequestMapping(value = "/list")
	public ModelAndView test() {
		ModelAndView view = new ModelAndView("list");
		view.addObject("list", lists);
		return view;
	}

	@RequestMapping(value = "/add")
	public ModelAndView add(UserInfo info) throws InterruptedException {
		System.out.println(info.toString());
		lists.add(info);
		ModelAndView view = new ModelAndView("list");
		view.addObject("list", lists);
		Thread.sleep(5000);
		return view;
	}
}
