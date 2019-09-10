package com.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> map = new HashMap<String, Object>(); 
       
	@Override
	public void init(ServletConfig config) throws ServletException {
		String propertyConfig = config.getInitParameter("propertyConfig"); //프로퍼티즈 내용을 읽는다.
		System.out.println("propertyConfig = "+propertyConfig+"\n");
		
		FileInputStream fin = null;
		Properties properties = new Properties();
		
		try {
			fin = new FileInputStream(propertyConfig);
			properties.load(fin);
			System.out.println("properties = "+properties);
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				fin.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println();
		
		Iterator it = properties.keySet().iterator();
		while(it.hasNext()) {
			String key = (String)it.next();
			System.out.println("key = "+key);
			
			String className = properties.getProperty(key);
			System.out.println("className = "+className);
			
			try {
				//Class classType = Class.forName(className);
				//Object ob = classType.newInstance(); - @Deprecated

				//Class<?> classType = Class.forName(className);
				//Object ob = classType.getDeclaredConstructor().newInstance();

				Class<?> classType = Class.forName(className);
				Object ob = classType.newInstance();
				
				System.out.println("ob = "+ob);
				
				map.put(key, ob);
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} 
			//catch (InvocationTargetException e) {
			//	e.printStackTrace();
			//} catch (NoSuchMethodException e) {
			//	e.printStackTrace();
			//} catch (SecurityException e) {
			//	e.printStackTrace();
			//}
			
			System.out.println();
		}//while
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	//doget,dopost 하는일이 똑같기에 한곳으로모은다.
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println();
		
		//
		if(request.getMethod().equals("POST")){
			request.setCharacterEncoding("UTF-8");
		}
		
		//http://localhost:8080/miniproject/main/index.do 
		String category = request.getServletPath(); // /board/writeForm.do이만큼을 잘라온다
		System.out.println("category = "+category);
		
		CommandProcess commandProcess = (CommandProcess)map.get(category);
		System.out.println("commandProcess = "+commandProcess);
		
		String view = null;
		try {
			view = commandProcess.requestPro(request, response); //보모가 자식클래스 요청(jsp 파일을 가져온다)
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		//forward	
		RequestDispatcher dispatcher = request.getRequestDispatcher(view); //.jsp 파일을 포워드
		dispatcher.forward(request, response);//
		
	}

}
