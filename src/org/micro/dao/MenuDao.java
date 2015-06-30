package org.micro.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.micro.util.QryException;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDao extends BaseDao {

	public List<Map<String,String>> getMainMenu() throws QryException
	{
		String query = "select * from micro_menu where parent_menu_id = 0 and sts = '00A'";
		return qryCenter.executeSqlByMapListWithTrans(query, new ArrayList());
	}
	
	public List<Map<String,String>> getSubMenuItem(String menuId) throws QryException
	{
		StringBuffer sb = new StringBuffer();
		sb.append("select * from micro_menu where sts = '00A' ");
		sb.append(" start with parent_menu_id = ? connect by prior menu_id = parent_menu_id order by cast(menu_id as integer)");
		ArrayList paramList = new ArrayList();
		paramList.add(menuId);
		return qryCenter.executeSqlByMapListWithTrans(sb.toString(), paramList);
	}
	
}
