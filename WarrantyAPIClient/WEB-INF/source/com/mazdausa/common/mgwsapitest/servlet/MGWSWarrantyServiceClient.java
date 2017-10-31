package com.mazdausa.common.mgwsapitest.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mazdausa.common.util.ApplicationUtil;


/**
 * Servlet implementation class MGWSWarrantyServiceClient
 */
public class MGWSWarrantyServiceClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String serviceUrl;
	
	public void init() throws ServletException {
		serviceUrl = ApplicationUtil.getSystemProperty("APPLICATION_URLS","WARRANTY_API_URL");
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MGWSWarrantyServiceClient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 URL url;
         HttpURLConnection connection = null;
         InputStream is = null;
         BufferedReader theReader = null;
         RequestDispatcher requestDispatcher; 
         String xmlResponse = "";
         StringBuffer xmlStr = new StringBuffer("");
         String vin = null;
         String key = null;
         String companyName = null;
         String appName = null;
         String outputFormat = null;
         try
         {
        	     vin = request.getParameter("vin");
        	     key = request.getParameter("apikey");        	     
        	     companyName = request.getParameter("companyName");
        	     appName = request.getParameter("appName");
        	     outputFormat = request.getParameter("output");
        	     String param = "";
        	     if(key != null) {
        	    	 param = URLEncoder.encode(key, "UTF8");
        	     }
        	     url = new URL(serviceUrl+"/"+URLEncoder.encode(vin, "UTF8")+"?api_key="+param+"&company_name="+URLEncoder.encode(companyName,"UTF8")+"&app_name="+URLEncoder.encode(appName,"UTF8"));
                 connection = (HttpURLConnection) url.openConnection();
                 connection.setRequestMethod("GET");
              
                 if(outputFormat != null && outputFormat.equals("J")){
	                 connection.setRequestProperty("Accept", "application/json");
	                 connection.setRequestProperty("Content-Type", "application/json");
                 }else{
	                 connection.setRequestProperty("Accept", "application/xml");
	                 connection.setRequestProperty("Content-Type", "application/xml");
                 }

                 connection.connect();
                 is = connection.getInputStream();
                 theReader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
                 String reply;
                 while ((reply = theReader.readLine()) != null)
                 {
                	 xmlStr.append(reply);
                	 
                 }
                 xmlResponse = xmlStr.toString();
         }
         catch (Exception e) {
                 e.printStackTrace();
         }finally{
        	 if(theReader != null){
            	 theReader.close();
            	 }
        	 if(is != null) {
        		 is.close();
        	 }
        	 request.setAttribute("xmlResponse", xmlResponse);
        	 request.setAttribute("vin", vin);
        	 request.setAttribute("apikey", key);
        	 request.setAttribute("companyName", companyName);
        	 request.setAttribute("appName", appName);
        	 requestDispatcher = request.getRequestDispatcher("result.jsp");
        	 requestDispatcher.forward(request, response);
         }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
