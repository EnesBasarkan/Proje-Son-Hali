using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Data.SqlClient;

namespace Foto_Dükkanı
{
    public partial class Uye : System.Web.UI.Page
    {
        SqlConnection sqlCon = null;
        SqlDataAdapter sqlAdap;
        SqlCommandBuilder sqlBuild;
        SqlCommand sqlCMD;
        HttpCookie myCookie = new HttpCookie("deneme");
        #region Server'a Bağlan
        private void ServeraBaglan()
        {
            sqlCon = new SqlConnection();
            sqlCon.ConnectionString = "Data Source=.;Initial Catalog=Foto_Dukkani;Integrated Security=True";
            sqlCon.Open();
        }
        #endregion

        #region Sql-Datatable Doldur
        private DataTable SQLDoldur(string stmt)
        {
            DataTable dtsql;

            if (sqlCon == null) ServeraBaglan();
            dtsql = new DataTable();
            try
            {
                sqlAdap = new SqlDataAdapter(stmt, sqlCon);//DataAdapter ile sorguyu gönderiyoruz
                sqlAdap.SelectCommand.CommandTimeout = 600;
                sqlBuild = new SqlCommandBuilder(sqlAdap);

                sqlAdap.Fill(dtsql);//Fill ile verileri datatable ye doldurduk
                sqlBuild.Dispose();
                sqlAdap.Dispose();
            }
            catch (Exception xx)
            {
                Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert(Tablo Doldurulamadı!+'" + xx.Message + "')</SCRIPT>");
                sqlCon.Close();
            }
            sqlCon.Close();
            return dtsql;
        }
        #endregion

        #region Sql-Sorgu Çalıştır
        private void SQLCalistir(string stmt)
        {
            if (sqlCon == null || sqlCon.State == ConnectionState.Closed) ServeraBaglan();
            sqlCMD = new SqlCommand(stmt, sqlCon);
            try
            {
                sqlCMD.ExecuteNonQuery();
            }
            catch (SqlException xx)
            {
                Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('HATA'+'" + xx.Message + "')</SCRIPT>");
                return;
            }
            sqlCMD.Dispose();
            // MessageBox.Show(gerceklesti, "BİLGİ", MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);
        }
        #endregion

        string id;
        protected void Page_Load(object sender, EventArgs e)
        {
           
           int a = 0;
           DataTable dt = new DataTable();

           string stmt = "SELECT ID,Kullanici_Adi,Sifre,Ad,Soyad,Tc,Mail,Adres,Cinsiyet,Dogum_Tarihi  FROM Uyeler WHERE Kullanici_Adi='" + Request.Cookies["deneme"]["uyeadi"] + "' ";

           dt = SQLDoldur(stmt);

           for (a = 0; a < dt.Rows.Count; a++)
           {

               if (dt != null | dt.Rows.Count > 0)
               {
                   id = dt.Rows[a]["ID"].ToString();
                   txt_kullanici.Text = dt.Rows[a]["Kullanici_Adi"].ToString();
                   txt_sifre.Text = dt.Rows[a]["Sifre"].ToString();
                   txt_ad.Text = dt.Rows[a]["Ad"].ToString();
                   txt_soyad.Text = dt.Rows[a]["Soyad"].ToString();
                   txt_tc.Text = dt.Rows[a]["Tc"].ToString();
                   txt_mail.Text = dt.Rows[a]["Mail"].ToString();
                   txt_adres.Text = dt.Rows[a]["Adres"].ToString();
                   txt_cinsiyet.Text = dt.Rows[a]["Cinsiyet"].ToString();
                   txt_dogum.Text = dt.Rows[a]["Dogum_Tarihi"].ToString();
                   
               }
           }
  
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string k_ad,sifre,ad,soyad,tc,adres,cinsiyet,dtarih,mail;
            k_ad=txt_kullanici.Text.Trim().ToString();
            sifre=txt_sifre.Text.Trim().ToString();
            ad=txt_ad.Text.Trim().ToString();
            soyad=txt_soyad.Text.Trim().ToString();
            tc=txt_tc.Text.Trim().ToString();
            adres=txt_adres.Text.Trim().ToString();
            cinsiyet=txt_cinsiyet.Text.Trim().ToString();
            dtarih=txt_dogum.Text.Trim().ToString();
            mail=txt_mail.Text.Trim().ToString();
            string stmt = "UPDATE [dbo].[Uyeler] SET [Kullanici_Adi]='" + k_ad.ToString() + "', [Sifre] = '" + sifre.ToString() + "',[Ad] = '" + ad.ToString() + "' ,[Soyad] = '" + soyad.ToString() + "' ,[Tc] = '" + tc.ToString() + "',[Mail] = '" + mail.ToString() + "' ,[Adres] = '" + adres.ToString() + "',[Cinsiyet] = '" + cinsiyet.ToString() + "',[Dogum_Tarihi] = '" + dtarih.ToString() + "' WHERE [ID]='" + id.ToString() + "'";
            SQLCalistir(stmt);
        }
    }
}