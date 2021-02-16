package love.maxyang.school_market.interceptor.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import love.maxyang.school_market.config.SiteConfig;
import love.maxyang.school_market.entity.common.SiteSetting;
import love.maxyang.school_market.service.common.FriendLinkService;
import love.maxyang.school_market.service.common.GoodsCategoryService;
import love.maxyang.school_market.service.common.SiteSettingService;
import love.maxyang.school_market.util.StringUtil;

/**
 * 前台全局拦截器
 * @author MaxYang
 *
 */
@Component
public class HomeGlobalInterceptor implements HandlerInterceptor{

	@Autowired
	private GoodsCategoryService goodsCategoryService;
	@Autowired
	private SiteConfig siteConfig;
	@Autowired
	private FriendLinkService friendLinkService;
	@Autowired
	private SiteSettingService siteSettingService;
	@Override
	public boolean  preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		
		if(!StringUtil.isAjax(request)){
			//若不是ajax请求，则将菜单信息放入页面模板变量
			request.setAttribute("goodsCategorys", goodsCategoryService.findAll());
			request.setAttribute("friendLinkList", friendLinkService.findList(8));
			SiteSetting siteSetting = siteSettingService.find();
			if(siteSetting != null){
				request.setAttribute("siteName", siteSetting.getSiteName());
				request.setAttribute("siteSetting", siteSetting);
			}
		}
		return true;
	}
}
