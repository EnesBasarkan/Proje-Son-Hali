<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Foto_Dükkanı.Admin" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<title>FotoDükkanı - Yönetim Paneli</title>
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<!--[if lte IE 6]>
		<style type="text/css" media="screen">
			.tabbed { height:420px; }
		</style>
	<![endif]-->
	
	<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
	<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
	<script src="js/jquery.slide.js" type="text/javascript"></script>
	<script src="js/jquery-func.js" type="text/javascript"></script>
	
</head>
<body>



    <form id="form1" runat="server">



<!-- Main -->
        <div id="main">
	<div class="shell">
		
		
		<div class="options">
		  <img src="css/images/yonetimlogo.png" />
			
		</div>
		
		
		<!-- Content -->
		<div id="content">
			
			<!-- Tabs -->
			<div class="tabs">
				<ul>
				    <li><a href="#" class="active"><span>KULLANICI YÖNETİMİ</span></a></li>
				    <li><a href="#"><span>ÜRÜN YÖNETİMİ</span></a></li>
				    
				</ul>
			</div>
			<!-- Tabs -->
			
			<!-- Container -->
			<div id="container">
				
				<div class="tabbed">
					
					<!-- Kullanıcı Yönetimi Sekmesi -->
					<div class="tab-content" style="display:block;">
					  <div class="items">
					    <div class="cl">&nbsp;</div>
                          <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                              <AlternatingRowStyle BackColor="White" />
                              <Columns>
                                  <asp:CommandField HeaderText="SİL" ShowDeleteButton="True" ShowHeader="True" />
                                  <asp:CommandField HeaderText="SEC" ShowHeader="True" ShowSelectButton="True" />
                              </Columns>
                              <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                              <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                              <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                              <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                              <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                              <SortedAscendingCellStyle BackColor="#FDF5AC" />
                              <SortedAscendingHeaderStyle BackColor="#4D0000" />
                              <SortedDescendingCellStyle BackColor="#FCF6C0" />
                              <SortedDescendingHeaderStyle BackColor="#820000" />
                          </asp:GridView>
                         
						  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                              ConnectionString="Data Source=.;Initial Catalog=Foto_Dukkani;Integrated Security=True" 
                              SelectCommand="SELECT * FROM [Uyeler]" UpdateCommand="
" DeleteCommand="
"></asp:SqlDataSource>
                         
						  <br />
                          <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                          <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                          <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                          <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                          <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                          <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                          <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                          <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                          <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                          <br />
                          <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Güncelle" />
                         
						</div>
                        
					</div>
					<!-- Kullanıcı Yönetimi Sekmesi Bitiş -->
					
					<!-- Ürün Yönetimi Sekmesi -->
					<div class="tab-content">
						<div class="items">
							<div class="cl">&nbsp;</div>
                            <asp:GridView ID="GridView2" runat="server" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView2_RowDeleting" >
                              <AlternatingRowStyle BackColor="White" />
                              <Columns>
                                  <asp:CommandField HeaderText="SİL" ShowDeleteButton="True" ShowHeader="True" />
                                 
                              </Columns>
                              <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                              <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                              <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                              <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                              <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                              <SortedAscendingCellStyle BackColor="#FDF5AC" />
                              <SortedAscendingHeaderStyle BackColor="#4D0000" />
                              <SortedDescendingCellStyle BackColor="#FCF6C0" />
                              <SortedDescendingHeaderStyle BackColor="#820000" />
                          </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=.;Initial Catalog=Foto_Dukkani;Integrated Security=True" 
                              SelectCommand="SELECT * FROM [Urunler]" UpdateCommand="
" DeleteCommand="
"></asp:SqlDataSource></asp:SqlDataSource>
                            <br />
							 <asp:Label ID="Label2" runat="server" Text="Kodu: "></asp:Label>
                          <asp:TextBox ID="txt_urunkod" runat="server"></asp:TextBox><br>
                          <asp:Label ID="Label10" runat="server" Text="Adı: "></asp:Label>
                          <asp:TextBox ID="txt_urunad" runat="server"></asp:TextBox>
                          <br />
                          <asp:Label ID="Label12" runat="server" Text="Resim Yolu:"></asp:Label>
                          <asp:FileUpload ID="FileUpload1" runat="server" />
                          <br>
                            <asp:Label ID="Label14" runat="server" Text="Stok: "></asp:Label>
                            <asp:TextBox ID="txt_stok" runat="server"></asp:TextBox>
                            <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
                          <asp:Label ID="Label3" runat="server" Text="Fiyatı: "></asp:Label>
                          <asp:TextBox ID="txt_urunfiyat" runat="server"></asp:TextBox><br>
                          <asp:Label ID="Label4" runat="server" Text="Formatı: "></asp:Label>
                          <asp:TextBox ID="txt_urunformat" runat="server"></asp:TextBox><br>
                          <asp:Label ID="Label5" runat="server" Text="Çözünürlüğü: "></asp:Label>
                          <asp:TextBox ID="txt_uruncozunurluk" runat="server"></asp:TextBox><br>
                          <asp:Label ID="Label6" runat="server" Text="ISO Aralığı: "></asp:Label>
                          <asp:TextBox ID="txt_uruniso" runat="server"></asp:TextBox><br>
                          <asp:Label ID="Label7" runat="server" Text="Seri Çekim: "></asp:Label>
                          <asp:TextBox ID="txt_urunsericekim" runat="server"></asp:TextBox><br>
                          <asp:Label ID="Label8" runat="server" Text="Video Çekimi: "></asp:Label>
                          <asp:TextBox ID="txt_urunvideocekim" runat="server"></asp:TextBox><br>
                          <asp:Label ID="Label9" runat="server" Text="Max Video Çözünürlüğü: "></asp:Label>
                          <asp:TextBox ID="txt_urunmaxvideo" runat="server"></asp:TextBox><br>
                          <asp:Label ID="Label1" runat="server" Text="LCD Ekran Boyutu: "></asp:Label>
                          <asp:TextBox ID="txt_urunlcdekran" runat="server"></asp:TextBox><br>
                          <asp:Label ID="Label11" runat="server" Text="Ağırlığı: "></asp:Label>
                          <asp:TextBox ID="txt_urunagirlik" runat="server"></asp:TextBox>
                          <br />
                          <asp:Button ID="btn_urun_ekle" runat="server" Text="Urun Ekle" OnClick="btn_urun_ekle_Click" />
                          <br>
                         
                                  
                          
                              
                              

                              

						</div>
					</div>
					<!-- Ürün Yönetimi Sekmesi Bitiş -->
					
					
				
				<!-- Footer -->
				<div id="footer">
					<div class="left">
						<a href="admin.html">Panel Ana Sayfa</a>
						<span>|</span>
						<a href="index.html">Site Ana Sayfa</a>
						<span>|</span>
					
						
						
				  </div>
					<div class="right">
						&copy;<a href="http://fotodukkani.com" target="_blank" title="CSS Templates"> FotoDukkani.Com</a> | Tüm Hakları Saklıdır.
					</div>
				</div>
				<!-- End Footer -->
				
			</div>
			<!-- End Container -->
			
		</div>
		<!-- End Content -->
		
	</div>
</div>
<!-- End Main -->
	
    </form>
	
</body>
</html>
