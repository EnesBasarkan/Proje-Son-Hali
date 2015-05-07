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
using System.Net.Mail;
using System.Net;

namespace Foto_Dükkanı
{
    public partial class index : System.Web.UI.Page
    {
        SqlConnection sqlCon = null;
        SqlDataAdapter sqlAdap;
        SqlCommandBuilder sqlBuild;
        SqlCommand sqlCMD;
        public static string[] kullanıcı = new string[1000];
        string[] sifre = new string[1000];
        public static int c = 0;
        HttpCookie myCookie = new HttpCookie("deneme");
        public static string Kullanici_Adi;
        string[] resim = new string[1000];
        string[] marka = new string[1000];
        int[] fiyat = new int[1000];
        string[] kod = new string[1000];
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
                Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('HATA'+'"+xx.Message+"')</SCRIPT>");
                return;
            }
            sqlCMD.Dispose();
            // MessageBox.Show(gerceklesti, "BİLGİ", MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
          //Bilgileri Tutma
            
    if (Request.Cookies["deneme"] != null)
    {
    if (Request.Cookies["deneme"]["uyeadi"] != null && Request.Cookies["deneme"]["sifresi"] != null)
    {
     txt_giris_ad.Text= Request.Cookies["deneme"]["uyeadi"];
    txt_giris_sifre.Text= Request.Cookies["deneme"]["sifresi"];
    merhaba_yazisi.Text = Request.Cookies["deneme"]["yazi"];
    Kullanici_Adi = Request.Cookies["deneme"]["uyeadi"];
    Label1.Visible = false;
    Label2.Visible = true;
    if (merhaba_yazisi.Text != "")
    {
        guvenli_cikis.Visible = true;
    }
    }
    } //Bilgileri Tutma

   
        int adet = 0;

        DataTable dt = new DataTable();
        for (int i = 0; i < 1000; i++)
        {
            resim[i] = "~/Urun_Fotolari/default.png";
            marka[i] = null;
            fiyat[i] = 0;
            kod[i] = null;
        }
        string stmt = "SELECT *  FROM Urunler ";

        dt = SQLDoldur(stmt);

