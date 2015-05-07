<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Uye.aspx.cs" Inherits="Foto_Dükkanı.Uye" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<title>FotoDükkanı - Üye Paneli</title>
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
		  <img src="css/images/uyelogo.png" />
			
		</div>
		
		
		<!-- Content -->
		<div id="content">
			
			<!-- Tabs -->
			<div class="tabs">
				<ul>
				    <li><a href="#" class="active"><span>BİLGİLERİM</span></a></li>
				   
				    
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
                           Kullanıcı Adi   <asp:TextBox ID="txt_kullanici" runat="server"></asp:TextBox></br></br>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Şifre  <asp:TextBox ID="txt_sifre" runat="server"></asp:TextBox></br></br>
                          &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ad  <asp:TextBox ID="txt_ad" runat="server"></asp:TextBox></br></br>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Soyad  <asp:TextBox ID="txt_soyad" runat="server"></asp:TextBox></br></br>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tc<asp:TextBox ID="txt_tc" runat="server"></asp:TextBox></br></br>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mail<asp:TextBox ID="txt_mail" runat="server"></asp:TextBox></br></br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Adres<asp:TextBox ID="txt_adres" runat="server"></asp:TextBox></br></br>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cinsiyet<asp:TextBox ID="txt_cinsiyet" runat="server"></asp:TextBox></br></br>
                             Dogum Tari<asp:TextBox ID="txt_dogum" runat="server"></asp:TextBox></br></br>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button1" runat="server" Text="KAYDET" OnClick="Button1_Click" />
						</div>
                      
					</div>
					<!-- Kullanıcı Yönetimi Sekmesi Bitiş -->
					
					<!-- Ürün Yönetimi Sekmesi -->
					<div class="tab-content">
						<div class="items">
							<div class="cl">&nbsp;</div>
                          
                           
						</div>
					</div>
					<!-- Ürün Yönetimi Sekmesi Bitiş -->
					
				
				
				
				<!-- Footer -->
				<div id="footer">
					<div class="left">
						<a href="uye.aspx">Panel Ana Sayfa</a>
						<span>|</span>
						<a href="index.aspx">Site Ana Sayfa</a>
						
						
						
						
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
