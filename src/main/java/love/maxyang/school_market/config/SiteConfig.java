package love.maxyang.school_market.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * 网站基础信息配置类
 * @author MaxYang
 *
 */
@Component
@PropertySource(value="classpath:site.properties")
public class SiteConfig {
	
	@Value("${market.site.name}")
	private String siteName;
	@Value("${market.site.url}")
	private String siteUrl;
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	public String getSiteUrl() {
		return siteUrl;
	}
	public void setSiteUrl(String siteUrl) {
		this.siteUrl = siteUrl;
	}
	
	
}
