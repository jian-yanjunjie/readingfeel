package org.lanqiao.yhxxgl.entity;

/**
 *<pre><h4>
 * 描述：分页对象
 * Author： lsy
 * Date： 2016年4月6日
 * Version: V1.0
 * Email: lsy@lanqiao.org
 * Pos: 衡水学院
 * </h4></pre>
 */
public class Pager {
	/**每页显示的记录条数*/
	private int pageSize = 8;
	/**当前页码*/
	private int pageNo = 1;
	/**总页数*/
	private int totalPages = 0;
	
	public Pager(){}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getTotalPages() {
		return totalPages;
	}

	/**
	 * 功能描述：设置页数
	 * @param totalRows 记录行数
	 */
	public void setTotalPages(int totalRows) {
		if(totalRows % pageSize == 0){
			totalPages = totalRows / pageSize;
		}else{
			totalPages = totalRows / pageSize + 1;
		}
	}
}
