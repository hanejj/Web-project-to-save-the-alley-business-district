package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {

	private Connection conn; //
	private ResultSet rs; // DB data�� ���� �� �ִ� ��ü (Ctrl + shift + 'o') -> auto importprivate Connection conn;            // DB�� �����ϴ� ��ü
    
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "daisy9656";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1; // ��й�ȣ ����ġ
			}
			return 1; // ID�� ����

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB ����

	}

	//��� ��
	public int write(String bbsTitle, String bbsContent, String bbsAddress, String bbsNumber, String userID, String bbsHashtag, String bbsDivide, int file_number) {
		String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, bbsContent);
			pstmt.setString(4, bbsAddress);
			pstmt.setString(5, bbsNumber);
			pstmt.setInt(6, 1);
			pstmt.setString(7, userID);
			pstmt.setString(8, bbsHashtag);
			pstmt.setString(9, bbsDivide);
			pstmt.setInt(10, file_number); // �� �Ƹ� ���⼭ ��������

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����

	}

	public ArrayList<Bbs> getList(int pageNumber, String bbsDivide) {

		ArrayList<Bbs> list = new ArrayList<Bbs>();
		
		if(bbsDivide.equals("��ü")) {
			bbsDivide = "";
		}
		String SQL = "";
		
		try {
			
			SQL = "SELECT * FROM BBS WHERE bbsDivide LIKE ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + bbsDivide + "%");
			rs = pstmt.executeQuery();

			while (rs.next()) {

				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setBbsContent(rs.getString(3));
				bbs.setBbsAddress(rs.getString(4));
				bbs.setBbsNumber(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setUserID(rs.getString(7));
				bbs.setBbsHashtag(rs.getString(8));
				bbs.setBbsDivide(rs.getString(9));

				list.add(bbs);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public boolean nextPage(int pageNumber) {

		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	

	public Bbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setBbsContent(rs.getString(3));
				bbs.setBbsAddress(rs.getString(4));
				bbs.setBbsNumber(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setUserID(rs.getString(7));
				bbs.setBbsHashtag(rs.getString(8));
				bbs.setBbsDivide(rs.getString(9));
				bbs.setFile_number(rs.getInt(10));

				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
	//���� �Լ�

		public int update(int bbsID, String bbsTitle, String bbsContent, String bbsAddress, String bbsNumber, String bbsHashtag, String bbsDivide, int file_number) {
				String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ?,  bbsAddress = ?, bbsNumber = ?, bbsHashtag = ?, bbsDivide = ? WHERE bbsID = ? AND file_number = ?";
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setString(1, bbsTitle);
					pstmt.setString(2, bbsContent);
					pstmt.setString(3, bbsAddress);
					pstmt.setString(4, bbsNumber);
					pstmt.setString(5, bbsHashtag);
					pstmt.setString(6, bbsDivide);
					pstmt.setInt(7, bbsID);
					pstmt.setInt(8, file_number);
					return pstmt.executeUpdate();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				return -1; // �����ͺ��̽� ����
			}
		
		//���� �Լ�
		public int delete(int bbsID) {
			String SQL = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);   
				pstmt.setInt(1, bbsID);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; // �����ͺ��̽� ����
		}

}