        for (int a = 0; a < dt.Rows.Count; a++)
        {

            if (dt != null | dt.Rows.Count > 0)
            {
                resim[a] = dt.Rows[a]["Urun_Resim"].ToString();
                marka[a] = dt.Rows[a]["Urun_Adi"].ToString();
                fiyat[a] = Convert.ToInt32(dt.Rows[a]["Urun_Fiyat"]);
                kod[a] = dt.Rows[a]["Urun_Kod"].ToString();
            }
        }
        adet = dt.Rows.Count;
        if (adet > 7)
        {
            Image1.ImageUrl = resim[adet - 1];
            Image2.ImageUrl = resim[adet - 2];
            Image3.ImageUrl = resim[adet - 3];
            Image4.ImageUrl = resim[adet - 4];
            Image5.ImageUrl = resim[adet - 5];
            Image6.ImageUrl = resim[adet - 6];
            Image7.ImageUrl = resim[adet - 7];
            Image8.ImageUrl = resim[adet - 8];
            Label3.Text = marka[adet - 1].ToString();
            Label4.Text = marka[adet - 2].ToString();
            Label5.Text = marka[adet - 3].ToString();
            Label6.Text = marka[adet - 4].ToString();
            Label7.Text = marka[adet - 5].ToString();
            Label8.Text = marka[adet - 6].ToString();
            Label9.Text = marka[adet - 7].ToString();
            Label10.Text = marka[adet - 8].ToString();
            Label11.Text = fiyat[adet - 1].ToString();
            Label12.Text = fiyat[adet - 2].ToString();
            Label13.Text = fiyat[adet - 3].ToString();
            Label14.Text = fiyat[adet - 4].ToString();
            Label15.Text = fiyat[adet - 5].ToString();
            Label16.Text = fiyat[adet - 6].ToString();
            Label17.Text = fiyat[adet - 7].ToString();
            Label18.Text = fiyat[adet - 8].ToString();
            Label19.Text = kod[adet - 1].ToString();
            Label20.Text = kod[adet - 2].ToString();
            Label21.Text = kod[adet - 3].ToString();
            Label22.Text = kod[adet - 4].ToString();
            Label23.Text = kod[adet - 5].ToString();
            Label24.Text = kod[adet - 6].ToString();
            Label25.Text = kod[adet - 7].ToString();
            Label26.Text = kod[adet - 8].ToString();
        }
        if (adet == 7)
        {
            Image1.ImageUrl = resim[adet - 7];
            Image2.ImageUrl = resim[adet - 6];
            Image3.ImageUrl = resim[adet - 5];
            Image4.ImageUrl = resim[adet - 4];
            Image5.ImageUrl = resim[adet - 3];
            Image6.ImageUrl = resim[adet - 2];
            Image7.ImageUrl = resim[adet - 1];
            Label3.Text = marka[adet - 1].ToString();
            Label4.Text = marka[adet - 2].ToString();
            Label5.Text = marka[adet - 3].ToString();
            Label6.Text = marka[adet - 4].ToString();
            Label7.Text = marka[adet - 5].ToString();
            Label8.Text = marka[adet - 6].ToString();
            Label9.Text = marka[adet - 7].ToString();
            Label11.Text = fiyat[adet - 1].ToString();
            Label12.Text = fiyat[adet - 2].ToString();
            Label13.Text = fiyat[adet - 3].ToString();
            Label14.Text = fiyat[adet - 4].ToString();
            Label15.Text = fiyat[adet - 5].ToString();
            Label16.Text = fiyat[adet - 6].ToString();
            Label17.Text = fiyat[adet - 7].ToString();
            Label19.Text = kod[adet - 1].ToString();
            Label20.Text = kod[adet - 2].ToString();
            Label21.Text = kod[adet - 3].ToString();
            Label22.Text = kod[adet - 4].ToString();
            Label23.Text = kod[adet - 5].ToString();
            Label24.Text = kod[adet - 6].ToString();
            Label25.Text = kod[adet - 7].ToString();
        }
        if (adet == 6)
        {
            Image1.ImageUrl = resim[adet - 6];
            Image2.ImageUrl = resim[adet - 5];
            Image3.ImageUrl = resim[adet - 4];
            Image4.ImageUrl = resim[adet - 3];
            Image5.ImageUrl = resim[adet - 2];
            Image6.ImageUrl = resim[adet - 1];
            Label3.Text = marka[adet - 1].ToString();
            Label4.Text = marka[adet - 2].ToString();
            Label5.Text = marka[adet - 3].ToString();
            Label6.Text = marka[adet - 4].ToString();
            Label7.Text = marka[adet - 5].ToString();
            Label8.Text = marka[adet - 6].ToString();
            Label11.Text = fiyat[adet - 1].ToString();
            Label12.Text = fiyat[adet - 2].ToString();
            Label13.Text = fiyat[adet - 3].ToString();
            Label14.Text = fiyat[adet - 4].ToString();
            Label15.Text = fiyat[adet - 5].ToString();
            Label16.Text = fiyat[adet - 6].ToString();
            Label19.Text = kod[adet - 1].ToString();
            Label20.Text = kod[adet - 2].ToString();
            Label21.Text = kod[adet - 3].ToString();
            Label22.Text = kod[adet - 4].ToString();
            Label23.Text = kod[adet - 5].ToString();
            Label24.Text = kod[adet - 6].ToString();
        }
        if (adet == 5)
        {
            Image1.ImageUrl = resim[adet - 5];
            Image2.ImageUrl = resim[adet - 4];
            Image3.ImageUrl = resim[adet - 3];
            Image4.ImageUrl = resim[adet - 2];
            Image5.ImageUrl = resim[adet - 1];
            Label3.Text = marka[adet - 1].ToString();
            Label4.Text = marka[adet - 2].ToString();
            Label5.Text = marka[adet - 3].ToString();
            Label6.Text = marka[adet - 4].ToString();
            Label7.Text = marka[adet - 5].ToString();
            Label11.Text = fiyat[adet - 1].ToString();
            Label12.Text = fiyat[adet - 2].ToString();
            Label13.Text = fiyat[adet - 3].ToString();
            Label14.Text = fiyat[adet - 4].ToString();
            Label15.Text = fiyat[adet - 5].ToString();
            Label19.Text = kod[adet - 1].ToString();
            Label20.Text = kod[adet - 2].ToString();
            Label21.Text = kod[adet - 3].ToString();
            Label22.Text = kod[adet - 4].ToString();
            Label23.Text = kod[adet - 5].ToString();
        }
        if (adet == 4)
        {
            Image1.ImageUrl = resim[adet - 4];
            Image2.ImageUrl = resim[adet - 3];
            Image3.ImageUrl = resim[adet - 2];
            Image4.ImageUrl = resim[adet - 1];
            Label3.Text = marka[adet - 1].ToString();
            Label4.Text = marka[adet - 2].ToString();
            Label5.Text = marka[adet - 3].ToString();
            Label6.Text = marka[adet - 4].ToString();
            Label11.Text = fiyat[adet - 1].ToString();
            Label12.Text = fiyat[adet - 2].ToString();
            Label13.Text = fiyat[adet - 3].ToString();
            Label14.Text = fiyat[adet - 4].ToString();
            Label19.Text = kod[adet - 1].ToString();
            Label20.Text = kod[adet - 2].ToString();
            Label21.Text = kod[adet - 3].ToString();
            Label22.Text = kod[adet - 4].ToString();
        }
        if (adet == 3)
        {
            Image1.ImageUrl = resim[adet - 3];
            Image2.ImageUrl = resim[adet - 2];
            Image3.ImageUrl = resim[adet - 1];
            Label3.Text = marka[adet - 1].ToString();
            Label4.Text = marka[adet - 2].ToString();
            Label5.Text = marka[adet - 3].ToString();
            Label11.Text = fiyat[adet - 1].ToString();
            Label12.Text = fiyat[adet - 2].ToString();
            Label13.Text = fiyat[adet - 3].ToString();
            Label19.Text = kod[adet - 1].ToString();
            Label20.Text = kod[adet - 2].ToString();
            Label21.Text = kod[adet - 3].ToString();
        }
        if (adet == 2)
        {
            Image1.ImageUrl = resim[adet - 2];
            Image2.ImageUrl = resim[adet - 1];
            Label3.Text = marka[adet - 1].ToString();
            Label4.Text = marka[adet - 2].ToString();
            Label11.Text = fiyat[adet - 1].ToString();
            Label12.Text = fiyat[adet - 2].ToString();
            Label19.Text = kod[adet - 1].ToString();
            Label20.Text = kod[adet - 2].ToString();
        }
        if (adet == 1)
        {
            Image1.ImageUrl = resim[adet - 1];
            Label3.Text = marka[adet - 1].ToString();
            Label11.Text = fiyat[adet - 1].ToString();
            Label19.Text = kod[adet - 1].ToString();
        }
  

        }

        protected void btn_giris_Click(object sender, EventArgs e)
        {
            int a = 0;
            DataTable dt = new DataTable();

            string stmt = "SELECT Kullanici_Adi  FROM Uyeler";

            dt = SQLDoldur(stmt);

            for (a = 0; a < dt.Rows.Count; a++)
            {

                if (dt != null | dt.Rows.Count > 0)
                    kullanıcı[a] = dt.Rows[a]["Kullanici_Adi"].ToString();
            }

            DataTable dtt = new DataTable();

            string stmtt = "SELECT Sifre  FROM Uyeler";

            dt = SQLDoldur(stmtt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {

                if (dt != null | dt.Rows.Count > 0)
                    sifre[i] = dt.Rows[i]["Sifre"].ToString();
            }           
            for (c = 0; c <= a; c++)
            {
                if (kullanıcı[c] == txt_giris_ad.Text.Trim().ToString() && sifre[c] == txt_giris_sifre.Text.Trim().ToString())
                {
                    myCookie["uyeadi"] = txt_giris_ad.Text;
                    myCookie["sifresi"] = txt_giris_sifre.Text;
                    myCookie["yazi"] = "Merhaba " + txt_giris_ad.Text;
                    myCookie.Expires = DateTime.Now.AddDays(10);
                    Response.Cookies.Add(myCookie);
                   
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    Label1.Visible = false;
                }
                else
                {
                    Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('KUllanıcı Adı Veya Sifre Yanlış')</SCRIPT>");
                }
            }
           
        }
        // Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Tablo Doldurulamadı!+')</SCRIPT>");
        protected void btn_kayit_Click(object sender, EventArgs e)
        {


            string stmt = "INSERT INTO [Foto_Dukkani].[dbo].[Uyeler] ([Kullanici_Adi],[Mail],[Sifre] ) VALUES ('" + txt_kayit_kul_ad.Text.Trim().ToString() + "','" + txt_kayit_mail.Text.Trim().ToString() + "','" + txt_kayit_sifre.Text.Trim().ToString() + "')";
            SQLCalistir(stmt); 
            
           
           
           
            
        }

        protected void guvenli_cikis_Click(object sender, EventArgs e)
        {

            Response.Cookies["deneme"].Expires = DateTime.Now.AddHours(-4);
            Response.Redirect("index.aspx");
        }

        protected void lbtn_sifre_unutma_Click(object sender, EventArgs e)
        {

            string[] H_Sifre = new string[1000];
            string[] H_Mail = new string[1000];
            int a = 0;
            DataTable dt = new DataTable();

            string stmt = "SELECT Sifre  FROM Uyeler";

            dt = SQLDoldur(stmt);

            for (a = 0; a < dt.Rows.Count; a++)
            {

                if (dt != null | dt.Rows.Count > 0)
                    H_Sifre[a] = dt.Rows[a]["Sifre"].ToString();
            }

            DataTable dtt = new DataTable();

            string stmtt = "SELECT Mail  FROM Uyeler";

            dt = SQLDoldur(stmtt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {

                if (dt != null | dt.Rows.Count > 0)
                    H_Mail[i] = dt.Rows[i]["Mail"].ToString();
            }

            for (c = 0; c <= a; c++)
            {
                if (H_Mail[c] == txt_sifre_unutma.Text.ToString())
                {
                    MailMessage mail = new MailMessage(); // mail adında MailMessage nesnesi yaratıyoruz.
                    mail.From = new MailAddress("admin@asilsite.com.tr"); //Mailin kimden gittiğini belirtiyoruz
                    mail.To.Add(txt_sifre_unutma.Text.Trim().ToString()); //Mailin kime gideceğini belirtiyoruz
                    mail.Subject = "Foto Dükkanı Şifre Hatırlatma"; //Mail konusu
                    mail.Body = "Merhabalar - Foto Dükkanı Şifre Hatırlatma Mesajıdır. Şifreniz=" + H_Sifre[c].ToString() + "  Eğer Şifre Hatırlatma İsteğini Siz Yapmadıysanız Bu Mesajı Dikkate Almayınız. "; //Mailin içeriği
                    SmtpClient sc = new SmtpClient(); //sc adında SmtpClient nesnesi yaratıyoruz.
                    sc.Port = 587; //Gmail için geçerli Portu bildiriyoruz
                    sc.Host = "smtp.gmail.com"; //Gmailin smtp host adresini belirttik
                    sc.EnableSsl = true; //SSL’i etkinleştirdik.
                    sc.Credentials = new NetworkCredential("fotodukkani@gmail.com", "12345foto"); //Gmail hesap kontrolü için bilgilerimizi girdik
                    sc.Send(mail); //Mailinizi gönderiyoruz.

                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            myCookie["aranan"] = TextBox1.Text.ToString().Trim();
            myCookie.Expires = DateTime.Now.AddDays(10);
            Response.Cookies.Add(myCookie);
            Page.Response.Redirect("Arama.aspx", true);
       
            
        }
    }
}