package love.maxyang.school_market.dao.admin;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import love.maxyang.school_market.entity.admin.User;

/**
 * 用户数据库处理层
 * @author MaxYang
 *
 */
@Repository
public interface UserDao extends JpaRepository<User, Long>{
	
	/**
	 * 按照用户名查找用户信息
	 * @param username
	 * @return
	 */
	public User findByUsername(String username);

	/**
	 * 根据用户id查询
	 * @param id
	 * @return
	 */
	@Query("select u from User u where id = :id")
	public User find(@Param("id")Long id);
	
}
