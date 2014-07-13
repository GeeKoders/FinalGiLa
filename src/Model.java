
import java.sql.*;
import java.util.*;


public class Model {

    public MyDBDriver myDBDriver;
    public Connection conn;
    public Statement stmt;
    public ResultSet rs;
    public int size;
    public String area;
    public String desMatch ; 
    public final int endNum = 100;


    //利用前端所得到的地區資料(area),利用maping table進行比對各區景點個數(size)
    public Model(String area, String desMatch) {
        if (desMatch == null || desMatch.trim().length() == 0) {
            this.area = area;
            this.desMatch="" ;
            String areaStr = "士林區,大同區,大安區,中山區,中正區,內湖區,文山區,北投區,松山區,信義區,南港區,萬華區";
            int[] areaNum = {22, 13, 11, 28, 31, 12, 11, 28, 7, 8, 6, 12};
            String[] arr = areaStr.split(",");
            for (int i = 0; i < arr.length; i++) {

                if (area.equals(arr[i])) {
                    size = areaNum[i];
                }
            }
        } else {
            int size=dataQuery(area, desMatch);
            this.size=size ; 
            this.area=area ; 
            this.desMatch=desMatch ; 
        }


    }
    //資料庫搜尋

    public void dataQuery() {
  
        try {
            myDBDriver = new MyDBDriver("MSSQL", "localhost", "1433", "GiLa", "sa", "111");
            conn = myDBDriver.getConnection();
            stmt = conn.createStatement();
            String sql = "select * from 景點檔 left join 景點照片檔 on 景點檔.景點代號=景點照片檔.景點代號 "
                    + "where 序號=1"
                    + "and 縣市='台北市'"
                    + "and 地區='"+this.area+"'" 
                    + "and 詳細說明 like '%"+this.desMatch+"%'"  ; 
                 
            rs = stmt.executeQuery(sql);
   
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int dataQuery(String area,String desMatch) {
            int size=0 ; 
        try {
            myDBDriver = new MyDBDriver("MSSQL", "localhost", "1433", "GiLa", "sa", "111");
            conn = myDBDriver.getConnection();
            stmt = conn.createStatement();
            String sql = "select * from 景點檔 left join 景點照片檔 on 景點檔.景點代號=景點照片檔.景點代號 "
                    + "where 序號=1"
                    + "and 縣市='台北市'"
                    + "and 地區='"+area+"'" 
                    + "and 詳細說明 like '%"+desMatch+"%'" ;
                   
            rs = stmt.executeQuery(sql);
            
                while (rs.next()) {
                    size++;
                }
                   //System.out.println(size) ; 
              
        } catch (Exception e) {
            e.printStackTrace();
        }
          return size ; 
    }
    //取得資料庫座標資料

    public StringBuffer coordinataeSearch() {
        StringBuffer sb = new StringBuffer();
        float[] xCod = new float[size];
        float[] yCod = new float[size];
        dataQuery();
        try {
            int count = 0;
            while (rs.next()) {
                xCod[count] = rs.getFloat("GPS緯度");
                yCod[count] = rs.getFloat("GPS經度");
                count++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (int i = 0; i < xCod.length; i++) {
            /*
             利用StringBuffer中的append方法將最後一筆資料的逗號必須取消 
             JS二維陣列格式為 var array = new Array([x1,y1],[x2,y2]...);
             */
            if (i == xCod.length - 1) {
                sb.append("[").append(xCod[i]).append(",").append(yCod[i]).append("]");
            } else {
                sb.append("[").append(xCod[i]).append(",").append(yCod[i]).append("]").append(",");
            }
        }
        return sb;
    }
    //取得資料庫景點名稱資料

    public String[] viewSearch() {
        String sbView = new String();
        String[] view = new String[size];
         String sbViewIntro = new String();
        String[] viewIntro = new String[size];
        String sbPic = new String();
        String[] pic = new String[size];

        dataQuery();
        try {
            int count = 0;
            while (rs.next()) {
                viewIntro[count] = rs.getString("簡介");
                pic[count] = rs.getString("檔名");
                view[count] = rs.getString("景點名稱");
                count++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (int i = 0; i < view.length; i++) {
            /*
             利用StringBuffer中的append方法將最後一筆資料的逗號必須取消
             */

            //景點名稱資料為粗體,顏色為藍色
            if (i == view.length - 1) {
                sbView = sbView.concat("<a class=fancybox href=images/").concat(pic[i]).concat(" title=").concat(view[i]).concat(" ><img src=images/").concat(pic[i]).concat(" width=160>").concat("<br/>").concat( view[i]).concat("</a>").concat("<br/><br/>");
            } else {
                sbView = sbView.concat("<a class=fancybox href=images/").concat(pic[i]).concat(" title=").concat(view[i]).concat(" ><img src=images/").concat(pic[i]).concat(" width=160>").concat("<br/>").concat( view[i]).concat("</a>").concat("<br/><br/>").concat(",");
            }
        }
        String sbViewArr[] = sbView.split(",");
        return sbViewArr;
    }
    //取得資料庫簡介資料

    public String[] viewIntroSearch() {
        String sbViewIntro = new String();
        String[] viewIntro = new String[size];
        String sbPic = new String();
        String[] pic = new String[size];
          String sbView = new String();
        String[] view = new String[size];
        dataQuery();
        try {
            int count = 0;
            while (rs.next()) {
                viewIntro[count] = rs.getString("簡介");
                pic[count] = rs.getString("檔名");
                view[count] = rs.getString("景點名稱");
                count++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (int i = 0; i < viewIntro.length; i++) {
            /*
             利用StringBuffer中的append方法將最後一筆資料的逗號必須取消
             */
            //簡介資料字體為12
            if (i == viewIntro.length - 1) {
                sbViewIntro = sbViewIntro.concat("<p class=introFont>").concat(viewIntro[i]);
            } else {
                sbViewIntro = sbViewIntro.concat("<p class=introFont>").concat(viewIntro[i]).concat(",");
            }
        }
        String[] sbViewIntroArr = sbViewIntro.split(",");
        //簡介資料每次只取endNum資料,其它資料為...超連結
         for (int i = 0; i < sbViewIntroArr.length; i++) {
            sbViewIntroArr[i] = sbViewIntroArr[i].substring(0, endNum).concat("...");
        }
        return sbViewIntroArr;
    }
    //取得資料庫圖片資料

    public String[] picSearch() {
        String sbPic = new String();
        String[] pic = new String[size];
        dataQuery();
        try {
            int count = 0;
            while (rs.next()) {
                pic[count] = rs.getString("檔名");
                count++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (int i = 0; i < pic.length; i++) {
            /*
             利用StringBuffer中的append方法將最後一筆資料的逗號必須取消
             */
            //JS資料圖片格式為<img src="images/xxx.jpg" width=225 height=225 />
            if (i == pic.length - 1) {
                sbPic = sbPic.concat("<img src=images/").concat(pic[i]).concat(" width=225 height=225 /><br>");
            } else {
                sbPic = sbPic.concat("<img src=images/").concat(pic[i]).concat(" width=225 height=225 /><br>").concat(",");
            }
        }
        String[] sbPicArr = sbPic.split(",");
        for (int i = 0; i < sbPicArr.length; i++) {
            System.out.println(sbPicArr[i]);
        }
        return sbPicArr;


    }
    
    public List divSearch(){
        String sb=new String()  ;
        String sbPic = new String();
        String[] pic = new String[size];
        String sbviewNumber = new String();
        String[] viewNumber = new String[size];
        String sbViewIntro = new String();
        String[] viewIntro = new String[size];
        String [] view=new String[size] ;
        String sbView=new String() ; 
        dataQuery();
        try {
            int count = 0;
            while (rs.next()) {
                pic[count]=rs.getString("檔名") ; 
                viewNumber[count] = rs.getString("景點代號");
                view[count]=rs.getString("景點名稱") ; 
                viewIntro[count]=rs.getString("簡介") ; 
               
                count++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        for(int i=0;i< viewIntro.length;i++)
        {
             viewIntro[i]=viewIntro[i].substring(0,endNum).concat("...") ; 
        }

          for (int i = 0; i < pic.length; i++) {
           
            if (i ==  pic.length-1  ) {
                sb=sb.concat("<div id=").concat(viewNumber[i]).concat(" class=drag >").concat("<img src=images/").concat(pic[i]).concat(" width=160 /><br/>").concat("<strong class=titleColor>").concat(view[i]).concat("</strong>").concat("<br>").concat("<p class=introFont>").concat("</div>");
                } else {
                sb=sb.concat("<div id=").concat(viewNumber[i]).concat(" class=drag >").concat("<img src=images/").concat(pic[i]).concat(" width=160 /><br/>").concat("<strong class=titleColor>").concat(view[i]).concat("</strong>").concat("<br>").concat("<p class=introFont>").concat("</div>").concat(",");
            }
        }

        String[] sbDiv = sb.split(",");
        List<String> list=new ArrayList<String>() ;
        for (int i = 0; i < sbDiv.length; i++) {
            list.add(sbDiv[i]);
        }
        return list ; 
    }
    
    public String test(){ 
        String sb = new String();
        String[] viewNumber = new String[size];
        dataQuery();
        try {
            int count = 0;
            while (rs.next()) {
                viewNumber[count] = rs.getString("景點代號");
                count++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
      
//          sb=sb.concat("<div id=source>") ; 
          for (int i = 0; i < viewNumber.length; i++) {
           
            if (i ==  viewNumber.length-1  ) {
                sb=sb.concat("#").concat(viewNumber[i]);
                } else {
                sb=sb.concat("#").concat(viewNumber[i]).concat(",");;
            }
        }
        
        return sb ; 
        
    }
    
    	
    	
    
            
    
    
////測試程式
    public static void main(String[] args) {
        Model model = new Model("南港區","");
        //System.out.println(model.dataSize);
        //model.dataQuery();
       
        

    }
}
