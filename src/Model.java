
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


    //�Q�Ϋe�ݩұo�쪺�a�ϸ��(area),�Q��maping table�i����U�ϴ��I�Ӽ�(size)
    public Model(String area, String desMatch) {
        if (desMatch == null || desMatch.trim().length() == 0) {
            this.area = area;
            this.desMatch="" ;
            String areaStr = "�h�L��,�j�P��,�j�w��,���s��,������,�����,��s��,�_���,�Q�s��,�H�q��,�n���,�U�ذ�";
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
    //��Ʈw�j�M

    public void dataQuery() {
  
        try {
            myDBDriver = new MyDBDriver("MSSQL", "localhost", "1433", "GiLa", "sa", "111");
            conn = myDBDriver.getConnection();
            stmt = conn.createStatement();
            String sql = "select * from ���I�� left join ���I�Ӥ��� on ���I��.���I�N��=���I�Ӥ���.���I�N�� "
                    + "where �Ǹ�=1"
                    + "and ����='�x�_��'"
                    + "and �a��='"+this.area+"'" 
                    + "and �Բӻ��� like '%"+this.desMatch+"%'"  ; 
                 
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
            String sql = "select * from ���I�� left join ���I�Ӥ��� on ���I��.���I�N��=���I�Ӥ���.���I�N�� "
                    + "where �Ǹ�=1"
                    + "and ����='�x�_��'"
                    + "and �a��='"+area+"'" 
                    + "and �Բӻ��� like '%"+desMatch+"%'" ;
                   
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
    //���o��Ʈw�y�и��

    public StringBuffer coordinataeSearch() {
        StringBuffer sb = new StringBuffer();
        float[] xCod = new float[size];
        float[] yCod = new float[size];
        dataQuery();
        try {
            int count = 0;
            while (rs.next()) {
                xCod[count] = rs.getFloat("GPS�n��");
                yCod[count] = rs.getFloat("GPS�g��");
                count++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (int i = 0; i < xCod.length; i++) {
            /*
             �Q��StringBuffer����append��k�N�̫�@����ƪ��r���������� 
             JS�G���}�C�榡�� var array = new Array([x1,y1],[x2,y2]...);
             */
            if (i == xCod.length - 1) {
                sb.append("[").append(xCod[i]).append(",").append(yCod[i]).append("]");
            } else {
                sb.append("[").append(xCod[i]).append(",").append(yCod[i]).append("]").append(",");
            }
        }
        return sb;
    }
    //���o��Ʈw���I�W�ٸ��

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
                viewIntro[count] = rs.getString("²��");
                pic[count] = rs.getString("�ɦW");
                view[count] = rs.getString("���I�W��");
                count++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (int i = 0; i < view.length; i++) {
            /*
             �Q��StringBuffer����append��k�N�̫�@����ƪ��r����������
             */

            //���I�W�ٸ�Ƭ�����,�C�⬰�Ŧ�
            if (i == view.length - 1) {
                sbView = sbView.concat("<a class=fancybox href=images/").concat(pic[i]).concat(" title=").concat(view[i]).concat(" ><img src=images/").concat(pic[i]).concat(" width=160>").concat("<br/>").concat( view[i]).concat("</a>").concat("<br/><br/>");
            } else {
                sbView = sbView.concat("<a class=fancybox href=images/").concat(pic[i]).concat(" title=").concat(view[i]).concat(" ><img src=images/").concat(pic[i]).concat(" width=160>").concat("<br/>").concat( view[i]).concat("</a>").concat("<br/><br/>").concat(",");
            }
        }
        String sbViewArr[] = sbView.split(",");
        return sbViewArr;
    }
    //���o��Ʈw²�����

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
                viewIntro[count] = rs.getString("²��");
                pic[count] = rs.getString("�ɦW");
                view[count] = rs.getString("���I�W��");
                count++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (int i = 0; i < viewIntro.length; i++) {
            /*
             �Q��StringBuffer����append��k�N�̫�@����ƪ��r����������
             */
            //²����Ʀr�鬰12
            if (i == viewIntro.length - 1) {
                sbViewIntro = sbViewIntro.concat("<p class=introFont>").concat(viewIntro[i]);
            } else {
                sbViewIntro = sbViewIntro.concat("<p class=introFont>").concat(viewIntro[i]).concat(",");
            }
        }
        String[] sbViewIntroArr = sbViewIntro.split(",");
        //²����ƨC���u��endNum���,�䥦��Ƭ�...�W�s��
         for (int i = 0; i < sbViewIntroArr.length; i++) {
            sbViewIntroArr[i] = sbViewIntroArr[i].substring(0, endNum).concat("...");
        }
        return sbViewIntroArr;
    }
    //���o��Ʈw�Ϥ����

    public String[] picSearch() {
        String sbPic = new String();
        String[] pic = new String[size];
        dataQuery();
        try {
            int count = 0;
            while (rs.next()) {
                pic[count] = rs.getString("�ɦW");
                count++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (int i = 0; i < pic.length; i++) {
            /*
             �Q��StringBuffer����append��k�N�̫�@����ƪ��r����������
             */
            //JS��ƹϤ��榡��<img src="images/xxx.jpg" width=225 height=225 />
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
                pic[count]=rs.getString("�ɦW") ; 
                viewNumber[count] = rs.getString("���I�N��");
                view[count]=rs.getString("���I�W��") ; 
                viewIntro[count]=rs.getString("²��") ; 
               
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
                viewNumber[count] = rs.getString("���I�N��");
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
    
    	
    	
    
            
    
    
////���յ{��
    public static void main(String[] args) {
        Model model = new Model("�n���","");
        //System.out.println(model.dataSize);
        //model.dataQuery();
       
        

    }
}
