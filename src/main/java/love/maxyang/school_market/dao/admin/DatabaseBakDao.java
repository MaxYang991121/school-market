package love.maxyang.school_market.dao.admin;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import love.maxyang.school_market.entity.admin.DatabaseBak;

/**
 * 数据库备份处理层
 * @author MaxYang
 *
 */
@Repository
public interface DatabaseBakDao extends JpaRepository<DatabaseBak, Long>{

	/**
	 * 根据id来查询
	 * @param id
	 * @return
	 */
	@Query("select db from DatabaseBak db where id = :id")
	DatabaseBak find(@Param("id")Long id);
	
	
}
