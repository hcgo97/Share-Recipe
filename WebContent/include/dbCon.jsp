<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<%@page import="java.sql.*"%>
<%    
//접속 URL 생성 //   @위치정보:포트번호:DB서비스이름
String url = "jdbc:oracle:thin:@//localhost:1521/orcl";
// 드라이버 연결
Class.forName("oracle.jdbc.OracleDriver");
// 접속 정보 작성
Connection con = DriverManager.getConnection(url,"scott","root");
// 접속 인스턴스 생성
Statement stmt = con.createStatement();
%>
