package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentcarDAO {
	Connection c;
	PreparedStatement p;
	 ResultSet r;
	 
	 public void getC() {
		 try {
			Context i = new InitialContext();
			Context e= (Context) i.lookup("java:comp/env");
			DataSource ds= (DataSource) e.lookup("jdbc/pool");
			c=ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	 }
	 public Vector<CarListBean> getSelectCar() {
		 Vector<CarListBean> v = new Vector<>();
		 getC();
		 
		 try {
			 String sql="select * from rentcar order by num desc";
			 p=c.prepareStatement(sql);
			 r=p.executeQuery();
			 int count=0;
			 while(r.next()) {
				 CarListBean bean = new CarListBean();
				 bean.setNum(r.getInt(1));
				 bean.setName(r.getString(2));
				 bean.setCategory(r.getInt(3));
				 bean.setPrice(r.getInt(4));
				 bean.setUsepeople(r.getInt(5));
				 bean.setCompany(r.getString(6));
				 bean.setImg(r.getString(7));
				 bean.setInfo(r.getString(8));
				 v.add(bean);
				 count++;
				 if(count>=3) {
					 break;
				 }
			 }
			 c.close();
		 }
		 catch(Exception e) {
			 e.printStackTrace();
		 }
		 return v;
	 }
	 // 카테고리별 자동차 리스트 저장
	 public Vector<CarListBean> getCategory(int category){
		 Vector<CarListBean> v =new Vector<>();
		 CarListBean bean=null;
		 getC();
		 try {
			 String sql="select * from rentcar where category=?";
			 p=c.prepareStatement(sql);
			 p.setInt(1, category);
			 r=p.executeQuery();
			 while(r.next()) {
				 bean = new CarListBean();
				 bean.setNum(r.getInt(1));
				 bean.setName(r.getString(2));
				 bean.setCategory(r.getInt(3));
				 bean.setPrice(r.getInt(4));
				 bean.setUsepeople(r.getInt(5));
				 bean.setCompany(r.getString(6));
				 bean.setImg(r.getString(7));
				 bean.setInfo(r.getString(8));
				 v.add(bean);
				}
			 c.close();
			 
		 }
		 catch(Exception e) {
			 e.printStackTrace();
		 }
		 return v;
	 }
	 public Vector<CarListBean> getAllCar(){
		 Vector<CarListBean> v = new Vector<>();
		 getC();
		 try {
			 String sql="select * from rentcar";
			 p=c.prepareStatement(sql);
			 r=p.executeQuery();
			 while(r.next()) {
				 CarListBean bean = new CarListBean();
				 bean.setNum(r.getInt(1));
				 bean.setName(r.getString(2));
				 bean.setCategory(r.getInt(3));
				 bean.setPrice(r.getInt(4));
				 bean.setUsepeople(r.getInt(5));
				 bean.setCompany(r.getString(6));
				 bean.setImg(r.getString(7));
				 bean.setInfo(r.getString(8));
				 v.add(bean);
				}
			 c.close();
			 
		 }
		 catch(Exception e) {
			 e.printStackTrace();
		 }
		 return v;
	 }
	 public CarListBean getOneCar(int num) {
		 CarListBean bean= new CarListBean();
		 getC();
		 try {
			 String sql="select * from rentcar where num=?";
			 p=c.prepareStatement(sql);
			 p.setInt(1, num);
			 r=p.executeQuery();
			 if(r.next()) {
				 bean.setNum(r.getInt(1));
				 bean.setName(r.getString(2));
				 bean.setCategory(r.getInt(3));
				 bean.setPrice(r.getInt(4));
				 bean.setUsepeople(r.getInt(5));
				 bean.setCompany(r.getString(6));
				 bean.setImg(r.getString(7));
				 bean.setInfo(r.getString(8));
				}
			 c.close();
			 
		 }
		 catch(Exception e) {
			 e.printStackTrace();
		 }
		 return bean;
	 }
	 //회원 정보가 있는지 비교
	 public int getMember(String id,String password) {
		 int result=0;
		 getC();
		 try {
			String sql="select count(*) from member where id=? and pass1=?"; 
			p=c.prepareStatement(sql);
			p.setString(1, id);
			p.setString(2, password);
			r=p.executeQuery();
			if(r.next()) {
				result=r.getInt(1);
			}
			c.close();
		 }
		 catch(Exception e) {
			 e.printStackTrace();
		 }
		 return result;
	 }
	 // 하나의 예약 정보를 저장하는 메소드
	 public void setReserveCar(CarReserveBean bean) {
		 getC();
		 try {
			 String sql="insert into carreserve values(reserve_seq.NEXTVAL,?,?,?,?,?,?,?,?,?)";
			 p=c.prepareStatement(sql);;
			 p.setInt(1, bean.getNum());
			 p.setString(2, bean.getId());
			 p.setInt(3, bean.getQty());
			 p.setInt(4, bean.getDday());
			 p.setString(5, bean.getRday());
			 p.setInt(6, bean.getUsein());
			 p.setInt(7, bean.getUsewifi());
			 p.setInt(8, bean.getUseseat());
			 p.setInt(9, bean.getUsenavi());
			 p.executeUpdate();
			 c.close();
		 }
		 catch(Exception e) {
			 e.printStackTrace();
		 }
	 }
	 public Vector<CarVeiwBean> getAllReserve(String id){
		 Vector<CarVeiwBean> v=new Vector<>();
		 getC();
		 try {
			 String sql="select * from rentcar natural join carreserve where sysdate<to_date(rday,'YYYY-MM-DD') and id=?";
			 p=c.prepareStatement(sql);
			 p.setString(1, id);
			 r=p.executeQuery();
			 while(r.next()) {
				 CarVeiwBean bean= new CarVeiwBean();
				 bean.setName(r.getString(2));
				 bean.setPrice(r.getInt(4));
				 bean.setImg(r.getString(7));
				 bean.setReservenum(r.getInt(9));
				 bean.setQty(r.getInt(11));
				 bean.setDday(r.getInt(12));
				 bean.setRday(r.getString(13));
				 bean.setUsein(r.getInt(14));
				 bean.setUsewifi(r.getInt(15));
				 bean.setUseseat(r.getInt(16));
				 bean.setUsenavi(r.getInt(17));
				 v.add(bean);
			 }
			 c.close();
		 }
		 catch(Exception e) {
			 
		 }
		 return v;
	 }
	 public void DeleteCar(int num) {
		 getC();
		 try {
			 String sql="delete from carreserve where reservenum=?";
			 p=c.prepareStatement(sql);
			 p.setInt(1, num);
			 p.executeUpdate();
			 c.close();
		 }
		 catch(Exception e) {
			 e.printStackTrace();
		 }
	 }
}
