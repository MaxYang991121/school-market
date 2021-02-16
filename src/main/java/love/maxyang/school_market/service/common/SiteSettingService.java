package love.maxyang.school_market.service.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import love.maxyang.school_market.dao.common.SiteSettingDao;
import love.maxyang.school_market.entity.common.SiteSetting;

/**
 * 网站设置service
 * @author MaxYang
 *
 */
@Service
public class SiteSettingService {

	@Autowired
	private SiteSettingDao siteSettingDao;
	
	/**
	 * 新闻信息添加/修改（id不为空则为修改）
	 * @param siteSetting
	 * @return
	 */
	public SiteSetting save(SiteSetting siteSetting){
		return siteSettingDao.save(siteSetting);
	}
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public SiteSetting find(){
		return siteSettingDao.find();
	}
	
}
