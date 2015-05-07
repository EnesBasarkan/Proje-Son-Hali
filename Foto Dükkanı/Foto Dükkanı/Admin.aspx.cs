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
    public partial class Admin : System.Web.UI.Page
    {
        SqlConnection sqlCon = null;
        SqlDataAdapter sqlAdap;
        SqlCommandBuilder sqlBuild;
        SqlCommand sqlCMD;
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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_urun_ekle_Click(object sender, EventArgs e)
        {
            int fiyat, stok;
            fiyat = Convert.ToInt32(txt_urunfiyat.Text);
            stok=Convert.ToInt32(txt_stok.Text);
            FileUpload1.SaveAs(Server.MapPath("Urun_Fotolari/") + FileUpload1.FileName);
            string resim_yolu = "~/Urun_Fotolari/" + FileUpload1.FileName;
            string stmt = "INSERT INTO [dbo].[Urunler]([Urun_Kod],[Urun_Adi],[Urun_Fiyat],[Urun_Resim],[Urun_Stok])VALUES('"+txt_urunkod.Text.Trim().ToString()+"','"+txt_urunad.Text.Trim().ToString()+"','"+fiyat+"','"+resim_yolu.Trim().ToString()+"','"+stok+"')";
            SQLCalistir(stmt);
            string stmtt = "INSERT INTO [Foto_Dukkani].[dbo].[Ozellikler]([Urun_Kod],[Format],[Cozunurluk],[ISO],[Seri_Mod],[Video_Cekim],[Video_Cozunurluk],[Ekran_Boyutu],[Agırlık])VALUES('"+txt_urunkod.Text.Trim().ToString()+"','" + txt_urunformat.Text.Trim().ToString() + "','" + txt_uruncozunurluk.Text.Trim().ToString() + "','" + txt_uruniso.Text.Trim().ToString() + "','" + txt_urunsericekim.Text.Trim().ToString() + "','" + txt_urunvideocekim.Text.Trim().ToString() + "','" + txt_urunmaxvideo.Text.Trim().ToString() + "','" + txt_urunlcdekran.Text.Trim().ToString() + "','" + txt_urunagirlik.Text.Trim().ToString() + "')";
            SQLCalistir(stmtt);
            txt_urunad.Text = "";
            txt_urunagirlik.Text = "";
            txt_uruncozunurluk.Text = "";
            txt_stok.Text = "";
            txt_urunfiyat.Text = "";
            txt_urunformat.Text = "";
            txt_uruniso.Text = "";
            txt_urunkod.Text = "";
            txt_urunlcdekran.Text = "";
            txt_urunmaxvideo.Text = "";
            txt_urunsericekim.Text = "";
            txt_urunvideocekim.Text = "";
            
           
        }



        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            string INDEX = GridView1.Rows[e.RowIndex].Cells[2].Text;
           string stmt = "DELETE FROM Uyeler Where ID='"+INDEX.ToString()+"'";
           SQLCalistir(stmt);            
        }


        public static string D_Index;

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow Satir = GridView1.SelectedRow;
            TextBox1.Text = Satir.Cells[3].Text;
            TextBox2.Text = Satir.Cells[4].Text;
            TextBox3.Text = Satir.Cells[5].Text;
            TextBox4.Text = Satir.Cells[6].Text;
            TextBox5.Text = Satir.Cells[7].Text;
            TextBox6.Text = Satir.Cells[8].Text;
            TextBox7.Text = Satir.Cells[9].Text;
            TextBox8.Text = Satir.Cells[10].Text;
            TextBox9.Text = Satir.Cells[11].Text;
            D_Index = Satir.Cells[2].Text;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string k_Ad, sifre, ad, soyad, tc, mail, adres, cinsiyet, dogumtarihi;
            k_Ad = TextBox1.Text.Trim().ToString();
            sifre = TextBox2.Text.Trim().ToString();
            ad = TextBox3.Text.Trim().ToString();
            soyad =TextBox4.Text.Trim().ToString();
            tc = TextBox5.Text.Trim().ToString();
            mail=TextBox6.Text.Trim().ToString();
            adres=TextBox7.Text.Trim().ToString();
            cinsiyet=TextBox8.Text.Trim().ToString();
            dogumtarihi=TextBox9.Text.Trim().ToString();
            string stmt = "UPDATE [Foto_Dukkani].[dbo].[Uyeler] SET [Kullanici_Adi]='" + k_Ad.ToString() + "',[Sifre]='" + sifre.ToString() + "',[Ad]='" + ad.ToString() + "',[Soyad]='" + soyad.ToString() + "',[Tc]='" + tc.ToString() + "',[Mail]='" + mail.ToString() +"',[Adres]='" + adres.ToString() + "',[Cinsiyet]='" + cinsiyet.ToString() + "',[Dogum_Tarihi]='" + dogumtarihi.ToString() + "' WHERE [ID]='" + D_Index.ToString() + "'";
            SQLCalistir(stmt);
            Response.Redirect("Admin.aspx");
           

        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string INDEX = GridView2.Rows[e.RowIndex].Cells[1].Text;
            string stmt = "DELETE FROM Urunler Where ID='" + INDEX.ToString() + "'";
            string stmtt = "DELETE FROM Ozellikler Where ID='"+INDEX.ToString()+"'";
            SQLCalistir(stmt);
            SQLCalistir(stmt);
        }




     

       

        


    }
}