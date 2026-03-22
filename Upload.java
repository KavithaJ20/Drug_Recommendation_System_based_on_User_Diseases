/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.PreparedStatement;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

/**
 *
 * @author DLK
 */
public class Upload extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter(); 
        {
            ServletContext sc=request.getSession().getServletContext();
            MultipartRequest mm=new MultipartRequest(request,sc.getRealPath("aa"));
            File file=mm.getFile("file");
            String fname=file.getName();
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/drug","root","root");
            con.setAutoCommit(false);
            PreparedStatement pstm = null ;
            FileInputStream input = new FileInputStream(file);
            POIFSFileSystem fs = new POIFSFileSystem( input );
            HSSFWorkbook wb = new HSSFWorkbook(fs);
            HSSFSheet sheet = wb.getSheetAt(0);
            HSSFRow row;
                 PreparedStatement paa= con.prepareStatement("truncate table dataset");
    paa.executeUpdate();
            for(int ii=1; ii<=sheet.getLastRowNum(); ii++)
            {
                row = sheet.getRow(ii);                
                String a = (row.getCell(0).getStringCellValue()).replaceAll("'", "");
                String b = (row.getCell(1).getStringCellValue()).replaceAll("'", "");
                String c = (row.getCell(2).getStringCellValue()).replaceAll("'", "");
                String d = (row.getCell(3).getStringCellValue()).replaceAll("'", "");
                String e = (row.getCell(4).getStringCellValue()).replaceAll("'", "");
                String f = (row.getCell(5).getStringCellValue()).replaceAll("'", "");
                String g = (row.getCell(6).getStringCellValue()).replaceAll("'", "");
                String h = (row.getCell(7).getStringCellValue()).replaceAll("'", "");
                String i = (row.getCell(8).getStringCellValue()).replaceAll("'", "");
                String j = (row.getCell(9).getStringCellValue()).replaceAll("'", "");
                String k = (row.getCell(10).getStringCellValue()).replaceAll("'", "");
                String l = (row.getCell(11).getStringCellValue()).replaceAll("'", "");
                String m = (row.getCell(12).getStringCellValue()).replaceAll("'", "");
                String n = (row.getCell(13).getStringCellValue()).replaceAll("'", "");
                String o = (row.getCell(14).getStringCellValue()).replaceAll("'", "");                
                String p = (row.getCell(15).getStringCellValue()).replaceAll("'", "");
                String sql = "INSERT INTO dataset (reaction,medicalproduct,drugindication,manufacturer,type,route,genericname,brandname,pcs,pepc,substance,moa,drugdosage,sex,country,sideeff) VALUES('"+a+"','"+b+"','"+c+"','"+d+"','"+e+"','"+f+"','"+g+"','"+h+"','"+i+"','"+j+"','"+k+"','"+l+"','"+m+"','"+n+"','"+o+"','"+p+"')";
                pstm = (PreparedStatement) con.prepareStatement(sql);
                pstm.execute();
                System.out.println("Import rows "+ii);
                con.commit();
                pstm.close();
            }
            con.close();
            input.close();
            System.out.println("Success import excel to mysql table");
            out.println("<script>"
                        +"alert('Uploaded Successfully')"
                        +"</script>");            
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.include(request, response); 
        }catch(Exception e)
        {
            System.out.println(e);
        }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
