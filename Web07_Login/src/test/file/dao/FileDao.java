package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	private static FileDao dao;
	private FileDao() {}
	public static FileDao getInstance() {
		if(dao==null) {
			dao = new FileDao();
		}
		return dao;
	}
	
	//파일 목록을 리턴해주는 메소드
	public List<FileDto> getList(FileDto dto){
	      //파일 목록을 담을 Array객체 생성
	      List<FileDto> list = new ArrayList<>();
	      //필요한 객체의 참조값을 담을 지역변수 만들기 
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         //Connection 객체의 참조값 얻어오기 
	         conn = new DbcpBean().getConn();
	         //실행할 sql 문 준비하기
	         String sql = "select * "
	               + " from"
	               + "    (select result1.*, rownum as rnum"
	               + "    from (select num, writer, title, orgFileName, fileSize, regdate"
	               + "           from board_file order by num desc)"
	               + "    result1)"
	               + " where rnum between ? and ?";
	   
	         pstmt = conn.prepareStatement(sql);
	         //sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
	         pstmt.setInt(1, dto.getStartRowNum());
	         pstmt.setInt(2, dto.getEndRowNum());
	         //select 문 수행하고 결과 받아오기 
	         rs = pstmt.executeQuery();
	         //반복문 돌면서 결과 값 추출하기 
	         while (rs.next()) {
	            FileDto tmp = new FileDto();
	            tmp.setNum(rs.getInt("num"));
	            tmp.setWriter(rs.getString("writer"));
	            tmp.setTitle(rs.getString("title"));
	            tmp.setOrgFileName(rs.getString("orgFileName"));
	            tmp.setFileSize(rs.getLong("fileSize"));
	            tmp.setRegdate(rs.getString("regdate"));
	            list.add(tmp);
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
	
	
	//파일 목록을 리턴해주는 메소드
		public List<FileDto> getListTF(FileDto dto){
		      //파일 목록을 담을 Array객체 생성
		      List<FileDto> list = new ArrayList<>();
		      //필요한 객체의 참조값을 담을 지역변수 만들기 
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      try {
		         //Connection 객체의 참조값 얻어오기 
		         conn = new DbcpBean().getConn();
		         //실행할 sql 문 준비하기
		         String sql = "select * "
		               + " from"
		               + "    (select result1.*, rownum as rnum"
		               + "    from (select num, writer, title, orgFileName, fileSize, regdate"
		               + "          from board_file "
		               + "          where title like '%'||?||'%' or orgfilename like '%'||?||'%' "
		               + "          order by num desc)"
		               + "    result1)"
		               + " where rnum between ? and ?";
		   
		         pstmt = conn.prepareStatement(sql);
		         //sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
		         pstmt.setString(1, dto.getTitle());
		         pstmt.setString(2, dto.getOrgFileName());
		         pstmt.setInt(3, dto.getStartRowNum());
		         pstmt.setInt(4, dto.getEndRowNum());
		         //select 문 수행하고 결과 받아오기 
		         rs = pstmt.executeQuery();
		         //반복문 돌면서 결과 값 추출하기 
		         while (rs.next()) {
		            FileDto tmp = new FileDto();
		            tmp.setNum(rs.getInt("num"));
		            tmp.setWriter(rs.getString("writer"));
		            tmp.setTitle(rs.getString("title"));
		            tmp.setOrgFileName(rs.getString("orgFileName"));
		            tmp.setFileSize(rs.getLong("fileSize"));
		            tmp.setRegdate(rs.getString("regdate"));
		            list.add(tmp);
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
		

		//파일 목록을 리턴해주는 메소드
			public List<FileDto> getListT(FileDto dto){
			      //파일 목록을 담을 Array객체 생성
			      List<FileDto> list = new ArrayList<>();
			      //필요한 객체의 참조값을 담을 지역변수 만들기 
			      Connection conn = null;
			      PreparedStatement pstmt = null;
			      ResultSet rs = null;
			      try {
			         //Connection 객체의 참조값 얻어오기 
			         conn = new DbcpBean().getConn();
			         //실행할 sql 문 준비하기
			         String sql = "select * "
				               + " from"
				               + "    (select result1.*, rownum as rnum"
				               + "    from (select num, writer, title, orgFileName, fileSize, regdate"
				               + "          from board_file "
				               + "          where title like '%'||?||'%' "
				               + "          order by num desc)"
				               + "    result1)"
				               + " where rnum between ? and ?";
			   
			         pstmt = conn.prepareStatement(sql);
			         //sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			         pstmt.setString(1, dto.getTitle());
			         pstmt.setInt(2, dto.getStartRowNum());
			         pstmt.setInt(3, dto.getEndRowNum());
			         //select 문 수행하고 결과 받아오기 
			         rs = pstmt.executeQuery();
			         //반복문 돌면서 결과 값 추출하기 
			         while (rs.next()) {
			            FileDto tmp = new FileDto();
			            tmp.setNum(rs.getInt("num"));
			            tmp.setWriter(rs.getString("writer"));
			            tmp.setTitle(rs.getString("title"));
			            tmp.setOrgFileName(rs.getString("orgFileName"));
			            tmp.setFileSize(rs.getLong("fileSize"));
			            tmp.setRegdate(rs.getString("regdate"));
			            list.add(tmp);
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
			
			//파일 목록을 리턴해주는 메소드
			public List<FileDto> getListW(FileDto dto){
			      //파일 목록을 담을 Array객체 생성
			      List<FileDto> list = new ArrayList<>();
			      //필요한 객체의 참조값을 담을 지역변수 만들기 
			      Connection conn = null;
			      PreparedStatement pstmt = null;
			      ResultSet rs = null;
			      try {
			         //Connection 객체의 참조값 얻어오기 
			         conn = new DbcpBean().getConn();
			         //실행할 sql 문 준비하기
			         String sql = "select * "
				               + " from"
				               + "    (select result1.*, rownum as rnum"
				               + "    from (select num, writer, title, orgFileName, fileSize, regdate"
				               + "          from board_file "
				               + "          where writer like '%'||?||'%' "
				               + "          order by num desc)"
				               + "    result1)"
				               + " where rnum between ? and ?";
			   
			         pstmt = conn.prepareStatement(sql);
			         //sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			         pstmt.setString(1, dto.getWriter());
			         pstmt.setInt(2, dto.getStartRowNum());
			         pstmt.setInt(3, dto.getEndRowNum());
			         //select 문 수행하고 결과 받아오기 
			         rs = pstmt.executeQuery();
			         //반복문 돌면서 결과 값 추출하기 
			         while (rs.next()) {
			            FileDto tmp = new FileDto();
			            tmp.setNum(rs.getInt("num"));
			            tmp.setWriter(rs.getString("writer"));
			            tmp.setTitle(rs.getString("title"));
			            tmp.setOrgFileName(rs.getString("orgFileName"));
			            tmp.setFileSize(rs.getLong("fileSize"));
			            tmp.setRegdate(rs.getString("regdate"));
			            list.add(tmp);
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
	
	//파일 정보를 DB에 저장하는 메소드
	public boolean insert(FileDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = " insert into board_file "
					+ " (num, writer, title, orgFileName, saveFileName, fileSize, regdate) "
					+ " values(board_file_seq.nextval, ?, ?, ?, ?, ?, sysdate) ";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setLong(5, dto.getFileSize());
			
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
	
	//인자로 전달되는 파일 번호에 해당하는 파일 정보를 리턴하는 메소드
	public FileDto getData(int num) {
		
		FileDto dto = null;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = " select * from board_file "
					+ " where num = ? ";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setInt(1, num);
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new FileDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgfilename"));
				dto.setSaveFileName(rs.getString("savefilename"));
				dto.setFileSize(rs.getLong("filesize"));
				dto.setRegdate(rs.getString("regdate"));
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
		return dto;
	}
	
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기 
			String sql = " delete from board_file "
					+ " where num = ? ";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setInt(1, num);
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
	
	//전체 row의 갯수를 리턴해주는 메소드
	public int getCount() {
		//전체 row의 갯수를 리턴해주는 메소드
		int count=0;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//rownum 중에서 가장 큰 숫자를 얻어오면 전체 row의 갯수가 된다.
			//혹시 row가 하나도 없으면 null이 얻어와지기 때문에 null인 경우 0으로 바꿔주어야함.
			//실행할 sql 문 준비하기
			String sql = " select max(rownum) as num "
					+ " from board_file ";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 

			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				count=rs.getInt("num");
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
		return count;
	}
	
	//제목 파일명 검색결과 row의 갯수를 리턴해주는 메소드
	public int getCountTF(FileDto dto) {
		//전체 row의 갯수를 리턴해주는 메소드
		int count=0;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//rownum 중에서 가장 큰 숫자를 얻어오면 전체 row의 갯수가 된다.
			//혹시 row가 하나도 없으면 null이 얻어와지기 때문에 null인 경우 0으로 바꿔주어야함.
			//실행할 sql 문 준비하기
			String sql = " select max(rownum) as num "
					+ " from board_file "
					+ " where title like '%'||?||'%' or orgfilename like '%'||?||'%' ";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getOrgFileName());
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				count=rs.getInt("num");
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
		return count;
	}
	
	//제목 파일명 검색결과 row의 갯수를 리턴해주는 메소드
	public int getCountT(FileDto dto) {
		//전체 row의 갯수를 리턴해주는 메소드
		int count=0;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//rownum 중에서 가장 큰 숫자를 얻어오면 전체 row의 갯수가 된다.
			//혹시 row가 하나도 없으면 null이 얻어와지기 때문에 null인 경우 0으로 바꿔주어야함.
			//실행할 sql 문 준비하기
			String sql = " select max(rownum) as num "
					+ " from board_file "
					+ " where title like '%'||?||'%' ";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, dto.getTitle());
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				count=rs.getInt("num");
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
		return count;
	}
	
	
	//제목 파일명 검색결과 row의 갯수를 리턴해주는 메소드
	public int getCountW(FileDto dto) {
		//전체 row의 갯수를 리턴해주는 메소드
		int count=0;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//rownum 중에서 가장 큰 숫자를 얻어오면 전체 row의 갯수가 된다.
			//혹시 row가 하나도 없으면 null이 얻어와지기 때문에 null인 경우 0으로 바꿔주어야함.
			//실행할 sql 문 준비하기
			String sql = " select max(rownum) as num "
					+ " from board_file "
					+ " where writer like '%'||?||'%' ";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
			pstmt.setString(1, dto.getWriter());
			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			if (rs.next()) {
				count=rs.getInt("num");
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
		return count;
	}
}
