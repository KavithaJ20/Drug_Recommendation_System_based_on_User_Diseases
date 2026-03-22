/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DLK
 */
public class KmeansCalculate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    static List<List<DataContainer>> cluster;
    static double mean[];
    static double prev_mean[];
    static String allval = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String produ = "";
            int count = 0;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/drug", "root", "root");
            PreparedStatement ps1 = con.prepareStatement("truncate table kmeans");
            ps1.executeUpdate();
            String Query22 = "SELECT medicalproduct,manufacturer,reaction,drugindication,COUNT(*) TotalCount FROM dataset GROUP BY medicalproduct";
            PreparedStatement ps22 = con.prepareStatement(Query22);
            ResultSet rs22 = ps22.executeQuery();
            while (rs22.next()) {
                produ = rs22.getString("medicalproduct");
                count = rs22.getInt("TotalCount");
                PreparedStatement ps = con.prepareStatement("insert into kmeans (product,count) values ('" + produ + "','" + count + "') ");
                ps.executeUpdate();
            }

        } catch (Exception e) {
            System.out.println(e);
        }

    //-----------------------started--------------------//
        //Scanner scan = new Scanner(System.in);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection con = null;
        Statement s = null;
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost/drug", "root", "root");
            s = con.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
            System.exit(0);
        }
        ResultSet rs = null;
        String query = "SELECT id, count, product FROM kmeans where COUNT > 2";
        List<DataContainer> data = new LinkedList<>();
        try {
            rs = s.executeQuery(query);
            while (rs.next()) {
                DataContainer dc = new DataContainer();
                dc.key = Integer.parseInt(rs.getString(1));
                dc.value = Integer.parseInt(rs.getString(2));
                dc.name = rs.getString(3);
                data.add(dc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("Enter the number of clusters:");
        int k = 3;
        mean = new double[k];
        prev_mean = new double[k];
        cluster = new LinkedList<>();
        for (int i = 0; i < k; i++) {
            cluster.add(new LinkedList<DataContainer>());
            mean[i] = (double) data.get(i).value;
        }

        System.out.println("Initial Mean Values:");
        allval += "Initial Mean Values: <br/><br/>";
        for (double i : mean) {
            System.out.println(i);
            allval += i + " <br/>";
        }
        System.out.println("+++ START OF CLUSTERING +++\n\n");
        allval += "<br/>+++ START OF CLUSTERING +++<br/>";
        int iter = 0;
        do {
            iter++;
            System.out.println("\nITERATION " + iter + "\n");
            allval += "<br/>ITERATION " + iter + "";
            System.arraycopy(mean, 0, prev_mean, 0, mean.length);
            for (List<DataContainer> i : cluster) {
                i.clear();
            }
            for (DataContainer i : data) {
                cluster.get(getListNumber(i.value)).add(i);
            }
            calculateNewMeans();
            displayClusters();
        } while (!equalMeans());
        System.out.println("\n\n+++ FINAL ANSWER +++");
        allval += "<br/>+++ FINAL ANSWER +++ <br/><br/>";
        int listno = 0;
        for (List<DataContainer> l1 : cluster) {
            System.out.println("Cluster no.: " + (listno + 1));
            allval += "Cluster no.: " + (listno + 1) + "<br/>";
            System.out.print("{ ");
            allval += "{ ";
            for (DataContainer i : l1) {
                System.out.print(i.name + ", ");
                allval += i.name + ", ";
            }
            System.out.println("}");
            allval += "} <br/><br/>";
            listno++;
        }
        System.out.println("Final...");
        HttpSession session = request.getSession();
        session.setAttribute("result", allval);
        out.println("<script>"
                + "alert('K-Means Result')"
                + "</script>");
        RequestDispatcher rd = request.getRequestDispatcher("kmeans.jsp");
        rd.include(request, response);

    //-----------------------ended----------------------//
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

    class DataContainer {

        int key, value;
        String name;
    }

    static int getListNumber(int element) {
		// Here we calculate the Euclidean distance of 'element' from all 
        // values in 'mean' array.
        double least_dist = Double.MAX_VALUE;
        double new_dist = 0;
        int listno = 0;
        for (int i = 0; i < mean.length; i++) {
            new_dist = Math.abs(mean[i] - ((double) element));
            if (new_dist < least_dist) {
                least_dist = new_dist;
                listno = i;
            }
        }
        return listno;
    }

    static void calculateNewMeans() {
		// Here we update the 'mean' array to reflect the changes in the
        // clusters.
        int ctr = 0;
        for (List<DataContainer> l : cluster) {
            mean[ctr] = 0;
            for (DataContainer i : l) {
                mean[ctr] += i.value;
            }
            mean[ctr] /= l.size();
            ctr++;
        }
    }

    static boolean equalMeans() {
		// Here we compare the 'prev_mean' and 'mean' arrays to see if they
        // are equal or not.
        int j = 0;
        for (double i : mean) {
            if (prev_mean[j] != i) {
                return false;
            }
            j++;
        }
        return true;
    }

    static void displayClusters() {
        int listno = 0;
        for (List<DataContainer> l1 : cluster) {
            System.out.println("Cluster no.: " + (listno + 1));
            allval += "<br/>Cluster no.: " + (listno + 1) + " <br/>";
            System.out.print("{ ");
            allval += "{ ";
            for (DataContainer i : l1) {
                System.out.print(i.value + " ");
                allval += i.value + " ";
            }
            System.out.println("}");
            allval += "} <br/>";
            System.out.println("--- Cluster Mean = " + mean[listno] + " ---");
            allval += "--- Cluster Mean = " + mean[listno] + " --- <br/>";
            listno++;
        }
    }

}
