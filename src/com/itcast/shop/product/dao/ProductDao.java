package com.itcast.shop.product.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.itcast.shop.product.vo.Product;
import com.itcast.shop.utils.PageHibernateCallback;

public class ProductDao extends HibernateDaoSupport {

	@SuppressWarnings("unchecked")
	public List<Product> findHot() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
		criteria.add(Restrictions.eq("is_hot", 1));
		// 倒序输出
		criteria.addOrder(Order.desc("pdate"));
		List<Product> list = this.getHibernateTemplate().findByCriteria(
				criteria, 0, 10);
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<Product> findNew() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
		// 倒序输出
		criteria.addOrder(Order.desc("pdate"));
		List<Product> list = this.getHibernateTemplate().findByCriteria(
				criteria, 0, 10);
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	public Product findByPid(Integer pid) {
		return this.getHibernateTemplate().get(Product.class, pid);
	}

	/**
	 * 模糊查询
	 */
	@SuppressWarnings("unchecked")
	public int searchCountByPname(String pname) {
		String hql = "select count(*) from Product where pname like ?";
		StringBuffer keyword = new StringBuffer("%");
		char[] arr = pname.toCharArray();
		for (char c : arr) {
			keyword.append(c).append("%");
		}
		List<Long> list = this.getHibernateTemplate().find(hql,keyword.toString());
//		List<Long> list = this.getHibernateTemplate().find(hql,
//				"%" + pname + "%");
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Product> searchByPagePname(String pname, int begin, int limit) {
		String hql = "from Product where pname like ?";
		StringBuffer keyword = new StringBuffer("%");
		char[] arr = pname.toCharArray();
		for (char c : arr) {
			keyword.append(c).append("%");
		}
		List<Product> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Product>(hql, new Object[] { keyword.toString() }, begin, limit));
//		List<Product> list = this.getHibernateTemplate().execute(
//				new PageHibernateCallback<Product>(hql, new Object[] { "%"
//						+ pname + "%" }, begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public int findCountCid(Integer cid) {
		String hql = "select count(*) from Product p where p.categorySecond.category.cid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, cid);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Product> findPageCid(Integer cid, int begin, int limit) {
		String hql = "select p from Product p join p.categorySecond cs join cs.category c where c.cid = ?";
		List<Product> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Product>(hql, new Object[] { cid },
						begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public int findCountCsid(Integer csid) {
		String hql = "select count(*) from Product p where p.categorySecond.csid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, csid);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Product> findPageCsid(Integer csid, int begin, int limit) {
		String hql = "select p from Product p join p.categorySecond cs where cs.csid = ?";
		List<Product> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Product>(hql, new Object[] { csid },
						begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public int findCount() {
		String hql = "select count(*) from Product";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Product> findAllByPage(int begin, int limit) {
		String hql = "from Product order by pdate desc";
		List<Product> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<Product>(hql, null, begin, limit));
		if (list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	public void save(Product product) {
		this.getHibernateTemplate().save(product);
	}

	public void delete(Product product) {
		this.getHibernateTemplate().delete(product);
	}

	public void update(Product product) {
		this.getHibernateTemplate().update(product);
	}

	public static void main(String[] args) {
		ProductDao pd = new ProductDao();
		/*
		 * int i = pd.findCountByPname("修身长袖淑女"); System.out.println(i);
		 */
		System.out.println(pd.findNew());
	}
}
