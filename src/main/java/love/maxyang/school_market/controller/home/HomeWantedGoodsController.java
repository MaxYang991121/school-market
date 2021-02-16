package love.maxyang.school_market.controller.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import love.maxyang.school_market.bean.PageBean;
import love.maxyang.school_market.entity.common.WantedGoods;
import love.maxyang.school_market.service.common.WantedGoodsService;

/**
 * 求购物品控制器
 * @author MaxYang
 *
 */
@RequestMapping("/home/wanted_goods")
@Controller
public class HomeWantedGoodsController {

	@Autowired
	private WantedGoodsService wantedGoodsService;
	
	/**
	 * 求购物品列表页面
	 * @param model
	 * @param pageBean
	 * @param WantedGoods
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(Model model,PageBean<WantedGoods> pageBean,WantedGoods WantedGoods){
		model.addAttribute("pageBean", wantedGoodsService.findlist(pageBean, WantedGoods));
		return "home/wanted_goods/list";
	}
}
