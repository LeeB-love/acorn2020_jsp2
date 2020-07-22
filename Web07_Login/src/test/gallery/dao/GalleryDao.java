package test.gallery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.gallery.dto.GalleryDto;
import test.util.DbcpBean;

public class GalleryDao {
	private static GalleryDao dao = null;
	private GalleryDao() {}
	public static GalleryDao getInstance(){
		if(dao==null) {
			dao=new GalleryDao();
		}
		return dao;
	}
	
	public boolean insert(GalleryDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = " insert into board_gallery "
					+ " (num, writer, caption, imagePath, regdate) "
					+ " values(board_gallery_seq.nextval, ?, ?, ?, sysdate) ";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getCaption());
			pstmt.setString(3, dto.getImagePath());
			//sql  문 수행하고 update or insert or delete 된 row 의 갯수 리턴받기 
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	public List<GalleryDto> getList(){
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		List<GalleryDto> list= new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = " select * from board_gallery "
					+ " order by num desc ";
			pstmt = conn.prepareStatement(sql);
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			while (rs.next()) {
				GalleryDto dto = new GalleryDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setCaption(rs.getString("caption"));
				dto.setImagePath(rs.getString("imagePath"));
				dto.setRegdate(rs.getString("regdate"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
}
