<%@page import="kr.or.ddit.Util.dao.Member1Dao"%>
<%@page import="org.json.simple.JSONArray"%>

<%@ page language="java" contentType="application/json; charset=UTF-8"

pageEncoding="UTF-8"%>

<%
Member1Dao memberDao = Member1Dao.getInstance();
JSONArray jsonArray = memberDao.getCountAddress();
%>

<%= jsonArray %>