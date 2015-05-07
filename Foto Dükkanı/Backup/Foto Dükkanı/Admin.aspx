<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Foto_Dükkanı.Admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
				    <li><a href="#" class="active"><span>SİPARİŞ YÖNETİMİ</span></a></li>
                    <li><a href="#" class="active"><span>KARGO YÖNETİMİ</span></a></li>
                    <li><a href="#" class="red"><span>CANLI DESTEK</span></a></li>
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
						</div>
					    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
                            DataSourceID="Kullanici" 
                            onselectedindexchanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="ID" />
                                <asp:BoundField DataField="Kullanici_Adi" HeaderText="Kullanici_Adi" 
                                    SortExpression="Kullanici_Adi" />
                                <asp:BoundField DataField="Sifre" HeaderText="Sifre" SortExpression="Sifre" />
                                <asp:BoundField DataField="Tc" HeaderText="Tc" SortExpression="Tc" />
                                <asp:BoundField DataField="Ad" HeaderText="Ad" SortExpression="Ad" />
                                <asp:BoundField DataField="Soyad" HeaderText="Soyad" SortExpression="Soyad" />
                                <asp:BoundField DataField="Mail" HeaderText="Mail" SortExpression="Mail" />
                                <asp:BoundField DataField="Adres" HeaderText="Adres" SortExpression="Adres" />
                                <asp:BoundField DataField="Dogum_Tarihi" HeaderText="Dogum_Tarihi" 
                                    SortExpression="Dogum_Tarihi" />
                                <asp:BoundField DataField="Cinsiyet" HeaderText="Cinsiyet" 
                                    SortExpression="Cinsiyet" />
                                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/sil.png" 
                                    HeaderText="Sil" ShowDeleteButton="True">
                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
                                <asp:CommandField ButtonType="Image" EditImageUrl="~/images/güncelle.png" 
                                    HeaderText="Düzenle" ShowEditButton="True">
                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
                                <asp:CommandField ButtonType="Image" HeaderText="Ekle" 
                                    NewImageUrl="~/images/ekle.png" ShowInsertButton="True">
                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="Kullanici" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:Foto_DukkaniConnectionString %>" 
                            SelectCommand="SELECT * FROM [Uyeler]"></asp:SqlDataSource>
					</div>
					<!-- Kullanıcı Yönetimi Sekmesi Bitiş -->
					
					<!-- Ürün Yönetimi Sekmesi -->
					<div class="tab-content">
						<div class="items">
							<div class="cl">&nbsp;</div>
							ÜRÜN YÖNETİMİ
						</div>
					</div>
					<!-- Ürün Yönetimi Sekmesi Bitiş -->
					
					<!-- Sipariş Yönetimi Sekmesi -->
					<div class="tab-content">
						<div class="items">
							<div class="cl">&nbsp;</div>
							SİPARİŞ YÖNETİMİ
						</div>
					</div>
					<!-- Kargo Yönetimi Sekmesi -->
					<div class="tab-content">
						<div class="items">
							<div class="cl">&nbsp;</div>
							KARGO YÖNETİMİ
					</div>
				</div>
				<!-- Kargo Yönetimi Sekmesi Bitiş -->
                
                <!-- Canlı Destek Sekmesi -->
					<div class="tab-content">
						<div class="items">
							<div class="cl">&nbsp;</div>
							CANLI DESTEK
					</div>
				</div>
				<!-- Canlı Destek Sekmesi Bitiş -->
				
				<!-- Footer -->
				<div id="footer">
					<div class="left">
						<a href="admin.html">Panel Ana Sayfa</a>
						<span>|</span>
						<a href="index.html">Site Ana Sayfa</a>
						<span>|</span>
						<a href="#">Canlı Destek</a>
						
						
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
